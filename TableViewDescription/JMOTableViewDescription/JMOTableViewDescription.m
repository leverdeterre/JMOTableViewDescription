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

        //register cellClass
        [sectionDesc.rowDescriptions enumerateObjectsUsingBlock:^(JMOTableViewRowDescription *cellDesc, NSUInteger idx, BOOL *stop) {
            
            if (cellDesc.cellNibName.length) {
                [self registerNibName:cellDesc.cellNibName withIdentifier:cellDesc.cellReuseIdentifier inTableView:tableView];
            
            } else if (cellDesc.cellClass) {
                [self registerCellClass:cellDesc.cellClass withIdentifier:cellDesc.cellReuseIdentifier inTableView:tableView];
            }
        }];
    }];
}

- (void)registerNibName:(NSString *)nibName withIdentifier:(NSString *)cellIdentifier inTableView:(UITableView *)tableView
{
    [tableView registerNib:[UINib nibWithNibName:nibName bundle:nil] forCellReuseIdentifier:cellIdentifier];
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

- (void)moveRowAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)newIndexPath
{
    JMOTableViewSectionDescription *tableSection =  self.sectionsDescription[indexPath.section];
    JMOTableViewRowDescription *rowDesc = tableSection.rowDescriptions[indexPath.row];
//NSLog(@"section %ld -> nbRow %ld",(long)indexPath.section, (long)tableSection.rowDescriptions.count);
    [tableSection.rowDescriptions removeObject:rowDesc];
//NSLog(@"section %ld -> nbRow %ld",(long)indexPath.section, (long)tableSection.rowDescriptions.count);

    JMOTableViewSectionDescription *nwTableSection =  self.sectionsDescription[newIndexPath.section];
    if (newIndexPath.row == 0) {
        [nwTableSection.rowDescriptions insertObject:rowDesc atIndex:0];
    } else {
        [nwTableSection.rowDescriptions insertObject:rowDesc atIndex:newIndexPath.row];
    }
    
//NSLog(@"section %ld -> nbRow %ld",(long)indexPath.section, (long)nwTableSection.rowDescriptions.count);
}

- (void)moveSection:(NSInteger)section toSection:(NSInteger)newSection
{
    JMOTableViewSectionDescription *tableSection =  self.sectionsDescription[section];
    [self.sectionsDescription removeObject:tableSection];
    if (newSection == 0) {
        [self.sectionsDescription insertObject:tableSection atIndex:0];
    } else {
        [self.sectionsDescription insertObject:tableSection atIndex:newSection-1];
    }
}

- (CGFloat)cumulatedHeights
{
    __block CGFloat cumulatedHeight = 0.0f;
    [self.sectionsDescription enumerateObjectsUsingBlock:^(JMOTableViewSectionDescription *sectionDescription, NSUInteger idx, BOOL * stop) {
        cumulatedHeight = cumulatedHeight + sectionDescription.sectionHeight;
        
        [sectionDescription.rowDescriptions enumerateObjectsUsingBlock:^(JMOTableViewRowDescription *rowDescription, NSUInteger idx, BOOL * stop) {
            cumulatedHeight = cumulatedHeight + rowDescription.cellHeight;
        }];
    }];
    
    return cumulatedHeight;
}

@end
