//
//  LLPlaceHodelTextViewVC.m
//  LLKit
//
//  Created by liushaohua on 2017/6/20.
//  Copyright © 2017年 416997919@qq.com. All rights reserved.
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
    textView.frame = CGRectMake(100, 100, 200, 100);
    textView.font = [UIFont systemFontOfSize:20];
    textView.placeholderString = @"反馈内容";
    // 动态更改高度
    textView.isChangeHeight = YES;
    textView.textColor = [UIColor blackColor];
    [self.view addSubview:textView];

    
    
}

@end
