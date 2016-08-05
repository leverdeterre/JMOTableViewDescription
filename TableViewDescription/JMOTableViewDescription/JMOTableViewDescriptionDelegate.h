//
//  JMOTableViewDescriptionDelegate.h
//  TableViewDescription
//
//  Created by Jerome Morissard on 6/9/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JMOTableViewRowDescription;
@class JMOTableViewSectionDescription;
@protocol JMOTableViewDescriptionDelegate <UITableViewDelegate>

@optional
- (void)tableView:(nonnull UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath rowDescription:(nonnull JMOTableViewRowDescription *)rowDescription;
- (void)tableView:(nonnull UITableView *)tableView didSelectSectionAtIndex:(NSInteger)index sectionDescription:(nonnull JMOTableViewSectionDescription *)sectionDescription;

@end
