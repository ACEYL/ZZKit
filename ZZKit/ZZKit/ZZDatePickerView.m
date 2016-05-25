//
//  ZZDatePickerView.m
//  ZZKit
//
//  Created by 袁亮 on 16/5/12.
//  Copyright © 2016年 Migic_Z. All rights reserved.
//

#import "ZZDatePickerView.h"
#import "ZZDefine.h"

@interface ZZDatePickerView()

@property (strong,nonatomic) UIButton *doneBtn;
@property (strong,nonatomic) UIDatePicker *datepicker;
@property (strong,nonatomic) NSString *getdate;



@end

@implementation ZZDatePickerView

@synthesize dateFormat = _dateFormat;

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        
        [self makeDoneButtonUI];
        
        [self makeDatePickerUI];
        
    }
    return self;
}

-(void) makeDoneButtonUI
{
    self.doneBtn = [[UIButton alloc]initWithFrame:CGRectMake(KW - 55, 5, 50, 20)];
    [self.doneBtn setTitle:@"完成" forState:UIControlStateNormal];
    [self.doneBtn setTitleColor:RGB(64, 187, 254) forState:UIControlStateNormal];
    [self.doneBtn addTarget:self action:@selector(doneButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.doneBtn];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 29, KW, 1)];
    line.backgroundColor = RGB(220, 220, 220);

    [self addSubview:line];
}



-(void) makeDatePickerUI
{
    _datepicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 30, KW, KH - 30)];
    NSLocale *locale = [[NSLocale alloc]initWithLocaleIdentifier:@"Chinese"];
    [_datepicker setLocale:locale];
    
    [_datepicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged ];
    [self addSubview:_datepicker];
    
    
}

-(void)setDatePickerMode:(ZZDatePickerMode)datePickerMode
{
    if (datePickerMode == ZZDatePickerModeTime) {
        _datepicker.datePickerMode = UIDatePickerModeTime;
    }else if (datePickerMode == ZZDatePickerModeDate){
        _datepicker.datePickerMode = UIDatePickerModeDate;
    }else if (datePickerMode == ZZDatePickerModeDateAndTime){
        _datepicker.datePickerMode = UIDatePickerModeDateAndTime;
    }else if (datePickerMode == ZZDatePickerModeCountDownTimer){
        _datepicker.datePickerMode = UIDatePickerModeCountDownTimer;
    }
}

-(void)setDateFormat:(NSString *)dateFormat
{
    _dateFormat = dateFormat;
    //self.getdate设置个默认的当前值
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:dateFormat];
    self.getdate = [dateFormatter stringFromDate:_datepicker.date];
}


-(void)dateChanged:(id)sender{
    
    UIDatePicker* control = (UIDatePicker*)sender;
    
    /*添加你自己响应代码*/
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:_dateFormat];
    //用[NSDate date]可以获取系统当前时间
    self.getdate = [dateFormatter stringFromDate:control.date];
    
}

-(void)doneButtonMethod
{
    if ([self.delegate respondsToSelector:@selector(datePickerView:didSelectDatePickerView:)]) {
        [self.delegate datePickerView:self didSelectDatePickerView:self.getdate];
    }
    
    [self removeFromSuperview];

}


@end
