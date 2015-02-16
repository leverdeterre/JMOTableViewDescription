//
//  JMOTableViewDescriptionCellUpdate.h
//  TableViewDescription
//
//  Created by Jerome Morissard on 6/9/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JMOTableViewRowDescription;
@protocol JMOTableViewDescriptionCellUpdate <NSObject>

@optional
- (void)updateCellWithData:(id)data;
- (void)updateCellWithDescription:(JMOTableViewRowDescription *)description;

@end
