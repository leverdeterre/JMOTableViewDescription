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

#pragma mark -

- (void)registerCellClassesIntoTableView:(UITableView *)tableView
{
    [self.sectionsDescription enumerateObjectsUsingBlock:^(JMOTableViewSectionDescription *obj, NSUInteger idx, BOOL *stop) {
        [obj.rowDescriptions enumerateObjectsUsingBlock:^(JMOTableViewRowDescription *obj, NSUInteger idx, BOOL *stop) {
            [tableView registerClass:obj.cellClass forCellReuseIdentifier:obj.cellReuseIdentifier];
        }];
    }];
}

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
