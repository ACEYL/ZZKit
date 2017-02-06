//
//  ZZDiskManager.h
//  ZZKit
//
//  Created by devz on 16/5/13.
//  Copyright © 2016年 devz. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *documents = @"Documents";
static NSString *library = @"Library";
static NSString *temp = @"tmp";

typedef NS_ENUM(NSInteger, ZZDiskMode){
    ///  The main path of the sandbox.
    ZZDiskModeHome=0,
    ///  The documents path of the sandbox.
    ZZDiskModeDocuments,
    ///  The library path of the sandbox.
    ZZDiskModeLibrary,
    ///  The temp path of the sandbox.
    ZZDiskModeTmp
};

@interface ZZDiskManager : NSObject

/**
 This method is used to obtain the sand box of the main path.

 @return home path
 */
+ (NSString *)fetchHomePath;
/**
 This method is used to obtain the sand box of the documents path.

 @return documents path
 */
+ (NSString *)fetchDocumentsPath;
/**
 This method is used to obtain the sand box of the library path.

 @return library path
 */
+ (NSString *)fetchLibraryPath;
/**
 This method is used to obtain the sand box of the temp path.

 @return temp path
 */
+ (NSString *)fetchTempPath;
/**
 By specifying the enumerated types for the specified path.
 
 @param mode path mode
 @return path
 */
+ (NSString *)fetchPathWithMode:(ZZDiskMode)mode;
/**
 This method is used to save a file to the specified path.

 @param data file data
 @param mode path mode
 @param fileName file name
 */
+ (void)saveDate:(NSData *)data withPathMode:(ZZDiskMode)mode withFileName:(NSString *)fileName;
/**
 This method is used to create a file or folder in the specified directory.

 @param mode path mode
 @param floderName floder name
 @return is or not to create
 */
+ (BOOL)createFloderInSandBox:(ZZDiskMode)mode floderName:(NSString *)floderName;
/**
 This method is used to obtain all the file path.
 
 @param mode Through the mode to determine the directory.
 @return All file
 */
+ (NSArray *)fetchAllFileOfPathMode:(ZZDiskMode)mode;
/**
 This method is used to delete the specified file directory to the specified file name.

 @param mode path mode
 @param fileName file name
 @return is or not to delete
 */
+ (BOOL)removeItemWithPathMode:(ZZDiskMode)mode fileName:(NSString *)fileName;
/**
 This method is used to delete the specified directory of all items.

 @param mode path mode
 @return is or not delete all.
 */
+ (BOOL)removeAllItemOfPathMode:(ZZDiskMode)mode;
/**
 This method is used to delete the specified directory of all items,
 Callback block returns the deleted files and delete the parameters of success
 
 @param mode path mode
 @param delete success block.
 */
+ (void)removeAllItemOfPathMode:(ZZDiskMode)mode clearBlock:(void (^)(NSArray *items, BOOL clear))block;
/**
 This method is used to remove all the documents to three directories under the sandbox.

 @return is or not delete.
 */
+ (BOOL)removeSandBoxToEmpty;
/**
 This method is used to remove all the documents to three directories under the sandbox,
 Contains the Documents folder, Library folder and TMP folder all the content to empty.

 @param delete success block.
 */
+ (void)removeSandBoxClearBlock:(void (^)(BOOL clear))block;

@end
