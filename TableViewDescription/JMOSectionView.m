//
//  JMOSectionView.m
//  TableViewDescription
//
//  Created by Jerome Morissard on 6/9/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import "JMOSectionView.h"

@interface JMOSectionView ()
@property (weak, nonatomic) UILabel *label;
@end

@implementation JMOSectionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UILabel *sectionLabel = [[UILabel alloc] initWithFrame:frame];
        [sectionLabel setBackgroundColor:[UIColor clearColor]];
        sectionLabel.textAlignment = NSTextAlignmentCenter;
        sectionLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.contentView addSubview:sectionLabel];
        [self setBackgroundColor:[UIColor whiteColor]];
        self.label = sectionLabel;
    }
    return self;
}

#pragma mark - JMOTableViewDescriptionSectionUpdate

- (void)updateSectionWithDescriptionData:(id)data
{
    self.label.text = data;
}


@end
