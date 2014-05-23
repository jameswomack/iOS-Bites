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
  return YES;
}


- (void)applicationDidEnterBackground:(UIApplication *)__unused application {
  __gcov_flush();
}


@end
