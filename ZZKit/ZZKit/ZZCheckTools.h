//
//  ZZCheckTools.h
//  ZZKit
//
//  Created by 袁亮 on 16/5/13.
//  Copyright © 2016年 Migic_Z. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZCheckTools : NSObject

/**
 *   检验是否为正确的手机号码
 *   参数为任意字符串，传入任意字符串参数及可返回BOOL类型
 */
+(BOOL)checkIsPhone:(NSString *)mobileNum;

/**
 *   检验是否为正确的邮箱
 *   参数为任意字符串，传入任意字符串参数及可返回BOOL类型
 */
+(BOOL)checkIsEmail:(NSString *)email;

/**
 *   检验身份证号码是否为15位或者18位的长度
 *   参数为任意字符串，传入任意字符串参数及可返回BOOL类型
 */
+(BOOL)checkIdentityCardNo:(NSString*)cardNo;

@end
