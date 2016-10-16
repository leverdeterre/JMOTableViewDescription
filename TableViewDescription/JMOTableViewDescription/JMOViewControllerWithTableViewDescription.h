//
//  JMOViewControllerWithTableViewDescription.h
//  TableViewDescription
//
//  Created by Jerome Morissard on 6/9/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JMOTableViewDescriptionDelegate.h"

@class JMOTableViewDescription;

@interface JMOViewControllerWithTableViewDescription : UIViewController <UITableViewDataSource, JMOTableViewDescriptionDelegate>

@property (nullable, strong, nonatomic) JMOTableViewDescription *tableViewDescription;

- (void)setTableViewDescription:(nullable JMOTableViewDescription *)tableViewDescription animated:(BOOL)animated;

@end
