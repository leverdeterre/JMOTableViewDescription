## My other works

[http://leverdeterre.github.io] (http://leverdeterre.github.io)


# Purpose

JMOTableViewDescription is an Objective-C library for easily creating and manage complex structured tableView.

![Image](screenshots/concept.png)

Why this project?
* TableView protocols are simple but not adapted to manipulate heterogenous objets or cells in your TableView.
* Some situations can lead to very complicated algorithms to construct the right TableViewCell to present a particular object.

This project present:
* A new way to describe your tableView "layout" with a very simple method (a model),
* Datasource / Delegate considerably simplified by using this model,
* It's a very simple way to produce a "grouped tableView" style without having to use grouped stype!
* The code produced using this implementation his highly customizable, reusable and flexible. (No more bugs?)
* TableView delegate and datasource focus on manipulated objet, no indexPath!, 
* HeaderView reuse ? Replace your header by a cell, your first row :) 

# Supported iOS & SDK Versions

* Supported build target - iOS 8 (Xcode 6 beta)
* Earliest supported deployment target - iOS 6.0
* Earliest compatible deployment target - iOS 6.0

NOTE: 'Supported' means that the library has been tested with this version. 'Compatible' means that the library should work on this iOS version (i.e. it doesn't rely on any unavailable SDK features) but is no longer being tested for compatibility and may require tweaking or bug fixes to run correctly.


## Versions

###### 0.1, Initial release
###### 0.2  
* Add methods to automaticly register cells and header/footer views.
* Add ViewControllers with generic implementations of UITableViewDatasource/delegate
  (JMOViewControllerWithTableViewDescription, JMOTableViewControllerWithTableViewDescription).
* Add protocols to update Cells, Footers, Headers with data stored into the element description
  ( updateCellWithDescriptionData:(id)data && updateSectionWithDescriptionData:(id)data ).
* Add new protocol : JMOTableViewDescriptionDelegate, to be focus on data not on indexPath.

# How to use it ?
 * Implement your own JMODemoTableViewDescription,
```objc
JMODemoTableViewDescription *desc = [JMODemoTableViewDescription new];
JMOTableViewSectionDescription *oneSection = [JMOTableViewSectionDescription new];

JMOTableViewRowDescription *oneRow = [JMOTableViewRowDescription new];
oneRow.cellClass = [UITableViewCell class];
oneRow.cellHeight = 30.0f;
oneRow.cellReuseIdentifier = @"UITableViewCellIdentifier";
oneRow.data = @"My Fake 1st section (it's a cell!)";
[oneSection addRowDescription:oneRow];
...
return desc;
```

 * Implement your generic cell/section update 
```objc
@protocol JMOTableViewDescriptionCellUpdate <NSObject>

@optional
- (void)updateCellWithData:(id)data;
- (void)updateCellWithRowDescription:(id)data;

@end
```

 * Implement your own cell update to manage special case
```objc
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
```

 * Implement JMOTableViewDescriptionDelegate to be focus on Data
```objc
- (void)tableView:(UITableView *)tableView didSelectDataDescription:(id)selectedData
{
    JMOLog(@"Do something with selectedData : %@",selectedData);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"TableViewDescriptionDelegate" message:@"Do something with selected Data" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alert show];
}
```

