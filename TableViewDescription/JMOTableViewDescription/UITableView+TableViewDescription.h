//
//  UITableView+TableViewDescription.h
//  TableViewDescription
//
//  Created by Jerome Morissard on 3/28/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JMOTableViewDescription;
@interface UITableView (TableViewDescription)

- (void)reloadDataFromDescription:(JMOTableViewDescription *)fromDescription toDescription:(JMOTableViewDescription *)toDescription animated:(BOOL)animated;

@end
