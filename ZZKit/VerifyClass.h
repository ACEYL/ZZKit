//
//  VerifyClass.h
//  ZZKit
//
//  Created by 袁亮 on 16/5/16.
//  Copyright © 2016年 Migic_Z. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VerifyClass : NSObject

-(void)verifyClassMethod:(NSDictionary *)param
      withVerifyUserName:(void (^)())username
      withVerifyPassword:(void (^)())password
       withVerifySuccess:(void (^)())success;

+(void)makeDecideFun:(NSDictionary *)param withMakeUsername:(void (^)())username withMakePassword:(void (^)())password withMakePhone:(void (^)())phone withMakeKnow:(void (^)())know withMakeAddress:(void (^)())address withMakeSuccess:(void (^)())success;
@end
