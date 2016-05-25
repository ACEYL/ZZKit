//
//  ZZMakeDecide.m
//  ZZKit
//
//  Created by 袁亮 on 16/5/16.
//  Copyright © 2016年 Migic_Z. All rights reserved.
//

#import "ZZMakeDecide.h"

@implementation ZZMakeDecide

+(ZZMakeDecide *)shareMake
{
    static ZZMakeDecide *makeDecide = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        makeDecide = [[self alloc] init];
    });
    return makeDecide;
}

-(NSString *)make_h_Method:(NSDictionary *)item
{
    NSString *declareString = @"-(void)makeDecideFun:(NSDictionary *)param";
    
    for (NSString *key in item) {
        
        
        NSString *methodName = [key capitalizedStringWithLocale:[NSLocale currentLocale]];
        
        NSString *methodString = [NSString stringWithFormat:@" withMake%@:(void (^)())%@",methodName,key];
        
        declareString = [declareString stringByAppendingString:methodString];
        
        
    }
    
    NSString *h_method = [NSString stringWithFormat:@"%@ withMakeSuccess:(void (^)())success;",declareString];
    
    return h_method;
}

-(NSString *)make_m_method:(NSDictionary *)item
{
    NSString *declareString = @"-(void)makeDecideFun:(NSDictionary *)param";
    
    for (NSString *key in item) {
        
        
        NSString *methodName = [key capitalizedStringWithLocale:[NSLocale currentLocale]];
        
        NSString *methodString = [NSString stringWithFormat:@" withMake%@:(void (^)())%@",methodName,key];
        
        declareString = [declareString stringByAppendingString:methodString];
        
        
    }
    NSString *headbracketStr = [NSString stringWithFormat:@"%@ withMakeSuccess:(void (^)())success\n{\n",declareString];
    
    for (NSString *key in item) {
        if ([item.allKeys objectAtIndex:0] == key) {
            headbracketStr = [NSString stringWithFormat:@"%@ if ([[param objectForKey:@\"%@\"] isEqualToString:@\"\"]) {\t\n%@();\n}",headbracketStr,key,key];
        }else {
            headbracketStr = [NSString stringWithFormat:@"%@else if ([[param objectForKey:@\"%@\"] isEqualToString:@\"\"]) {\t\n%@();\n}",headbracketStr,key,key];
        }
        
    }
    
    NSString *successputStr = [NSString stringWithFormat:@"%@else{\n\tsuccess();\n}",headbracketStr];
    
    
    NSString *m_method = [NSString stringWithFormat:@"%@\n}",successputStr];
    
    return m_method;
}


@end
