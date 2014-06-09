//
//  JMOViewController.m
//  TableViewDescription
//
//  Created by Jerome Morissard on 3/20/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import "JMOViewController.h"
#import "JMOTableViewDescriptionHeaders.h"

#import "JMODemoTableViewDescription.h"
#import "JMOTableViewCellRed.h"
#import "JMOTableViewCellBlue.h"
#import "JMOTableViewCellGreen.h"

@interface JMOViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISwitch *toggle;
@property (assign, nonatomic) NSInteger num;
@end

@implementation JMOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
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
    if (self.toggle.isOn) {
        [self setTableViewDescription:config];
    } else {
        [self setTableViewDescription:config animated:NO];
    }
}

#pragma mark - JMOTableViewDescriptionViewController

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    
    //You can manage your own custom update
    if (cell.class == UITableViewCell.class) {
        JMOTableViewRowDescription *rowDesc = [self.tableViewDescription rowDescriptionForIndexPath:indexPath];
        cell.textLabel.text = rowDesc.data;
    } 
    return cell;
}

#pragma mark - JMOTableViewDescriptionDelegate

- (void)tableView:(UITableView *)tableView didSelectDataDescription:(id)selectedData
{
    JMOLog(@"Do something with selectedData : %@",selectedData);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"TableViewDescriptionDelegate" message:@"Do something with selected Data" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alert show];
}

@end
