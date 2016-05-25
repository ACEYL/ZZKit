//
//  ZZFunction.m
//  ZZKit
//
//  Created by 袁亮 on 16/5/12.
//  Copyright © 2016年 Migic_Z. All rights reserved.
//

#import "ZZFunction.h"
#import "ZZDefine.h"
@implementation ZZFunction

+(id)checkNull:(NSString *)nullString
{
    NSString *objectString = nil;
    if (![nullString isEqual:[NSNull null]]) {
        objectString = EMPTY_STRING;
    }
    return objectString;
}

+(CGSize) fetchSizeFrom:(NSString *)text setWidth:(CGFloat)width setFont:(UIFont *)font
{
    CGSize zzSize = [text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingTruncatesLastVisibleLine| NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    
    return zzSize;
}

+(double)distanceBetweenOrderBy:(double)lat1 :(double)lat2 :(double)lng1 :(double)lng2
{
    double dd = M_PI/180;
    double x1=lat1*dd,x2=lat2*dd;
    double y1=lng1*dd,y2=lng2*dd;
    double R = 6371004;
    double distance = (2*R*asin(sqrt(2-2*cos(x1)*cos(x2)*cos(y1-y2) - 2*sin(x1)*sin(x2))/2));
    //     km  返回
    //     return  distance*1000;
    
    return   distance;
    
}


@end
