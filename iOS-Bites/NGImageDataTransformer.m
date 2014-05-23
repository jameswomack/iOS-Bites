//
//  NGImageDataTransformer.m
//  iOS-Bites
//
//  Created by James Womack on 5/23/14.
//  Copyright (c) 2014 James Womack. All rights reserved.
//

#import "NGImageDataTransformer.h"


@interface NGImageDataTransformer ()
@property (nonatomic, assign) CGSize imageSize;
@end


@implementation NGImageDataTransformer


+ (Class)transformedValueClass {
  return NSData.class;
}


+ (instancetype)sharedInstance {
  return self.sharedImageDataTransformer;
}


+ (instancetype)sharedImageDataTransformer {
  static NGImageDataTransformer *sharedImageDataTransformer;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedImageDataTransformer = self.new;
  });
  return sharedImageDataTransformer;
}


- (id)transformedValue:(id)value {
  id transformedValue = nil;
  
  if ([value isKindOfClass:UIImage.class]) {
    UIImage *image = (UIImage *)value;
    self.imageSize = image.size;
    
    transformedValue = [self.class dataForImage:image];
  }
  
  return transformedValue;
}


- (id)reverseTransformedValue:(id)value {
  id reverseTransformedValue = nil;
  
  if ([value isKindOfClass:self.class.transformedValueClass]) {
    NSData *imageData = (NSData *)value;
    reverseTransformedValue = [self.class imageWithBytes:(Byte *)imageData.bytes
                                                 andSize:self.imageSize];
  }
  
  return reverseTransformedValue;
}


+ (UIImage *)imageWithBytes:(Byte *)bytes andSize:(CGSize)imageSize {
  // Image dimensions
  CGFloat height = imageSize.height;
  CGFloat width = imageSize.width;
  
  // Data dimensions
  size_t bytesPerRow = 4 * width;
  
  // Create the bitmap context
  CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
  CGContextRef context = CGBitmapContextCreate(bytes,width,height,8,bytesPerRow,colorSpace,
                                               (CGBitmapInfo)kCGImageAlphaPremultipliedFirst);
  
  // Convert the bitmap context to an image
  CGImageRef imageRef = CGBitmapContextCreateImage(context);
  UIImage *image = [UIImage imageWithCGImage:imageRef];
  
  // Release the memory used for the drawing context
  CGColorSpaceRelease(colorSpace);
  CGContextRelease(context);
  CFRelease(imageRef);
  
  return image;
}


+ (NSData *)dataForImage:(UIImage *)image; {
  // Image dimensions
  CGSize imageSize = image.size;
  CGFloat height = imageSize.height;
  CGFloat width = imageSize.width;
  
  // Data dimensions
  size_t bytesPerRow = 4 * width;
  size_t byteLength   = bytesPerRow * height;
  
  // Allocating space for bytes of image
  void *imageData = malloc(byteLength);
  
  // Create a drawing context and paint the image into it
  CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
  CGContextRef context = CGBitmapContextCreate(imageData,width,height,8,bytesPerRow,colorSpace,
                                               (CGBitmapInfo)kCGImageAlphaPremultipliedFirst);
  CGContextDrawImage(context, (CGRect){.size = image.size}, image.CGImage);
  
  // Get the byte representation of the image drawn into the context
  Byte *bytes = CGBitmapContextGetData(context);
  
  // Release the memory used for the drawing context
  CGColorSpaceRelease(colorSpace);
  CGContextRelease(context);
  
  // Move the image bytes into an NSData construct
  // Es **muy importante** that this is created before freeing the void array
  NSData *data = [NSData dataWithBytes:bytes length:byteLength];
  
  // Free the imageData memory used by the drawing context
  // Es **muy importante** that this is released after creating the NSData object
  free(imageData);
  
  return data;
}


@end
