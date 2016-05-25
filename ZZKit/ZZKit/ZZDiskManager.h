//
//  ZZDiskManager.h
//  ZZKit
//
//  Created by 袁亮 on 16/5/13.
//  Copyright © 2016年 Migic_Z. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ZZDiskMode){
    ///  设置沙盒中 Documents 路径
    ZZDiskModeDocuments,
    
    ///  设置沙盒中 Library   路径
    ZZDiskModeLibrary,
    
    ///  设置沙盒中 Temp      路径
    ZZDiskModeTemp
};

@interface ZZDiskManager : NSObject

/**
 *      获取沙盒 Documents 路径
 */
+(NSString *) fetchDocumentsPath;
/**
 *      获取沙盒 Library 路径
 */
+(NSString *) fetchLibraryPath;
/**
 *      获取沙盒 temp 路径
 */
+(NSString *) fetchTempPath;

/**
 *      保存文件到某路径中
 */
+(void) saveDate:(NSData *)data toPath:(NSString *)path;
/**
 *      读取某路径中文件
 */
+(NSData *) readDateFromPath:(NSString *)path;

/**
 *      在Documents文件夹中创建文件夹
 *      @mode 创建文件夹在哪个目录
 *      @floderName 创建文件夹的文件名称
 */
+(BOOL)createFloderInSandBox:(ZZDiskMode)mode floderName:(NSString *)floderName;

@end
