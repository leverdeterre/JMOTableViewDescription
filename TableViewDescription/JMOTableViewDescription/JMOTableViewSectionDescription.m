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
