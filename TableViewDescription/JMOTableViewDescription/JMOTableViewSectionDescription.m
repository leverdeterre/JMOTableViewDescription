//
//  JMOTableViewSectionDescription.m
//  TableViewDescription
//
//  Created by Jerome Morissard on 3/20/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import "JMOTableViewSectionDescription.h"

@implementation JMOTableViewSectionDescription

- (id)init
{
    self = [super init];
    if (self) {
        _rowDescriptions = [NSMutableArray new];
    }
    return self;
}

- (void)addRowDescription:(JMOTableViewRowDescription *)rowDesc
{
    [_rowDescriptions addObject:rowDesc];
}

+ (nonnull instancetype)sectionDescriptionWithReuseIdentifier:(nonnull NSString *)reuseIdentifier
                                                          nibName:(nonnull NSString *)sectionNibName
                                                       sectionHeight:(CGFloat)sectionHeight
{
    JMOTableViewSectionDescription *desc = [[self.class alloc] init];
    desc.sectionReuseIdentifier = reuseIdentifier;
    desc.sectionHeight = sectionHeight;
    desc.nib = [UINib nibWithNibName:sectionNibName bundle:[NSBundle mainBundle]];
    return desc;
}
    
+ (nonnull instancetype)sectionDescriptionWithReuseIdentifier:(nonnull NSString *)reuseIdentifier
                                                    cellClass:(_Nonnull Class)sectionClass
                                                   sectionHeight:(CGFloat)sectionHeight
{
    JMOTableViewSectionDescription *desc = [[self.class alloc] init];
    desc.sectionReuseIdentifier = reuseIdentifier;
    desc.sectionClass = sectionClass;
    desc.sectionHeight = sectionHeight;
    return desc;
}
    
+ (nonnull instancetype)sectionDescriptionWithReuseIdentifier:(nonnull NSString *)reuseIdentifier
                                                          nib:(nonnull UINib *)nib
                                                   sectionHeight:(CGFloat)sectionHeight
{
    JMOTableViewSectionDescription *desc = [[self.class alloc] init];
    desc.sectionReuseIdentifier = reuseIdentifier;
    desc.nib = nib;
    desc.sectionHeight = sectionHeight;
    return desc;
}
    
- (NSString *)description
{
    NSMutableString *mutaString = [NSMutableString new];
    [mutaString appendFormat:@"\nclass:%@",self.sectionClass];
    
    for (int i = 0; i < self.rowDescriptions.count; i++) {
        [mutaString appendFormat:@"%@",self.rowDescriptions[i]];
    }
    
    return mutaString;
}


@end
