//
//  TableViewDescriptionTests.m
//  TableViewDescriptionTests
//
//  Created by Jerome Morissard on 3/20/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JMOTableViewRowDescription.h"
#import "JMOTableViewDescription.h"
#import "JMOTableViewNibCell.h"
#import "JMOTableViewSectionDescription.h"
#import "JMOSectionView.h"

@interface TableViewDescriptionTests : XCTestCase

@property (strong, nonatomic) UINib *nib;
@property (strong, nonatomic) UINib *sectionNib;

@end

@implementation TableViewDescriptionTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.nib = [UINib nibWithNibName:@"JMOTableViewNibCell" bundle:[NSBundle mainBundle]];
    self.sectionNib = [UINib nibWithNibName:@"JMOSectionView" bundle:[NSBundle mainBundle]];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testRowFactoryWithNibname
{
    //XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
    JMOTableViewRowDescription *rowDesc = [JMOTableViewRowDescription
                                           rowDescriptionWithReuseIdentifier:@"identifier"
                                           nibName:@"JMOTableViewNibCell"
                                           cellHeight:40.0f];
    
    XCTAssertEqual(rowDesc.cellReuseIdentifier, @"identifier");
    XCTAssertNotNil(rowDesc.nib,@"");
    XCTAssertEqual(rowDesc.cellHeight, 40.0f);
}
    
- (void)testRowFactoryNib
{
    JMOTableViewRowDescription *rowDesc = [JMOTableViewRowDescription
                                           rowDescriptionWithReuseIdentifier:@"JMOTableViewNibCell"
                                           nib:self.nib
                                           cellHeight:40.0f];
    
    XCTAssertEqual(rowDesc.cellReuseIdentifier, @"JMOTableViewNibCell");
    XCTAssertEqual(rowDesc.nib,self.nib);
    XCTAssertEqual(rowDesc.cellHeight, 40.0f);
}

    
- (void)testrRowFactoryClass
{
    JMOTableViewRowDescription *rowDesc = [JMOTableViewRowDescription
                                           rowDescriptionWithReuseIdentifier:@"JMOTableViewNibCell"
                                           cellClass:JMOTableViewNibCell.class cellHeight:40.0f];
    
    XCTAssertEqual(rowDesc.cellReuseIdentifier, @"JMOTableViewNibCell");
    XCTAssertNotNil(rowDesc.cellClass,@"");
    XCTAssertEqual(rowDesc.cellHeight, 40.0f);
}
    
- (void)testSectionFactoryWithNibname
{
    JMOTableViewSectionDescription *sectionDesc = [JMOTableViewSectionDescription sectionDescriptionWithReuseIdentifier:@"identifier"
                                                                                                               nibName:@"JMOSectionView"
                                                                                                         sectionHeight:40.0f];
    XCTAssertEqual(sectionDesc.sectionReuseIdentifier, @"identifier");
    XCTAssertNil(sectionDesc.sectionClass);
    XCTAssertNotNil(sectionDesc.nib);
    XCTAssertEqual(sectionDesc.sectionHeight, 40.0f);
}
    
- (void)testSectionFactoryWithNib
{
    JMOTableViewSectionDescription *sectionDesc = [JMOTableViewSectionDescription sectionDescriptionWithReuseIdentifier:@"identifier"
                                                                                                                nib:self.sectionNib
                                                                                                          sectionHeight:40.0f];
    XCTAssertEqual(sectionDesc.sectionReuseIdentifier, @"identifier");
    XCTAssertNil(sectionDesc.sectionClass);
    XCTAssertEqual(sectionDesc.nib, self.sectionNib);
    XCTAssertEqual(sectionDesc.sectionHeight, 40.0f);
}
    
- (void)testSectionFactoryWithClass
{
    JMOTableViewSectionDescription *sectionDesc = [JMOTableViewSectionDescription sectionDescriptionWithReuseIdentifier:@"identifier"
                                                                                                                    cellClass:JMOSectionView.class
                                                                                                          sectionHeight:40.0f];
    XCTAssertEqual(sectionDesc.sectionReuseIdentifier, @"identifier");
    XCTAssertEqual(sectionDesc.sectionClass,JMOSectionView.class);
    XCTAssertNil(sectionDesc.nib,@"");
    XCTAssertEqual(sectionDesc.sectionHeight, 40.0f);
}
    
- (void)testCumulatedHeight_1_1
{
    JMOTableViewSectionDescription *sectionDesc = [JMOTableViewSectionDescription sectionDescriptionWithReuseIdentifier:@"identifier"
                                                                                                                  cellClass:JMOSectionView.class
                                                                                                              sectionHeight:40.0f];
    JMOTableViewRowDescription *rowDesc = [JMOTableViewRowDescription
                                               rowDescriptionWithReuseIdentifier:@"JMOTableViewNibCell"
                                               cellClass:JMOTableViewNibCell.class cellHeight:40.0f];
        
    JMOTableViewDescription *tableViewDes = [JMOTableViewDescription new];
    [sectionDesc addRowDescription:rowDesc];
    [tableViewDes addSectionDescription:sectionDesc];
    XCTAssertEqual(tableViewDes.cumulatedHeights,80.0f);
}
    
- (void)testCumulatedHeight_2_1
{
    JMOTableViewSectionDescription *sectionDesc = [JMOTableViewSectionDescription sectionDescriptionWithReuseIdentifier:@"identifier"
                                                                                                                  cellClass:JMOSectionView.class
                                                                                                              sectionHeight:40.0f];
    JMOTableViewRowDescription *rowDesc = [JMOTableViewRowDescription
                                               rowDescriptionWithReuseIdentifier:@"JMOTableViewNibCell"
                                               cellClass:JMOTableViewNibCell.class cellHeight:40.0f];
    
    JMOTableViewSectionDescription *sectionDesc2 = [JMOTableViewSectionDescription sectionDescriptionWithReuseIdentifier:@"identifier"
                                                                                                              cellClass:JMOSectionView.class
                                                                                                          sectionHeight:40.0f];
    
    JMOTableViewDescription *tableViewDes = [JMOTableViewDescription new];
    [sectionDesc addRowDescription:rowDesc];
    [tableViewDes addSectionDescription:sectionDesc];
    [tableViewDes addSectionDescription:sectionDesc2];
    XCTAssertEqual(tableViewDes.cumulatedHeights,120.0f);
}
   
- (void)testCumulatedHeight_1_2
{
    JMOTableViewSectionDescription *sectionDesc = [JMOTableViewSectionDescription sectionDescriptionWithReuseIdentifier:@"identifier"
                                                                                                                  cellClass:JMOSectionView.class
                                                                                                              sectionHeight:40.0f];
    JMOTableViewRowDescription *rowDesc = [JMOTableViewRowDescription
                                               rowDescriptionWithReuseIdentifier:@"JMOTableViewNibCell"
                                               cellClass:JMOTableViewNibCell.class cellHeight:40.0f];
    
    JMOTableViewRowDescription *rowDesc2 = [JMOTableViewRowDescription
                                           rowDescriptionWithReuseIdentifier:@"JMOTableViewNibCell"
                                           cellClass:JMOTableViewNibCell.class cellHeight:40.0f];
    
    JMOTableViewDescription *tableViewDes = [JMOTableViewDescription new];
    [sectionDesc addRowDescription:rowDesc];
    [sectionDesc addRowDescription:rowDesc2];
    [tableViewDes addSectionDescription:sectionDesc];
    XCTAssertEqual(tableViewDes.cumulatedHeights,120.0f);
}
    
@end
