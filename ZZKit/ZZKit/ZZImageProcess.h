//
//  ZZImageProcess.h
//  ZZKit
//
//  Created by 袁亮 on 16/5/13.
//  Copyright © 2016年 Migic_Z. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZZImageProcess : NSObject

/**
 *  裁剪图片
 *
 *  @param image 原始图片
 *  @param rect  参见矩形区域
 *
 *  @return 裁剪之后的图片
 */
+(UIImage *)cutRectangleImage:(UIImage *)image rect:(CGRect)rect;

/**
 *  等比例缩放图片
 *
 *  @param image 原始图片
 *  @param multiple  等比缩放倍数  
 *
 *  @return 缩放之后的图片
 */
+(UIImage*)scaleImage:(UIImage *)image multiple:(CGFloat) multiple;

/**
 *  图片加水印
 *
 *  @param image 原始图片
 *  @param markImage 水印图片
 *  @param rect 水印所在图片位置
 *
 *  @return 加水印之后的图片
 */
+(UIImage *)addWaterMark:(UIImage *)image markImage:(UIImage *)markImage rect:(CGRect)rect;

/**
 *  @return 创建一个纯颜色的UIImage
 */
+(UIImage *) imageWithColor:(UIColor *)color;

@end
