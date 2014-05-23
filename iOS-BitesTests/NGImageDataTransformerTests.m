//
//  iOS_BitesTests.m
//  iOS-BitesTests
//
//  Created by James Womack on 5/22/14.
//  Copyright (c) 2014 James Womack. All rights reserved.
//

@import XCTest;
#import "NGImageDataTransformer.h"


@interface NGImageDataTransformerTests : XCTestCase

@property (nonatomic, strong) NGImageDataTransformer *transformer;
@property (nonatomic, strong) UIImage *image;

@end


@implementation NGImageDataTransformerTests


- (void)setUp {
  [super setUp];
  self.transformer = NGImageDataTransformer.new;
  self.image = [UIImage imageNamed:@"iOS-Bites"];
}


- (void)tearDown {
  self.transformer = nil;
  self.image = nil;
  [super tearDown];
}


- (void)testTransformedValue {
  id transformedValue = [self.transformer transformedValue:self.image];
  XCTAssertTrue([transformedValue isKindOfClass:NSData.class], @"%@ %@", transformedValue, @"is NSData");
}


- (void)testReverseTransformedValue {
  id transformedValue = [self.transformer transformedValue:self.image];
  id reverseTransformedValue = [self.transformer reverseTransformedValue:transformedValue];
  XCTAssertTrue([reverseTransformedValue isKindOfClass:UIImage.class], @"%@ %@", reverseTransformedValue, @"is UIImage");
}


@end
