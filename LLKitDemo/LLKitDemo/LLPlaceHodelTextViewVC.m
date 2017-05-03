//
//  LLPlaceHodelTextViewVC.m
//  LLKitDemo
//
//  Created by 大影象科技 on 2017/5/3.
//  Copyright © 2017年 liushaohua. All rights reserved.
//

#import "LLPlaceHodelTextViewVC.h"
#import "LLKit.h"

@interface LLPlaceHodelTextViewVC ()

@end

@implementation LLPlaceHodelTextViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    LLPlaceholderTextView *textView= [[LLPlaceholderTextView alloc]init];
    textView.frame = CGRectMake(100, 100, 200, 200);
    textView.font = [UIFont systemFontOfSize:20];
    textView.placeholder = @"反馈内容";
//    textView.placeholderColor = [UIColor darkGrayColor];
    textView.textColor = [UIColor blackColor];
    [self.view addSubview:textView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
