//
//  ZZFunction.h
//  ZZKit
//
//  Created by 袁亮 on 16/5/12.
//  Copyright © 2016年 Migic_Z. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ZZFunction : NSObject

/***
 *   处理<null> 标签，如果服务器中返回<null>解析时需要处理<null>，
 <null> 打印后的值为 (null)
 不做处理势必会面临崩溃问题，这时就需要如下方法来处理<null>
 处理后返回值为@""
 ***/

+(id)checkNull:(NSString *)nullString;
/*
 *   获取一个段落的CGSize，用于做文本自适应，UILabel自动折行
 */
+(CGSize) fetchSizeFrom:(NSString *)text setWidth:(CGFloat)width setFont:(UIFont *) font;
/*
 *   两个经纬度之间的距离计算
 */
+(double) distanceBetweenOrderBy:(double)lat1 :(double)lat2 :(double)lng1 :(double)lng2;

@end
