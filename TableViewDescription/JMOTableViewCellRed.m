//
//  JMOTableViewCellRed.m
//  TableViewDescription
//
//  Created by Jerome Morissard on 3/28/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import "JMOTableViewCellRed.h"

@implementation JMOTableViewCellRed

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self.contentView setBackgroundColor:[UIColor redColor]];

    }
    return self;
}

@end
