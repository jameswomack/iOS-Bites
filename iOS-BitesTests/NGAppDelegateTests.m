//
//  NGAppDelegateTests.m
//  iOS-Bites
//
//  Created by James Womack on 5/23/14.
//  Copyright (c) 2014 James Womack. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NGAppDelegate.h"


@interface NGAppDelegateTests : XCTestCase
@property (nonatomic, strong) NGAppDelegate *appDelegate;
@end


@implementation NGAppDelegateTests


- (void)setUp {
  [super setUp];
  self.appDelegate = NGAppDelegate.new; // for coverage
  self.appDelegate = (NGAppDelegate *)[UIApplication sharedApplication].delegate;
}


- (void)tearDown {
  self.appDelegate = nil;
  [super tearDown];
}


- (void)testWindow {
  XCTAssertNotNil(self.appDelegate.window, @"NGAppDelegate window object not instantiated");
  
}


@end
