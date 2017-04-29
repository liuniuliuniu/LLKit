//
//  ViewController.m
//  LLKitDemo
//
//  Created by 大影象科技 on 2017/4/29.
//  Copyright © 2017年 liushaohua. All rights reserved.
//

#import "ViewController.h"
#import "LLKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 仅仅对一个分类进行了演示  可以源文件参考其他类的使用
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.center = self.view.center;
    [self.view addSubview:btn];
    [btn addTargetControlEvent:UIControlEventTouchUpInside actionBlock:^{
        NSLog(@"按钮被点击了");
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
