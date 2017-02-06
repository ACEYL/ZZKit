//
//  ZZImageProcess.m
//  ZZKit
//
//  Created by 袁亮 on 16/5/13.
//  Copyright © 2016年 Migic_Z. All rights reserved.
//

#import "ZZImageProcess.h"
#import <Accelerate/Accelerate.h>
@implementation ZZImageProcess

+(UIImage*)cutRectangleImage:(UIImage *)image rect:(CGRect)rect
{
    CGImageRef subImageRef = CGImageCreateWithImageInRect(image.CGImage, rect);
    
    CGRect cutBounds = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
    
    UIGraphicsBeginImageContext(cutBounds.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextDrawImage(context, cutBounds, subImageRef);
    
    UIImage* cutImage = [UIImage imageWithCGImage:subImageRef];
    
    UIGraphicsEndImageContext();
    
    return cutImage;
}


+(UIImage*)scaleImage:(UIImage *)image multiple:(CGFloat) multiple
{
    CGSize size = CGSizeMake(image.size.width * multiple, image.size.height * multiple);
    
    UIGraphicsBeginImageContext(size);
    
    [image drawInRect:CGRectMake(0,0,size.width,size.height)];
    
    UIImage*newImage=UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}


+(UIImage *)addWaterMark:(UIImage *)image markImage:(UIImage *)markImage rect:(CGRect)rect
{
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];

    [markImage drawInRect:rect];
    
    UIImage *waterMarkImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return waterMarkImage;
}

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
