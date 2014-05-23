//
//  NGImageDataTransformer.h
//  iOS-Bites
//
//  Created by James Womack on 5/23/14.
//  Copyright (c) 2014 James Womack. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ImageDataTransformer NGImageDataTransformer.sharedImageDataTransformer

@interface NGImageDataTransformer : NSValueTransformer
+ (instancetype)sharedInstance;
+ (instancetype)sharedImageDataTransformer;
@end
