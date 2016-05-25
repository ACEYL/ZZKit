//
//  ZZRadioControl.h
//  ZZKit
//
//  Created by 袁亮 on 16/5/12.
//  Copyright © 2016年 Migic_Z. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZZRadioControlDelegate <NSObject>

-(void)radioButtonSelectedAtIndex:(NSUInteger)index inGroup:(NSString*)groupId;
@end

@interface ZZRadioControl : UIView
{
    NSString      *_groupId;
    NSUInteger    _index;
    UIButton      *_button;
}


@property (nonatomic, copy) NSString *groupId;

@property (nonatomic, assign) NSUInteger index;

@property (nonatomic, strong) UIImage *selectedImage;

@property (nonatomic, strong) UIImage *unselectedImage;

-(id)initWithGroupId:(NSString*)groupId index:(NSUInteger)index;

+(void)addObserverForGroupId:(NSString*)groupId observer:(id)observer;

@end
