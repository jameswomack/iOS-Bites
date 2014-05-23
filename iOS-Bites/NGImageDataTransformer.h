//
//  NGImageDataTransformer.h
//  iOS-Bites
//
//  Created by James Womack on 5/23/14.
//  Copyright (c) 2014 James Womack. All rights reserved.
//

@import Foundation;

#define ImageDataTransformer NGImageDataTransformer.sharedImageDataTransformer

@interface NGImageDataTransformer : NSValueTransformer
+ (instancetype)sharedInstance;
+ (instancetype)sharedImageDataTransformer;
+ (NSData *)dataForImage:(UIImage *)image;
+ (UIImage *)imageWithBytes:(Byte *)bytes andSize:(CGSize)imageSize;
@end
