//
//  JMOTableViewSectionDescription.h
//  TableViewDescription
//
//  Created by Jerome Morissard on 3/20/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JMOTableViewRowDescription.h"

@interface JMOTableViewSectionDescription : NSObject

@property (strong, nonatomic) Class sectionClass;
@property (strong, nonatomic) NSString *sectionReuseIdentifier;
@property (assign, nonatomic) CGFloat sectionHeight;
@property (strong, nonatomic) id data;
@property (strong, nonatomic, readonly) NSMutableArray *rowDescriptions; //JMOTableViewRowDescription

- (void)addRowDescription:(JMOTableViewRowDescription *)rowDesc;

@end
