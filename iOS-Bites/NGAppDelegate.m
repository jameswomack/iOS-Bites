//
//  NGAppDelegate.m
//  iOS-Bites
//
//  Created by James Womack on 5/22/14.
//  Copyright (c) 2014 James Womack. All rights reserved.
//

#import "NGAppDelegate.h"
#include <stdio.h>


extern void __gcov_flush();


@implementation NGAppDelegate


- (BOOL)application:(UIApplication *)__unused application
didFinishLaunchingWithOptions:(NSDictionary *)__unused launchOptions {
  [self GCov];
  return YES;
}


- (void)applicationDidEnterBackground:(UIApplication *)__unused application {
  __gcov_flush();
}


- (void)GCov {
  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
  NSString *documentsDirectory = paths[0];
  setenv("GCOV_PREFIX", [documentsDirectory cStringUsingEncoding:NSUTF8StringEncoding], 1);
}


@end
