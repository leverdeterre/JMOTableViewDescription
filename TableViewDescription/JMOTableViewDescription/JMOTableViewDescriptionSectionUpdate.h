//
//  JMOTableViewDescriptionSectionUpdate.h
//  TableViewDescription
//
//  Created by Jerome Morissard on 6/9/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JMOTableViewSectionDescription;
@protocol JMOTableViewDescriptionSectionUpdate <NSObject>

@optional
- (void)updateSectionWithData:(id)data;
- (void)updateSectionWithDescription:(JMOTableViewSectionDescription *)description;

@end
