//
//  NGViewController.m
//  iOS-Bites
//
//  Created by James Womack on 5/22/14.
//  Copyright (c) 2014 James Womack. All rights reserved.
//


#import "NGViewController.h"
#import "NGImageDataTransformer.h"

@interface NGViewController ()
@property (weak, nonatomic)   IBOutlet UIImageView *imageView;
@property (strong, nonatomic) UIImage  *image;
@end


@implementation NGViewController


- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    self.image = [UIImage imageNamed:@"iOS-Bites"];
  });

  NSData *imageData = [ImageDataTransformer transformedValue:self.image];
  
  dispatch_async(GCD_MAIN_Q, ^{
    self.imageView.image = [ImageDataTransformer reverseTransformedValue:imageData];
  });
}


@end
