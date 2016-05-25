//
//  ZZDateFormat.h
//  ZZKit
//
//  Created by 袁亮 on 16/5/12.
//  Copyright © 2016年 Migic_Z. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ZZDateFormat : NSObject
/**
 *  获取当前时间的Unix时间戳
 *
 *  @return 获取当前时间的Unix时间戳
 */
+(NSString *) fetchNowDateForUnix;

/**
 *  获取当前时间
 *
 *  @param format 设置时间返回值格式 例如：yyyy-MM-dd -> 2016-05-12
 *
 *  @return 当前时间字符串
 */
+(NSString *) fetchNowDateFormat:(NSString *) format;

/**
 *  格式化Unix时间戳
 *
 *  @param date   Unix字符串
 *  @param format 设置时间返回值格式 例如：yyyy-MM-dd -> 2016-05-12
 *
 *  @return 格式化后的Unix时间字符串
 */
+(NSString *) fetchDate:(NSString *)date format:(NSString *) format;

/**
 *  将时间字符串形式为2016-05-12 08:00时间字符串格式成Unix时间戳字符串
 *
 *  @param date   普通时间字符串 例如：2016-05-12 08:00:20
 *  @param format 设置时间格式与date形式相对应 例如：yyyy-MM-dd HH:mm:ss
 *
 *  @return 格式化后的Unix时间字符串
 */
+(NSString *) fetchUnixDate:(NSString *)date format:(NSString *) format;

/**
 *  计算两个Unix时间时间差
 *
 *  @param afterDate   随后的Unix时间戳
 *  @param beforeDate  以前的Unix时间戳
 *
 *  @return 多少分钟前、多少小时前、多少天前计算
 */
+(NSString *) fetchDifferenceValue:(NSString *)afterDate beforeDate:(NSString *)beforeDate;


@end
