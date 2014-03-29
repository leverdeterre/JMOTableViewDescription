//
//  JMOViewController.m
//  TableViewDescription
//
//  Created by Jerome Morissard on 3/20/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import "JMOViewController.h"
#import "JMODemoTableViewDescription.h"
#import "JMOTableViewSectionDescription.h"
#import "UITableView+TableViewDescription.h"

#import "JMOTableViewCellRed.h"
#import "JMOTableViewCellBlue.h"
#import "JMOTableViewCellGreen.h"

@interface JMOViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISwitch *toggle;
@property (strong, nonatomic) JMODemoTableViewDescription *tableViewDescription;
@property (assign, nonatomic) NSInteger num;
@end

@implementation JMOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.num = 0;
    [self changeDataToConfigNumber:self.num];
}

#pragma mark - IBActions

- (IBAction)changeDataPressed:(id)sender
{
    self.num++;
    if (self.num > 4) {
        self.num = 0;
    }
    [self changeDataToConfigNumber:self.num];
}

- (void)changeDataToConfigNumber:(NSInteger)num
{    
    JMODemoTableViewDescription *config = [JMODemoTableViewDescription descriptionNumber:num];
    JMODemoTableViewDescription *oldConfig = self.tableViewDescription;
    self.tableViewDescription = config;
    [self.tableViewDescription registerCellClassesIntoTableView:self.tableView];
    [self.tableView reloadDataFromDescription:oldConfig toDescription:self.tableViewDescription animated:[self.toggle isOn]];
}

#pragma mark - UITableViewDataSource/UITableViewDelegate

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
    UITableViewCell *cellToReturn;
    JMOTableViewRowDescription *rowDesc = [self.tableViewDescription rowDescriptionForIndexPath:indexPath];
    
    if (rowDesc.cellClass == [JMOTableViewCellBlue class] ||
        rowDesc.cellClass == [JMOTableViewCellRed class] ||
        rowDesc.cellClass == [JMOTableViewCellGreen class]) {
        cellToReturn = [self.tableView dequeueReusableCellWithIdentifier:rowDesc.cellReuseIdentifier];
        cellToReturn.textLabel.text  = rowDesc.data;
    }
    else {
        cellToReturn = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rowDesc.cellReuseIdentifier];
        cellToReturn.textLabel.text = rowDesc.data;
    }
    
    return cellToReturn;
}

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
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.frame), sectionDesc.sectionHeight)];
    UILabel *sectionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.frame), sectionDesc.sectionHeight)];
    [sectionLabel setBackgroundColor:[UIColor clearColor]];
    sectionLabel.text = sectionDesc.sectionTitle;
    sectionLabel.textAlignment = NSTextAlignmentCenter;
    [sectionView addSubview:sectionLabel];
    [sectionView setBackgroundColor:[UIColor whiteColor]];
    return sectionView;
}

@end
