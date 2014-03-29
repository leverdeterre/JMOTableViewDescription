//
//  JMOTableViewRowDescription.m
//  TableViewDescription
//
//  Created by Jerome Morissard on 3/20/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import "JMOTableViewRowDescription.h"

@implementation JMOTableViewRowDescription

- (NSString *)description
{
    NSMutableString *mutaString = [NSMutableString new];
    [mutaString appendFormat:@"\n\tclass:%@",self.cellClass];
    return mutaString;
}

@end
