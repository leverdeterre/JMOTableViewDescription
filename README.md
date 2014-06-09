Purpose
--------------
JMOTableViewDescription is an Objective-C library for easily creating and manage complex structured tableView.

![Image](screenshots/concept.png)

Why this project?
* TableView protocols are simple but not adapted to manipulate heterogenous objets or cells in your TableView.
* Some situations can lead to very complicated algorithms to construct the right TableViewCell to present a particular object.
* SectionHeaderView not reusable?

This project present:
* A new way to describe your tableView "layout" with a very simple method (a model),
* Datasource / Delegate considerably simplified by using this model,
* It's a very simple way to produce a "grouped tableView" style without having to use grouped stype!
* The code produced using this implementation his highly customizable, reusable and flexible. (No more bugs?)
* TableView delegate and datasource focus on manipulated objet, no indexPath!, 
* HeaderView reuse ? Replace your header by a cell, your first row :) 

Supported iOS & SDK Versions
-----------------------------

* Supported build target - iOS 7.1 (Xcode 5.1)
* Earliest supported deployment target - iOS 6.0
* Earliest compatible deployment target - iOS 6.0

NOTE: 'Supported' means that the library has been tested with this version. 'Compatible' means that the library should work on this iOS version (i.e. it doesn't rely on any unavailable SDK features) but is no longer being tested for compatibility and may require tweaking or bug fixes to run correctly.


------------------

Versions
------------------

- 0.1 Initial release
- 0.2 : * Add methods to automaticly register cells and header/footer views.
        * Add ViewControllers with generic implementations of UITableViewDatasource/delegate
          (JMOViewControllerWithTableViewDescription, JMOTableViewControllerWithTableViewDescription).
        * Add protocols to update Cells, Footers, Headers with data stored into the element description
          ( updateCellWithDescriptionData:(id)data && updateSectionWithDescriptionData:(id)data ).

TableViewDescription methods making the life easier
------------------
```objc
- (void)registerClassesInTableView:(UITableView *)tableView;
```
Auto register your classes into your tableView.
You can implement a similar methods to register your nibs in your tableView (no more dequeReusableCell problems).

```objc
- (void)reloadDataFromDescription:(JMOTableViewDescription *)fromDescription 
                    toDescription:(JMOTableViewDescription *)toDescription 
                         animated:(BOOL)animated;
```
A full dynamic way to reload of your tableView to animated cell modification.
It's a better UI effect than a reloadData.

How to use it ?
------------------
Implement to own JMODemoTableViewDescription
```objc

```


