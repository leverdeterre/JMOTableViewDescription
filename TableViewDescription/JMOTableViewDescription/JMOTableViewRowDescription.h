//
//  JMOTableViewRowDescription.h
//  TableViewDescription
//
//  Created by Jerome Morissard on 3/20/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JMOTableViewRowDescription : NSObject

@property (strong, nonatomic, nullable) Class cellClass;
@property (strong, nonatomic, nullable) NSString *cellReuseIdentifier;
@property (strong, nonatomic, nullable) id data;
@property (assign, nonatomic) CGFloat cellHeight;
@property (strong, nonatomic, nullable) NSString *cellNibName;

@end
