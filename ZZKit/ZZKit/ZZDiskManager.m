//
//  ZZDiskManager.m
//  ZZKit
//
//  Created by 袁亮 on 16/5/13.
//  Copyright © 2016年 Migic_Z. All rights reserved.
//

#import "ZZDiskManager.h"
#import "ZZDefine.h"
@implementation ZZDiskManager

+(NSString *)fetchDocumentsPath
{
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
}

+(NSString *)fetchLibraryPath
{
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Library"];
}

+(NSString *)fetchTempPath
{
    return [NSHomeDirectory() stringByAppendingPathComponent:@"temp"];
}

+(void) saveDate:(NSData *)data toPath:(NSString *)path
{
    if (![path isEqualToString:EMPTY_STRING]) {
        [data writeToFile:path atomically:YES];
    }
    
}
+(NSData *) readDateFromPath:(NSString *)path
{
    NSData *data = [NSData dataWithContentsOfFile:path];
    return data;
}

+(BOOL)createFloderInSandBox:(ZZDiskMode)mode floderName:(NSString *)floderName
{
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    NSString *path = nil;
    if (mode == ZZDiskModeDocuments) {
        path = [self fetchDocumentsPath];
    }else if (mode == ZZDiskModeLibrary){
        path = [self fetchLibraryPath];
    }else if (mode == ZZDiskModeTemp){
        path = [self fetchTempPath];
    }
    NSString *createPath = [NSString stringWithFormat:@"%@/%@", path,floderName];
    
    // 判断文件夹是否存在，如果不存在，则创建
    if (![[NSFileManager defaultManager] fileExistsAtPath:createPath]) {
        [fileManager createDirectoryAtPath:createPath withIntermediateDirectories:YES attributes:nil error:nil];
        return YES;
    } else {
        return NO;
    }
}

@end
