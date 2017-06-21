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
