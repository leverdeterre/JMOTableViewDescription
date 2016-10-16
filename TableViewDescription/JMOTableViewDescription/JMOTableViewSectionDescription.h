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
@property (strong, nonatomic, nullable) UINib *nib;
@property (strong, nonatomic, nullable) NSString *sectionReuseIdentifier;
@property (assign, nonatomic) CGFloat sectionHeight;
@property (strong, nonatomic, nullable) id data;
@property (strong, nonatomic, readonly, nullable) NSMutableArray <JMOTableViewRowDescription *> *rowDescriptions;

- (void)addRowDescription:(nonnull JMOTableViewRowDescription *)rowDesc;

+ (nonnull instancetype)sectionDescriptionWithReuseIdentifier:(nonnull NSString *)reuseIdentifier
                                                  nibName:(nonnull NSString *)sectionNibName
                                               sectionHeight:(CGFloat)sectionHeight;

+ (nonnull instancetype)sectionDescriptionWithReuseIdentifier:(nonnull NSString *)reuseIdentifier
                                                      cellClass:(_Nonnull Class)sectionClass
                                                   sectionHeight:(CGFloat)sectionHeight;
    
+ (nonnull instancetype)sectionDescriptionWithReuseIdentifier:(nonnull NSString *)reuseIdentifier
                                                    nib:(nonnull UINib *)nib
                                                   sectionHeight:(CGFloat)sectionHeight;
    
@end
