//
//  PatronAPITests.m
//  PatronAPITests
//
//  Created by Neil Breeden III on 9/27/15.
//  Copyright (c) 2015 Neil Breeden III. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>

@interface PatronAPITests : XCTestCase

@end

@implementation PatronAPITests

- (void)setUp {
    [super setUp]; 
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
