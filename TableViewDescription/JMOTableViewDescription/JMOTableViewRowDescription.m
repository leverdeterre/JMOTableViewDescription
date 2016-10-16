//
//  JMOTableViewRowDescription.m
//  TableViewDescription
//
//  Created by Jerome Morissard on 3/20/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import "JMOTableViewRowDescription.h"

@implementation JMOTableViewRowDescription

+ (nonnull instancetype)rowDescriptionWithReuseIdentifier:(nonnull NSString *)reuseIdentifier
                                                  nibName:(nonnull NSString *)cellNibName
                                               cellHeight:(CGFloat)cellHeight
{
    JMOTableViewRowDescription *desc = [[self.class alloc] init];
    desc.cellReuseIdentifier = reuseIdentifier;
    desc.nib = [UINib nibWithNibName:cellNibName bundle:[NSBundle mainBundle]];
    desc.cellHeight = cellHeight;
    return desc;
}

+ (nonnull instancetype)rowDescriptionWithReuseIdentifier:(nonnull NSString *)reuseIdentifier
                                                cellClass:(_Nonnull Class)cellClass
                                               cellHeight:(CGFloat)cellHeight
{
    JMOTableViewRowDescription *desc = [[self.class alloc] init];
    desc.cellReuseIdentifier = reuseIdentifier;
    desc.cellClass = cellClass;
    desc.cellHeight = cellHeight;
    return desc;
}
    
+ (nonnull instancetype)rowDescriptionWithReuseIdentifier:(nonnull NSString *)reuseIdentifier
                                                      nib:(nonnull UINib *)nib
                                                   cellHeight:(CGFloat)cellHeight
{
    JMOTableViewRowDescription *desc = [[self.class alloc] init];
    desc.cellReuseIdentifier = reuseIdentifier;
    desc.nib = nib;
    desc.cellHeight = cellHeight;
    return desc;
}

- (NSString *)description
{
    NSMutableString *mutaString = [NSMutableString new];
    [mutaString appendFormat:@"\n\tclass:%@",self.cellClass];
    [mutaString appendFormat:@"\n\tcellReuseIdentifier:%@",self.cellReuseIdentifier];
    [mutaString appendFormat:@"\n\tnib:%@",self.nib];
    return mutaString;
}

@end
