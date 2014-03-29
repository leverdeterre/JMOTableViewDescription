//
//  JMODemoTableViewDescription.m
//  TableViewDescription
//
//  Created by Jerome Morissard on 3/20/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import "JMODemoTableViewDescription.h"
#import "JMOTableViewSectionDescription.h"

#import "JMOTableViewCellRed.h"
#import "JMOTableViewCellBlue.h"
#import "JMOTableViewCellGreen.h"

@implementation JMODemoTableViewDescription


+ (JMODemoTableViewDescription *)descriptionNumber:(NSInteger)number
{
    if (number == 4) {
        JMODemoTableViewDescription *desc = [JMODemoTableViewDescription new];
        JMOTableViewSectionDescription *oneSection = [JMOTableViewSectionDescription new];
        oneSection.sectionTitle = @"";
        oneSection.sectionHeight = 0.0f;
        
        JMOTableViewRowDescription *oneRow = [JMOTableViewRowDescription new];
        oneRow.cellClass = [UITableViewCell class];
        oneRow.cellHeight = 30.0f;
        oneRow.cellTitle = nil;
        oneRow.cellReuseIdentifier = @"UITableViewCellIdentifier";
        oneRow.data = @"My Fake 1st section";
        [oneSection addRowDescription:oneRow];
        
        oneRow = [JMOTableViewRowDescription new];
        oneRow.cellClass = [JMOTableViewCellBlue class];
        oneRow.cellHeight = 44.0f;
        oneRow.cellTitle = @"";
        oneRow.cellReuseIdentifier = @"JMOTableViewCellBlue";
        oneRow.data = [NSString stringWithFormat:@"%@ (%d)",oneRow.cellReuseIdentifier,(int)oneRow.cellHeight];
        [oneSection addRowDescription:oneRow];
        
        oneRow = [JMOTableViewRowDescription new];
        oneRow.cellClass = [JMOTableViewCellRed class];
        oneRow.cellHeight = 44.0f;
        oneRow.cellTitle = @"";
        oneRow.cellReuseIdentifier = @"JMOTableViewCellRed";
        oneRow.data = [NSString stringWithFormat:@"%@ (%d)",oneRow.cellReuseIdentifier,(int)oneRow.cellHeight];
        [oneSection addRowDescription:oneRow];
        
        JMOTableViewSectionDescription *secondSection = [JMOTableViewSectionDescription new];
        oneSection.sectionTitle = @"";
        oneSection.sectionHeight = 0.0f;
        
        oneRow = [JMOTableViewRowDescription new];
        oneRow.cellClass = [UITableViewCell class];
        oneRow.cellHeight = 30.0f;
        oneRow.cellTitle = nil;
        oneRow.cellReuseIdentifier = @"UITableViewCellIdentifier";
        oneRow.data = @"My Fake 2nd section";
        [secondSection addRowDescription:oneRow];
        
        oneRow = [JMOTableViewRowDescription new];
        oneRow.cellClass = [JMOTableViewCellGreen class];
        oneRow.cellHeight = 44.0f;
        oneRow.cellTitle = @"";
        oneRow.cellReuseIdentifier = @"JMOTableViewCellGreen";
        oneRow.data = [NSString stringWithFormat:@"%@ (%d)",oneRow.cellReuseIdentifier,(int)oneRow.cellHeight];
        [secondSection addRowDescription:oneRow];
        
        oneRow = [JMOTableViewRowDescription new];
        oneRow.cellClass = [JMOTableViewCellBlue class];
        oneRow.cellHeight = 44.0f;
        oneRow.cellTitle = @"";
        oneRow.cellReuseIdentifier = @"JMOTableViewCellBlue";
        oneRow.data = [NSString stringWithFormat:@"%@ (%d)",oneRow.cellReuseIdentifier,(int)oneRow.cellHeight];
        [secondSection addRowDescription:oneRow];
        
        oneRow = [JMOTableViewRowDescription new];
        oneRow.cellClass = [JMOTableViewCellRed class];
        oneRow.cellHeight = 80.0f;
        oneRow.cellTitle = @"";
        oneRow.cellReuseIdentifier = @"JMOTableViewCellRed";
        oneRow.data = [NSString stringWithFormat:@"%@ (%d)",oneRow.cellReuseIdentifier,(int)oneRow.cellHeight];
        [secondSection addRowDescription:oneRow];
        
        oneRow = [JMOTableViewRowDescription new];
        oneRow.cellClass = [JMOTableViewCellGreen class];
        oneRow.cellHeight = 70.0f;
        oneRow.cellTitle = @"";
        oneRow.cellReuseIdentifier = @"JMOTableViewCellGreen";
        oneRow.data = [NSString stringWithFormat:@"%@ (%d)",oneRow.cellReuseIdentifier,(int)oneRow.cellHeight];
        [secondSection addRowDescription:oneRow];
        
        [desc.sectionsDescription addObject:oneSection];
        [desc.sectionsDescription addObject:secondSection];
        return desc;
    }
    
    
    JMODemoTableViewDescription *desc = [JMODemoTableViewDescription new];
    JMOTableViewSectionDescription *oneSection = [JMOTableViewSectionDescription new];
    oneSection.sectionTitle = @"This is my 1St section";
    oneSection.sectionHeight = 30.0f;
    
    JMOTableViewRowDescription *oneRow = [JMOTableViewRowDescription new];
    oneRow.cellClass = [JMOTableViewCellBlue class];
    oneRow.cellHeight = 44.0f;
    oneRow.cellTitle = @"";
    oneRow.cellReuseIdentifier = @"JMOTableViewCellBlue";
    oneRow.data = [NSString stringWithFormat:@"%@ (%d)",oneRow.cellReuseIdentifier,(int)oneRow.cellHeight];
    [oneSection addRowDescription:oneRow];
    
    oneRow = [JMOTableViewRowDescription new];
    oneRow.cellClass = [JMOTableViewCellBlue class];
    oneRow.cellHeight = 69.0f;
    oneRow.cellTitle = @"";
    oneRow.cellReuseIdentifier = @"JMOTableViewCellBlue";
    oneRow.data = [NSString stringWithFormat:@"%@ (%d)",oneRow.cellReuseIdentifier,(int)oneRow.cellHeight];
    [oneSection addRowDescription:oneRow];
    
    if (number == 1) {
        JMOTableViewRowDescription *oneRow = [JMOTableViewRowDescription new];
        oneRow = [JMOTableViewRowDescription new];
        oneRow.cellClass = [JMOTableViewCellRed class];
        oneRow.cellHeight = 44.0f;
        oneRow.cellTitle = @"";
        oneRow.cellReuseIdentifier = @"JMOTableViewCellRed";
        oneRow.data = [NSString stringWithFormat:@"%@ (%d)",oneRow.cellReuseIdentifier,(int)oneRow.cellHeight];
        [oneSection addRowDescription:oneRow];
    }
    
    oneRow = [JMOTableViewRowDescription new];
    oneRow.cellClass = [JMOTableViewCellBlue class];
    oneRow.cellHeight = 60.0f;
    oneRow.cellTitle = @"";
    oneRow.cellReuseIdentifier = @"JMOTableViewCellBlue";
    oneRow.data = [NSString stringWithFormat:@"%@ (%d)",oneRow.cellReuseIdentifier,(int)oneRow.cellHeight];
    [oneSection addRowDescription:oneRow];
    
    if (number == 2) {
        JMOTableViewRowDescription *oneRow = [JMOTableViewRowDescription new];
        oneRow = [JMOTableViewRowDescription new];
        oneRow.cellClass = [JMOTableViewCellGreen class];
        oneRow.cellHeight = 150.0f;
        oneRow.cellTitle = @"";
        oneRow.cellReuseIdentifier = @"JMOTableViewCellGreen";
        oneRow.data = [NSString stringWithFormat:@"%@ (%d)",oneRow.cellReuseIdentifier,(int)oneRow.cellHeight];
        [oneSection addRowDescription:oneRow];
    }
    
    oneRow = [JMOTableViewRowDescription new];
    oneRow.cellClass = [JMOTableViewCellBlue class];
    oneRow.cellHeight = 30.0f;
    oneRow.cellTitle = @"";
    oneRow.cellReuseIdentifier = @"JMOTableViewCellBlue";
    oneRow.data = [NSString stringWithFormat:@"%@ (%d)",oneRow.cellReuseIdentifier,(int)oneRow.cellHeight];
    [oneSection addRowDescription:oneRow];
    
    if (number == 1) {
        JMOTableViewRowDescription *oneRow = [JMOTableViewRowDescription new];
        oneRow = [JMOTableViewRowDescription new];
        oneRow.cellClass = [JMOTableViewCellRed class];
        oneRow.cellHeight = 44.0f;
        oneRow.cellTitle = @"";
        oneRow.cellReuseIdentifier = @"JMOTableViewCellRed";
        oneRow.data = [NSString stringWithFormat:@"%@ (%d)",oneRow.cellReuseIdentifier,(int)oneRow.cellHeight];
        [oneSection addRowDescription:oneRow];
    }
    
    if (number == 2) {
        JMOTableViewRowDescription *oneRow = [JMOTableViewRowDescription new];
        oneRow = [JMOTableViewRowDescription new];
        oneRow.cellClass = [JMOTableViewCellGreen class];
        oneRow.cellHeight = 150.0f;
        oneRow.cellTitle = @"";
        oneRow.cellReuseIdentifier = @"JMOTableViewCellGreen";
        oneRow.data = [NSString stringWithFormat:@"%@ (%d)",oneRow.cellReuseIdentifier,(int)oneRow.cellHeight];
        [oneSection addRowDescription:oneRow];
    }
    
    oneRow = [JMOTableViewRowDescription new];
    oneRow.cellClass = [JMOTableViewCellBlue class];
    oneRow.cellHeight = 44.0f;
    oneRow.cellTitle = @"";
    oneRow.cellReuseIdentifier = @"JMOTableViewCellBlue";
    oneRow.data = [NSString stringWithFormat:@"%@ (%d)",oneRow.cellReuseIdentifier,(int)oneRow.cellHeight];
    [oneSection addRowDescription:oneRow];
    
    oneRow = [JMOTableViewRowDescription new];
    oneRow.cellClass = [JMOTableViewCellBlue class];
    oneRow.cellHeight = 44.0f;
    oneRow.cellTitle = @"";
    oneRow.cellReuseIdentifier = @"JMOTableViewCellBlue";
    oneRow.data = [NSString stringWithFormat:@"%@ (%d)",oneRow.cellReuseIdentifier,(int)oneRow.cellHeight];
    [oneSection addRowDescription:oneRow];
    
    if (number == 1) {
        JMOTableViewRowDescription *oneRow = [JMOTableViewRowDescription new];
        oneRow = [JMOTableViewRowDescription new];
        oneRow.cellClass = [JMOTableViewCellRed class];
        oneRow.cellHeight = 150.0f;
        oneRow.cellTitle = @"";
        oneRow.cellReuseIdentifier = @"JMOTableViewCellRed";
        oneRow.data = [NSString stringWithFormat:@"%@ (%d)",oneRow.cellReuseIdentifier,(int)oneRow.cellHeight];
        [oneSection addRowDescription:oneRow];
    }
    
    oneRow = [JMOTableViewRowDescription new];
    oneRow.cellClass = [JMOTableViewCellBlue class];
    oneRow.cellHeight = 20.0f;
    oneRow.cellTitle = @"";
    oneRow.cellReuseIdentifier = @"JMOTableViewCellBlue";
    oneRow.data = [NSString stringWithFormat:@"%@ (%d)",oneRow.cellReuseIdentifier,(int)oneRow.cellHeight];
    [oneSection addRowDescription:oneRow];
    
    oneRow = [JMOTableViewRowDescription new];
    oneRow.cellClass = [JMOTableViewCellBlue class];
    oneRow.cellHeight = 20.0f;
    oneRow.cellTitle = @"";
    oneRow.cellReuseIdentifier = @"JMOTableViewCellBlue";
    oneRow.data = [NSString stringWithFormat:@"%@ (%d)",oneRow.cellReuseIdentifier,(int)oneRow.cellHeight];
    [oneSection addRowDescription:oneRow];
    
    oneRow = [JMOTableViewRowDescription new];
    oneRow.cellClass = [JMOTableViewCellBlue class];
    oneRow.cellHeight = 300.0f;
    oneRow.cellTitle = @"";
    oneRow.cellReuseIdentifier = @"JMOTableViewCellBlue";
    oneRow.data = [NSString stringWithFormat:@"%@ (%d)",oneRow.cellReuseIdentifier,(int)oneRow.cellHeight];
    [oneSection addRowDescription:oneRow];
    
    desc.sectionsDescription = [@[oneSection]mutableCopy];
    
    if (number == 2) {
        JMOTableViewSectionDescription *secondSection = [JMOTableViewSectionDescription new];
        secondSection.sectionTitle = @"This is my 2nd section";
        secondSection.sectionHeight = 50.0f;
        
        JMOTableViewRowDescription *oneRow = [JMOTableViewRowDescription new];
        oneRow = [JMOTableViewRowDescription new];
        oneRow.cellClass = [JMOTableViewCellBlue class];
        oneRow.cellHeight = 20.0f;
        oneRow.cellTitle = @"";
        oneRow.cellReuseIdentifier = @"JMOTableViewCellBlue";
        oneRow.data = [NSString stringWithFormat:@"%@ (%d)",oneRow.cellReuseIdentifier,(int)oneRow.cellHeight];
        [secondSection addRowDescription:oneRow];
        
        oneRow = [JMOTableViewRowDescription new];
        oneRow = [JMOTableViewRowDescription new];
        oneRow.cellClass = [JMOTableViewCellBlue class];
        oneRow.cellHeight = 20.0f;
        oneRow.cellTitle = @"";
        oneRow.cellReuseIdentifier = @"JMOTableViewCellBlue";
        oneRow.data = [NSString stringWithFormat:@"%@ (%d)",oneRow.cellReuseIdentifier,(int)oneRow.cellHeight];
        [secondSection addRowDescription:oneRow];
        
        oneRow = [JMOTableViewRowDescription new];
        oneRow = [JMOTableViewRowDescription new];
        oneRow.cellClass = [JMOTableViewCellBlue class];
        oneRow.cellHeight = 20.0f;
        oneRow.cellTitle = @"";
        oneRow.cellReuseIdentifier = @"JMOTableViewCellBlue";
        oneRow.data = [NSString stringWithFormat:@"%@ (%d)",oneRow.cellReuseIdentifier,(int)oneRow.cellHeight];
        [secondSection addRowDescription:oneRow];

        [desc.sectionsDescription addObject:secondSection];
    }
    
    return desc;
}

@end
