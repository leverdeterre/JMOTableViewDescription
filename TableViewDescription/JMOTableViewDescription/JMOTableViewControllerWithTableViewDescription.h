//
//  JMOTableViewControllerWithTableViewDescription.h
//  TableViewDescription
//
//  Created by Jerome Morissard on 6/9/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JMOTableViewDescription;

@interface JMOTableViewControllerWithTableViewDescription : UITableViewController

@property (strong, nonatomic) JMOTableViewDescription *tableViewDescription;

- (void)setTableViewDescription:(JMOTableViewDescription *)tableViewDescription animated:(BOOL)animated;

@end
