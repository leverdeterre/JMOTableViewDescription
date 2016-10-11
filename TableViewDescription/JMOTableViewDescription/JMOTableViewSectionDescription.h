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

@property (strong, nonatomic, nullable) Class sectionClass;
@property (strong, nonatomic, nullable) NSString *sectionNibName;
@property (strong, nonatomic, nullable) NSString *sectionReuseIdentifier;
@property (assign, nonatomic) CGFloat sectionHeight;
@property (strong, nonatomic, nullable) id data;
@property (strong, nonatomic, readonly, nullable) NSMutableArray <JMOTableViewRowDescription *> *rowDescriptions;

- (void)addRowDescription:(nonnull JMOTableViewRowDescription *)rowDesc;

@end
