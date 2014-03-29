//
//  UITableView+TableViewDescription.m
//  TableViewDescription
//
//  Created by Jerome Morissard on 3/28/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import "UITableView+TableViewDescription.h"
#import "JMOTableViewDescription.h"

@implementation UITableView (TableViewDescription)

- (void)reloadDataFromDescription:(JMOTableViewDescription *)fromDescription toDescription:(JMOTableViewDescription *)toDescription animated:(BOOL)animated
{
    if (animated == NO) {
        [self reloadData];
        return;
    }
    
    NSArray *fromSectionDescriptions = fromDescription.sectionsDescription;
    NSArray *toSectionDescriptions = toDescription.sectionsDescription;
    
    if (fromSectionDescriptions == nil || fromSectionDescriptions.count == 0) {
        [self reloadData];
        return;
    }
    
    [self beginUpdates];
    NSMutableArray *insertedSection = [NSMutableArray new];
    
    //Update sections
    if (fromSectionDescriptions.count > toSectionDescriptions.count) {
        NSMutableIndexSet *indexSetToRemove = [NSMutableIndexSet new];
        for (int i = 0; i < (fromSectionDescriptions.count - toSectionDescriptions.count) ; i++) {
            [indexSetToRemove addIndex:(fromSectionDescriptions.count -i -1)];
            NSLog(@"deleteSection %@",@(fromSectionDescriptions.count -i -1));
            
        }
        [self deleteSections:indexSetToRemove withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (fromSectionDescriptions.count < toSectionDescriptions.count) {
        NSMutableIndexSet *indexSetToadd = [NSMutableIndexSet new];
        for (int i = 0; i < ( toSectionDescriptions.count - fromSectionDescriptions.count) ; i++) {
            [indexSetToadd addIndex:(fromSectionDescriptions.count + i)];
            [insertedSection addObject:@(fromSectionDescriptions.count + i)];
            NSLog(@"insertSections %@",@(fromSectionDescriptions.count + i));
        }
        [self insertSections:indexSetToadd withRowAnimation:UITableViewRowAnimationFade];
    }
    else {
        //No changes of number of section
        NSLog(@"No changes of number of section");
    }
    
    //Update rows
    for (int i = 0; i < toSectionDescriptions.count; i++) {
        NSInteger previousRows = 0;
        NSInteger currentRows = 0;
        NSMutableArray *indexPathtsToRemove = [NSMutableArray new];
        NSMutableArray *indexPathtsToAdd = [NSMutableArray new];
        
        
        if (fromSectionDescriptions.count > i) {
            previousRows = (NSInteger)[[(JMOTableViewSectionDescription *)fromSectionDescriptions[i] rowDescriptions] count];
        }
        currentRows = (NSInteger)[[(JMOTableViewSectionDescription *)toSectionDescriptions[i] rowDescriptions] count];
        if (previousRows < currentRows) {
            for (int j = 0; j < (currentRows - previousRows) ; j++) {
                [indexPathtsToAdd addObject:[NSIndexPath indexPathForRow:j inSection:i]];
            }
        }
        else if (currentRows < previousRows) {
            for (int j = 0; j < (previousRows - currentRows) ; j++) {
                [indexPathtsToRemove addObject:[NSIndexPath indexPathForRow:j inSection:i]];
            }
        }
        
        //
        if (indexPathtsToRemove.count > 0) {
            NSLog(@"deleteRowsAtIndexPaths %@",indexPathtsToRemove);
            [self deleteRowsAtIndexPaths:indexPathtsToRemove withRowAnimation:UITableViewRowAnimationFade];
        }
        if (indexPathtsToAdd.count > 0) {
            NSLog(@"insertRowsAtIndexPaths %@",indexPathtsToAdd);
            [self insertRowsAtIndexPaths:indexPathtsToAdd withRowAnimation:UITableViewRowAnimationFade];
        }
    }
    
    //insertedSection
    NSMutableArray *indexPathtsToAdd = [NSMutableArray new];
    if (insertedSection.count > 0) {
        for (int i = 0; i < insertedSection.count; i++) {
            NSNumber *insertedSections = insertedSection[i];
            NSInteger numberOfRows = [[(JMOTableViewSectionDescription *)toSectionDescriptions[[insertedSections integerValue]] rowDescriptions] count];
            
            for (int j = 0; j < numberOfRows; j++) {
                [indexPathtsToAdd addObject:[NSIndexPath indexPathForRow:j inSection:[insertedSections integerValue]]];
            }
        }
        
        NSLog(@"insertRowsAtIndexPaths %@",indexPathtsToAdd);
        [self insertRowsAtIndexPaths:indexPathtsToAdd withRowAnimation:UITableViewRowAnimationFade];
    }
    
    [self endUpdates];
    
    //Reload all indexPath
    NSMutableArray *indexPathsToReload = [NSMutableArray new];
    for (int i = 0; i < toDescription.sectionsDescription.count; i++) {
        JMOTableViewSectionDescription *sectionDesc = toDescription.sectionsDescription[i];
        for (int j = 0; j < sectionDesc.rowDescriptions.count; j++) {
            NSIndexPath *indexP = [NSIndexPath indexPathForRow:j inSection:i];
            [indexPathsToReload addObject:indexP];
        }
    }
    
    if (indexPathsToReload.count > 0) {
        [self reloadRowsAtIndexPaths:indexPathsToReload withRowAnimation:UITableViewRowAnimationAutomatic];
    }

}

@end
