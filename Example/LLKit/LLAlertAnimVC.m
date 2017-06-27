//
//  LLAlertAnimVC.m
//  LLKit
//
//  Created by liushaohua on 2017/6/21.
//  Copyright © 2017年 416997919@qq.com. All rights reserved.
//

#import "LLAlertAnimVC.h"
#import "LLKit.h"


@interface LLAlertAnimVC ()

@property(nonatomic, strong)UIView *customV;

@end

@implementation LLAlertAnimVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)showAlertWithTitleWithCancel:(id)sender {
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"❌" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消");
    }];
    
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"✔️" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"确定");
    }];
    [self showAlertWithTitle:@"标题" message:@"内容" cancelAction:cancel confirmAction:confirm];
}

- (IBAction)showToastWithTextConfirm2:(id)sender {
    
    [self showAlertWithTitle:@"标题" message:@"内容" confirmTitle:@"收藏" confirmHandler:^(UIAlertAction *confirmAction) {
        NSLog(@"收藏");
    }];
}

- (IBAction)showAlertWithTitle:(id)sender {
    [self showAlertWithTitle:@"标题" message:@"内容" confirmHandler:^(UIAlertAction *confirmAction) {
        NSLog(@"确定");
    }];
}

- (IBAction)showToastWithDelay:(id)sender {
    // 延迟5秒钟弹出来
    [self showToastWithText:@"延迟2秒钟才弹出来" afterDelay:2];
}

- (IBAction)showToastWithText {
    [self showToastWithText:@"123"];
}
- (IBAction)showhud:(id)sender {
    [self showHUD];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self hideHUD];
    });
}

- (IBAction)showCunstomV:(id)sender {
    LLAlertViewAnimation *alertV = [LLAlertViewAnimation new];
//  将自定的View赋值给alertV的contentView上
    alertV.contentView = self.customV;
//  弹框是否包含动画 默认是yes
//  alertV.isAnim = NO;
    [alertV show];
}


- (void)btnClick{
    LLAlertViewAnimation *alertV = (LLAlertViewAnimation *)self.customV.superview;
    [alertV hide];
}
- (UIView *)customV{
    if (!_customV) {
        _customV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 150, 150)];
        _customV.backgroundColor = [UIColor redColor];
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(50, 50, 50, 50)];
        [btn setTitle:@"确定" forState:UIControlStateNormal];
        [_customV addSubview:btn];
        [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _customV;
}




@end
