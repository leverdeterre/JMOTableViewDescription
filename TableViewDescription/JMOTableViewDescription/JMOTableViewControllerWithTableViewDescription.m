//
//  JMOTableViewControllerWithTableViewDescription.m
//  TableViewDescription
//
//  Created by Jerome Morissard on 6/9/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import "JMOTableViewControllerWithTableViewDescription.h"
#import "JMOTableViewDescription.h"
#import "JMOTableViewDescriptionUI.h"

//protocols
#import "JMOTableViewDescriptionCellUpdate.h"
#import "JMOTableViewDescriptionSectionUpdate.h"

@interface JMOTableViewControllerWithTableViewDescription ()
@end

@implementation JMOTableViewControllerWithTableViewDescription

#pragma mark - Overided setters

- (void)setTableViewDescription:(JMOTableViewDescription *)tableViewDescription
{
    [self setTableViewDescription:tableViewDescription animated:YES];
}

- (void)setTableViewDescription:(JMOTableViewDescription *)tableViewDescription animated:(BOOL)animated
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if (_tableViewDescription.sectionsDescription.count == 0) {
            _tableViewDescription = tableViewDescription;
            [self.tableViewDescription registerClassesInTableView:self.tableView];
            [self.tableView reloadData];
            
        } else {
            JMOTableViewDescription *oldDescription = _tableViewDescription;
            _tableViewDescription = tableViewDescription;
            [self.tableViewDescription registerClassesInTableView:self.tableView];
            [self.tableView reloadDataFromDescription:oldDescription toDescription:_tableViewDescription animated:animated];
        }
    });
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.tableViewDescription.sectionsDescription.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    JMOTableViewSectionDescription *tableSection = self.tableViewDescription.sectionsDescription[section];
    return tableSection.rowDescriptions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell <JMOTableViewDescriptionCellUpdate> *cellToReturn;
    JMOTableViewRowDescription *rowDesc = [self.tableViewDescription rowDescriptionForIndexPath:indexPath];
    cellToReturn = [self.tableView dequeueReusableCellWithIdentifier:rowDesc.cellReuseIdentifier];
    if ([cellToReturn respondsToSelector:@selector(updateCellWithDescriptionData:)]) {
        [cellToReturn updateCellWithDescriptionData:rowDesc.data];
    }
    return cellToReturn;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JMOTableViewRowDescription *rowDesc = [self.tableViewDescription rowDescriptionForIndexPath:indexPath];
    return rowDesc.cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    JMOTableViewSectionDescription *sectionDesc = [self.tableViewDescription sectionDescriptionForSection:section];
    return sectionDesc.sectionHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    JMOTableViewSectionDescription *sectionDesc = [self.tableViewDescription sectionDescriptionForSection:section];
    UIView <JMOTableViewDescriptionSectionUpdate> *sectionView;
    NSString *reuseIdentifier = nil;
    if (sectionDesc.sectionReuseIdentifier) {
        reuseIdentifier = sectionDesc.sectionReuseIdentifier;
    } else if (sectionDesc.sectionClass) {
        reuseIdentifier = NSStringFromClass(sectionDesc.sectionClass);
    }
    
    if (reuseIdentifier) {
        if([self.tableView respondsToSelector:@selector(dequeueReusableHeaderFooterViewWithIdentifier:)]) {
            sectionView = [self.tableView dequeueReusableHeaderFooterViewWithIdentifier:reuseIdentifier];
            if ([sectionView respondsToSelector:@selector(updateSectionWithDescriptionData:)]) {
                [sectionView updateSectionWithDescriptionData:sectionDesc.data];
            }
        }
    }
    
    return sectionView;
}

#pragma mark - JMOTableViewDescriptionDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self respondsToSelector:@selector(tableView:didSelectDataDescription:)]) {
        JMOTableViewRowDescription *rowDesc = [self.tableViewDescription rowDescriptionForIndexPath:indexPath];
        [self tableView:tableView didSelectDataDescription:rowDesc.data];
        return;
    }
}

@end
