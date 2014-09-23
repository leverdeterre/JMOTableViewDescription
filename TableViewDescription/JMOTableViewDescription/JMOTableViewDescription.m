//
//  JMOTableViewDescription.m
//  TableViewDescription
//
//  Created by Jerome Morissard on 3/20/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import "JMOTableViewDescription.h"
#import "JMOTableViewSectionDescription.h"

@implementation JMOTableViewDescription

- (id)init
{
    self = [super init];
    if (self) {
        _sectionsDescription = [NSMutableArray array];
    }
    
    return self;
}

- (NSString *)description
{
    NSMutableString *mutaString = [NSMutableString new];
    
    for (int i = 0; i < self.sectionsDescription.count; i++) {
        [mutaString appendFormat:@"%@",self.sectionsDescription[i]];
    }
    
    return mutaString;
}

#pragma mark - Registering Cells and Headers/footers

- (void)registerClassesInTableView:(UITableView *)tableView
{
    [self.sectionsDescription enumerateObjectsUsingBlock:^(JMOTableViewSectionDescription *sectionDesc, NSUInteger idx, BOOL *stop) {
        //register sectionClass
        [self registerHeaderFooterClass:sectionDesc.sectionClass withIdentifier:sectionDesc.sectionReuseIdentifier inTableView:tableView];

        //register cellClass / Xibs
        [sectionDesc.rowDescriptions enumerateObjectsUsingBlock:^(JMOTableViewRowDescription *cellDesc, NSUInteger idx, BOOL *stop) {
            if (cellDesc.cellClass && cellDesc.cellReuseIdentifier) {
                [self registerCellClass:cellDesc.cellClass withIdentifier:cellDesc.cellReuseIdentifier inTableView:tableView];
                
            } else if (cellDesc.cellReuseIdentifier) {
                [self registerNibAssociatedToReuseIdentifier:cellDesc.cellReuseIdentifier inTableView:tableView];
            }
        }];
    }];
}

- (void)registerCellClass:(Class)cellClass withIdentifier:(NSString *)cellIdentifier inTableView:(UITableView *)tableView
{
    NSString *reuseIdentifier;
    if (cellIdentifier) {
        reuseIdentifier = cellIdentifier;
    } else if (cellClass) {
        reuseIdentifier = NSStringFromClass(cellClass);
    }
    
    if (cellClass && reuseIdentifier) {
        [tableView registerClass:cellClass forCellReuseIdentifier:reuseIdentifier];
    }
}

- (void)registerNibAssociatedToReuseIdentifier:(NSString *)cellIdentifier inTableView:(UITableView *)tableView
{
    UINib *nib = [UINib nibWithNibName:cellIdentifier bundle:nil];
    if (nib) {
        [tableView registerNib:nib forCellReuseIdentifier:cellIdentifier];
    }
}

- (void)registerHeaderFooterClass:(Class)sectionClass withIdentifier:(NSString *)sectionIdentifier inTableView:(UITableView *)tableView
{
    NSString *reuseIdentifier;
    if (sectionIdentifier) {
        reuseIdentifier = sectionIdentifier;
    } else if (sectionClass) {
        reuseIdentifier = NSStringFromClass(sectionClass);
    }
    
    if (sectionClass && reuseIdentifier) {
        [tableView registerClass:sectionClass forHeaderFooterViewReuseIdentifier:reuseIdentifier];
    }
}



#pragma mark - Helpers

- (JMOTableViewSectionDescription *)sectionDescriptionForSection:(NSInteger)section
{
    return self.sectionsDescription[section];
}

- (JMOTableViewRowDescription *)rowDescriptionForIndexPath:(NSIndexPath *)indexPath
{
    JMOTableViewSectionDescription *tableSection =  self.sectionsDescription[indexPath.section];
    JMOTableViewRowDescription *rowDesc = tableSection.rowDescriptions[indexPath.row];
    return rowDesc;
}

@end
