//
//  JMOTableViewRowDescription.h
//  TableViewDescription
//
//  Created by Jerome Morissard on 3/20/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JMOTableViewRowDescription : NSObject

@property (strong, nonatomic, nullable) Class cellClass;
@property (strong, nonatomic, nullable) NSString *cellReuseIdentifier;
@property (strong, nonatomic, nullable) id data;
@property (assign, nonatomic) CGFloat cellHeight;
@property (strong, nonatomic, nullable) UINib *nib;

+ (nonnull instancetype)rowDescriptionWithReuseIdentifier:(nonnull NSString *)reuseIdentifier
                                          nibName:(nonnull NSString *)cellNibName
                                       cellHeight:(CGFloat)cellHeight;

+ (nonnull instancetype)rowDescriptionWithReuseIdentifier:(nonnull NSString *)reuseIdentifier
                                                cellClass:(_Nonnull Class)cellClass
                                               cellHeight:(CGFloat)cellHeight;

+ (nonnull instancetype)rowDescriptionWithReuseIdentifier:(nonnull NSString *)reuseIdentifier
                                                nib:(nonnull UINib *)nib
                                               cellHeight:(CGFloat)cellHeight;
    
@end
