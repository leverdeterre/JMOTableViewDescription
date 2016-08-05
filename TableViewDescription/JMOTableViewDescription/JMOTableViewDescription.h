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

@property (strong, nonatomic, nullable) NSMutableArray <JMOTableViewSectionDescription *> *sectionsDescription;

- (void)registerClassesInTableView:(nonnull UITableView *)tableView;

- (nullable JMOTableViewSectionDescription *)sectionDescriptionForSection:(NSInteger)section;
- (nullable JMOTableViewRowDescription *)rowDescriptionForIndexPath:(nonnull NSIndexPath *)indexPath;

- (void)moveRowAtIndexPath:(nonnull NSIndexPath *)indexPath toIndexPath:(nonnull NSIndexPath *)newIndexPath;
- (void)moveSection:(NSInteger)section toSection:(NSInteger)newSection;

/*
- (void)insertSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation;
- (void)deleteSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation;
- (void)reloadSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation NS_AVAILABLE_IOS(3_0);
- (void)moveSection:(NSInteger)section toSection:(NSInteger)newSection NS_AVAILABLE_IOS(5_0);

- (void)insertRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;
- (void)deleteRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;
- (void)reloadRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation NS_AVAILABLE_IOS(3_0);
- (void)moveRowAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)newIndexPath NS_AVAILABLE_IOS(5_0);
*/

@property (assign, nonatomic, readonly) CGFloat cumulatedHeights;

@end
