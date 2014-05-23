//
//  NGViewControllerTests.m
//  iOS-Bites
//
//  Created by James Womack on 5/23/14.
//  Copyright (c) 2014 James Womack. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NGViewController.h"


@interface NGViewControllerTests : XCTestCase
@property (nonatomic, strong) NGViewController *controller;
@end

@implementation NGViewControllerTests

- (void)setUp
{
  [super setUp];
  UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
  self.controller = [storyboard instantiateViewControllerWithIdentifier:@"main"];
  [self.controller performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
}

- (void)tearDown
{
  self.controller = nil;
  [super tearDown];
}

- (void)testviewDidAppear {
  [self.controller viewDidAppear:NO];
  XCTAssertNotNil(self.controller.imageView, @"NGViewController imageView object not instantiated");
  
}

@end
