//
//  JMOTableViewCellBlue.m
//  TableViewDescription
//
//  Created by Jerome Morissard on 3/28/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import "JMOTableViewCellBlue.h"

@implementation JMOTableViewCellBlue

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self.textLabel setTextColor:[UIColor blueColor]];
        [self.textLabel setBackgroundColor:[UIColor clearColor]];
        [self.contentView setBackgroundColor:[[UIColor blueColor] colorWithAlphaComponent:0.15]];
        [self setBackgroundColor:[[UIColor blueColor] colorWithAlphaComponent:0.15]];
    }
    return self;
}

@end
