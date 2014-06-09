//
//  JMOTableViewCellGreen.m
//  TableViewDescription
//
//  Created by Jerome Morissard on 3/28/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import "JMOTableViewCellGreen.h"

@implementation JMOTableViewCellGreen

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self.textLabel setTextColor:[UIColor greenColor]];
        [self.textLabel setBackgroundColor:[UIColor clearColor]];
        [self.contentView setBackgroundColor:[[UIColor greenColor] colorWithAlphaComponent:0.15]];
        [self setBackgroundColor:[[UIColor greenColor] colorWithAlphaComponent:0.15]];

    }
    return self;
}

#pragma mark - JMOTableViewDescriptionCellUpdate

- (void)updateCellWithDescriptionData:(id)data
{
    self.textLabel.text = data;
}

@end
