//
//  VerifyClass.m
//  ZZKit
//
//  Created by 袁亮 on 16/5/16.
//  Copyright © 2016年 Migic_Z. All rights reserved.
//

#import "VerifyClass.h"

@implementation VerifyClass

-(void)verifyClassMethod:(NSDictionary *)param withVerifyUserName:(void (^)())username withVerifyPassword:(void (^)())password withVerifySuccess:(void (^)())success
{
    if ([[param objectForKey:@"username"] isEqualToString:@""]) {
        username();
    }else if([[param objectForKey:@"password"] isEqualToString:@""]){
        password();
    }else{
        success();
    }
}

+(void)makeDecideFun:(NSDictionary *)param withMakeUsername:(void (^)())username withMakePassword:(void (^)())password withMakePhone:(void (^)())phone withMakeKnow:(void (^)())know withMakeAddress:(void (^)())address withMakeSuccess:(void (^)())success
{
    if ([[param objectForKey:@"username"] isEqualToString:@""]) {
        username();
    }else if ([[param objectForKey:@"password"] isEqualToString:@""]) {
        password();
    }else if ([[param objectForKey:@"phone"] isEqualToString:@""]) {
        phone();
    }else if ([[param objectForKey:@"know"] isEqualToString:@""]) {
        know();
    }else if ([[param objectForKey:@"address"] isEqualToString:@""]) {
        address();
    }else{
        success();
    }
}



@end
