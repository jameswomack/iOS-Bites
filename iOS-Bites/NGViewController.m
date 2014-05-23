//
//  NGViewController.m
//  iOS-Bites
//
//  Created by James Womack on 5/22/14.
//  Copyright (c) 2014 James Womack. All rights reserved.
//


#import "NGViewController.h"
#import "NGImageDataTransformer.h"


#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-macros"

#define GCD_MAIN_Q dispatch_get_main_queue()
#define GCD_BG_Q   dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

#pragma clang diagnostic pop


@implementation NGViewController


- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    self.image = [UIImage imageNamed:@"iOS-Bites"];
  });

  dispatch_sync(GCD_BG_Q, ^{
    NSData *imageData = [ImageDataTransformer transformedValue:self.image];
    
    dispatch_async(GCD_MAIN_Q, ^{
      self.imageView.image = [ImageDataTransformer reverseTransformedValue:imageData];
    });
  });
}


@end
