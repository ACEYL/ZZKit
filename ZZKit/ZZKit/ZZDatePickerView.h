//
//  ZZDatePickerView.h
//  ZZKit
//
//  Created by 袁亮 on 16/5/12.
//  Copyright © 2016年 Migic_Z. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ZZDatePickerMode){
    ZZDatePickerModeTime,
    ZZDatePickerModeDate,
    ZZDatePickerModeDateAndTime,
    ZZDatePickerModeCountDownTimer,
};

@protocol ZZDatePickerViewDelegate <NSObject>

-(void)datePickerView:(UIView *)datePickerView didSelectDatePickerView:(NSString *)date;

@end

@interface ZZDatePickerView : UIView

@property (assign, nonatomic) ZZDatePickerMode datePickerMode;

@property (assign, nonatomic) NSString *dateFormat;

@property (weak, nonatomic) id <ZZDatePickerViewDelegate> delegate;

@end
