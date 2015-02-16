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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath rowDescription:(JMOTableViewRowDescription *)rowDescription;
- (void)tableView:(UITableView *)tableView didSelectSectionAtIndex:(NSInteger)index sectionDescription:(JMOTableViewSectionDescription *)sectionDescription;
@end
