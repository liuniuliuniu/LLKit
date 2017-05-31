//
//  UIAlertViewController.m
//  LLKitDemo
//
//  Created by liushaohua on 2017/5/8.
//  Copyright © 2017年 liushaohua. All rights reserved.
//

#import "UIAlertViewController.h"
#import "LLKit.h"

@interface UIAlertViewController ()

@end

@implementation UIAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"标题" message:@"我是自定义的allert" cancelActionTitle:@"取消" otherActionTitles:@[@"确定"] handle:^(NSInteger index) {
       
        
        NSLog(@"123-----%zd",index);
        
        
    }];
    
    
    [self presentViewController:vc animated:YES completion:nil];
    
    
}


@end
