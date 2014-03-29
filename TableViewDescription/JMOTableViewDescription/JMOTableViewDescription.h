//
//  JMOTableViewDescription.h
//  TableViewDescription
//
//  Created by Jerome Morissard on 3/20/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//  Version 0.1

#import <Foundation/Foundation.h>

#import "JMOTableViewSectionDescription.h"
#import "JMOTableViewRowDescription.h"
#import "UITableView+TableViewDescription.h"

@interface JMOTableViewDescription : NSObject

@property (strong, nonatomic) NSMutableArray *sectionsDescription;

- (void)registerCellClassesIntoTableView:(UITableView *)tableView;

- (JMOTableViewSectionDescription *)sectionDescriptionForSection:(NSInteger)section;
- (JMOTableViewRowDescription *)rowDescriptionForIndexPath:(NSIndexPath *)indexPath;

@end
