//
//  ViewController.m
//  ZZKit
//
//  Created by 袁亮 on 16/5/12.
//  Copyright © 2016年 Migic_Z. All rights reserved.
//

#import "ViewController.h"
#import "ZZKit.h"


#import "VerifyClass.h"
#import "ZZMakeDecide.h"

@interface ViewController ()<ZZDatePickerViewDelegate,ZZRadioControlDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"ZZKit";
    
//    1463296160
//    1463294645
    //1970时间戳格式化
    

    NSLog(@"_+_+_+_+_+_+_+_+ 时间戳%@",[ZZDateFormat fetchDifferenceValue:[ZZDateFormat fetchNowDateForUnix] beforeDate:@"1463294645"]);
    
    //验证身份证长度
    NSLog(@"%@",[ZZEncode fetchSha224_code:@"123456"]);
    
    

    
    
    NSString *filePath = [[ZZDiskManager fetchDocumentsPath] stringByAppendingPathComponent:[NSString stringWithFormat:@"yuan_car.jpg"]];
//
//
    UIImage *shuiyinImage = [ZZImageProcess addWaterMark:[UIImage imageNamed:@"123.jpg"] markImage:[UIImage imageNamed:@"migic_z_logo.png"] rect:CGRectMake(0, 0, 100, 23)];
    
    [ZZDiskManager saveDate:UIImageJPEGRepresentation(shuiyinImage, 1.0) toPath:filePath];
    
    
    NSData *imageData = [ZZDiskManager readDateFromPath:filePath];
    
    UIImage *image = [UIImage imageWithData:imageData];
    
    NSLog(@"%@",[ZZDiskManager fetchDocumentsPath]);
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, VW, VH / 3)];
    
    imageView.image = image;
    
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.view addSubview:imageView];
    
    
    //创建文件夹
    BOOL isCreate = [ZZDiskManager createFloderInSandBox:ZZDiskModeDocuments floderName:@"Yuan"];
    if (isCreate == YES) {
        NSLog(@"创建成功");
    }else{
        NSLog(@"文件夹已经存在创建失败");
    }
    
    //归档到沙盒中
    NSArray * array = @[@"adklfj",@"aalsdjfl",@"asdfjlalsdf"];
    NSString * path = [[ZZDiskManager fetchDocumentsPath] stringByAppendingPathComponent:@"abc.plist"];
    [array writeToFile:path atomically:YES];

    
//    ZZRadioControl *rb1 = [[ZZRadioControl alloc] initWithGroupId:@"first group" index:0];
//    ZZRadioControl *rb2 = [[ZZRadioControl alloc] initWithGroupId:@"first group" index:1];
//    ZZRadioControl *rb3 = [[ZZRadioControl alloc] initWithGroupId:@"first group" index:2];
//    
//    rb1.frame = CGRectMake(10,90,22,22);
//    rb2.frame = CGRectMake(10,120,22,22);
//    rb3.frame = CGRectMake(10,150,22,22);
//    
//    [self.view addSubview:rb1];
//    [self.view addSubview:rb2];
//    [self.view addSubview:rb3];
//    
//    [ZZRadioControl addObserverForGroupId:@"first group" observer:self];
    
    
    ZZDatePickerView *datePickerView = [[ZZDatePickerView alloc]initWithFrame:CGRectMake(0, 100, VW, VH / 3)];
    datePickerView.delegate = self;
    datePickerView.datePickerMode = ZZDatePickerModeDateAndTime;
    datePickerView.dateFormat = @"yyyyMMdd";
    [self.view addSubview:datePickerView];
}

-(void)datePickerView:(UIView *)datePickerView didSelectDatePickerView:(NSString *)date
{
    NSLog(@"_+_+_+_+_+%@",date);

}


//代理方法
-(void)radioButtonSelectedAtIndex:(NSUInteger)index inGroup:(NSString *)groupId{
    NSLog(@"changed to %lu in %@",(unsigned long)index,groupId);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
