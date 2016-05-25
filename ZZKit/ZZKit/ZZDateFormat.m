//
//  ZZDateFormat.m
//  ZZKit
//
//  Created by 袁亮 on 16/5/12.
//  Copyright © 2016年 Migic_Z. All rights reserved.
//

#import "ZZDateFormat.h"

@implementation ZZDateFormat

+(NSString *)fetchDate:(NSString *)date format:(NSString *) format
{
    
    NSString *timeStr = date;
    
    NSTimeInterval timeInterval = [timeStr doubleValue];
    
    NSDate *pubDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    
    NSDateFormatter *resultFormatter=[[NSDateFormatter alloc]init];
    
    [resultFormatter setDateFormat:format];
    
    NSString *time = [resultFormatter stringFromDate:pubDate];
    
    return time;
}

+(NSString *)fetchNowDateFormat:(NSString *) format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    formatter.dateFormat = format;
    
    NSString *nowTimeStr = [formatter stringFromDate:[NSDate date]];
    
    return nowTimeStr;
}

+(NSString *)fetchNowDateForUnix
{

    NSDate *date=[NSDate date];
    NSTimeInterval time=[date timeIntervalSince1970];
    NSString *strTime=[NSString stringWithFormat:@"%.0f",time];
    
    return strTime;
}

+(NSString *) fetchUnixDate:(NSString *)date format:(NSString *) format
{
    NSString* timeStr = date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:format];
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
     
    NSDate *newDate = [formatter dateFromString:timeStr];
    
    NSString *unixDate = [NSString stringWithFormat:@"%.0f", [newDate timeIntervalSince1970]];
    
    return unixDate;
}

+(NSString *) fetchDifferenceValue:(NSString *)afterDate beforeDate:(NSString *)beforeDate
{
    long dd = (long)[afterDate intValue] - (long)[beforeDate intValue];
    NSLog(@"123456 _+_+_+   %ld",dd);
    NSString *timeString=@"";
    if (dd/3600<1){
        
        timeString = [NSString stringWithFormat:@"%ld", dd/60];
        timeString=[NSString stringWithFormat:@"%@分钟前", timeString];
        return timeString;
        
    }else if (dd/3600>1&&dd/86400<1){
        
        timeString = [NSString stringWithFormat:@"%ld", dd/3600];
        timeString=[NSString stringWithFormat:@"%@小时前", timeString];
        return timeString;
        
    }else if (dd/86400>1){
        timeString = [NSString stringWithFormat:@"%ld", dd/86400];
        timeString=[NSString stringWithFormat:@"%@天前", timeString];
        return timeString;
    }
    return nil;
}

@end
