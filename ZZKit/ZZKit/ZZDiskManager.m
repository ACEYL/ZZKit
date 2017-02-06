//
//  ZZDiskManager.m
//  ZZKit
//
//  Created by devz on 16/5/13.
//  Copyright © 2016年 devz. All rights reserved.
//

#import "ZZDiskManager.h"

#define EMPTY_STRING @""

@implementation ZZDiskManager

/**
 This method is used to obtain the sand box of the main path.
 
 @return home path
 */
+ (NSString *)fetchHomePath{
    return NSHomeDirectory();
}
/**
 This method is used to obtain the sand box of the documents path.
 
 @return documents path
 */
+ (NSString *)fetchDocumentsPath{
    return [NSHomeDirectory() stringByAppendingPathComponent:documents];
}
/**
 This method is used to obtain the sand box of the library path.
 
 @return library path
 */
+ (NSString *)fetchLibraryPath{
    return [NSHomeDirectory() stringByAppendingPathComponent:library];
}
/**
 This method is used to obtain the sand box of the temp path.
 
 @return temp path
 */
+ (NSString *)fetchTempPath{
    return [NSHomeDirectory() stringByAppendingPathComponent:temp];
}
/**
 By specifying the enumerated types for the specified path.

 @param mode path mode
 @return path
 */
+ (NSString *)fetchPathWithMode:(ZZDiskMode)mode
{
    NSString *path = nil;
    if (mode == ZZDiskModeHome) path = [self fetchHomePath];
    else if (mode == ZZDiskModeDocuments) path = [self fetchDocumentsPath];
    else if (mode == ZZDiskModeLibrary) path = [self fetchLibraryPath];
    else if (mode == ZZDiskModeTmp) path = [self fetchTempPath];
    return path;
}
/**
 This method is used to save a file to the specified path.
 
 @param data file data
 @param mode path mode
 @param fileName file name
 */
+ (void)saveDate:(NSData *)data withPathMode:(ZZDiskMode)mode withFileName:(NSString *)fileName
{
    NSString *path = [self fetchPathWithMode:mode];
    if (![path isEqualToString:EMPTY_STRING]) {
        [data writeToFile:[path stringByAppendingPathComponent:fileName] atomically:YES];
    }
    
}
/**
 This method is used to create a file or folder in the specified directory.
 
 @param mode path mode
 @param floderName floder name
 @return is or not to create
 */
+ (BOOL)createFloderInSandBox:(ZZDiskMode)mode floderName:(NSString *)floderName
{
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    NSString *path = [self fetchPathWithMode:mode];
    NSString *createPath = [path stringByAppendingPathComponent:floderName];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:createPath]) {
        [fileManager createDirectoryAtPath:createPath withIntermediateDirectories:YES attributes:nil error:nil];
        return YES;
    } else {
        return NO;
    }
}
/**
 This method is used to obtain all the file path.
 
 @param mode Through the mode to determine the directory.
 @return All file
 */
+ (NSArray *)fetchAllFileOfPathMode:(ZZDiskMode)mode
{
    NSString *path = [self fetchPathWithMode:mode];
    NSArray *files = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:path error:nil];
    return files;
}
/**
 This method is used to delete the specified file directory to the specified file name.
 
 @param mode path mode
 @param fileName file name
 @return is or not to delete
 */
+ (BOOL)removeItemWithPathMode:(ZZDiskMode)mode fileName:(NSString *)fileName
{
    NSFileManager *mgr = [NSFileManager defaultManager];
    return [mgr removeItemAtPath:[[self fetchPathWithMode:mode] stringByAppendingPathComponent:fileName] error:nil];
}
/**
 This method is used to delete the specified directory of all items.
 
 @param mode path mode
 @return is or not delete all.
 */
+ (BOOL)removeAllItemOfPathMode:(ZZDiskMode)mode
{
    NSArray *fileAry =  [self fetchAllFileOfPathMode:mode];
    BOOL flag = NO;
    for (NSString *fileName in fileAry) {
        flag = [self removeItemWithPathMode:mode fileName:fileName];
        if (!flag)
        break;
    }
    return flag;
}
/**
 This method is used to delete the specified directory of all items,
 Callback block returns the deleted files and delete the parameters of success
 
 @param mode path mode
 @return is or not delete all.
 */
+ (void)removeAllItemOfPathMode:(ZZDiskMode)mode clearBlock:(void (^)(NSArray *, BOOL))block
{
    __block NSArray *fileData =  [self fetchAllFileOfPathMode:mode];
    __block BOOL flag = NO;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        __weak __typeof(self) weakSelf = self;
        for (NSString *fileName in fileData) {
            flag = [weakSelf removeItemWithPathMode:mode fileName:fileName];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            block(fileData,flag);
        });
    });
}
/**
 This method is used to remove all the documents to three directories under the sandbox.
 
 @return is or not delete.
 */
+ (BOOL)removeSandBoxToEmpty
{
    BOOL clear = NO;
    BOOL clearDocuments = [self removeAllItemOfPathMode:ZZDiskModeDocuments];
    BOOL clearLibrary = [self removeAllItemOfPathMode:ZZDiskModeLibrary];
    BOOL clearTmp = [self removeAllItemOfPathMode:ZZDiskModeTmp];
    if (clearDocuments == YES || clearLibrary == YES || clearTmp == YES) {
        clear = YES;
    }
    return clear;
}
/**
 This method is used to remove all the documents to three directories under the sandbox,
 Contains the Documents folder, Library folder and TMP folder all the content to empty.
 
 @param delete success block.
 */
+ (void)removeSandBoxClearBlock:(void (^)(BOOL))block
{
    __block BOOL clear = NO;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        __weak __typeof(self) weakSelf = self;
        BOOL clearDocuments = [weakSelf removeAllItemOfPathMode:ZZDiskModeDocuments];
        BOOL clearLibrary = [weakSelf removeAllItemOfPathMode:ZZDiskModeLibrary];
        BOOL clearTmp = [weakSelf removeAllItemOfPathMode:ZZDiskModeTmp];
        if (clearDocuments == YES || clearLibrary == YES || clearTmp == YES) {
            clear = YES;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            block(clear);
        });
    });
}

@end
