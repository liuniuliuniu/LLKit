//
//  LLLabelViewController.m
//  LLKitDemo
//
//  Created by 大影象科技 on 2017/5/3.
//  Copyright © 2017年 liushaohua. All rights reserved.
//

#import "LLLabelViewController.h"
#import "LLWebViewController.h"
#import "LLKit.h"

@interface LLLabelViewController ()<LLLabelDelegate>

@property (weak, nonatomic) IBOutlet LLLabel *textLabel;

@end

@implementation LLLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.textLabel.text = @"#豆姐在现场# @杨幂: 纽约[飞机]上海到达。女王荣耀归来！ 微博链接：http://weibo.com/yangmiblog?refer_flag=1001030101_, 协议《一二一》 ,杨幂专属定制 杨幂驾到";
    // 非匹配内容文字颜色
    self.textLabel.LL_commonTextColor = [UIColor darkGrayColor];
    
    // 点选高亮颜色
    self.textLabel.LL_textHightLightBackGroundColor = [UIColor lightGrayColor];
    
    // 匹配用户名
    [self.textLabel setHightLightTextColor:[UIColor orangeColor] forHandleStyle:HandleStyleUser];
    // 匹配标题
    [self.textLabel setHightLightTextColor:[UIColor yellowColor] forHandleStyle:HandleStyleTopic];
    // 匹配链接
    [self.textLabel setHightLightTextColor:[UIColor purpleColor] forHandleStyle:HandleStyleLink];
    
    [self.textLabel setHightLightTextColor:[UIColor greenColor] forHandleStyle:HandleStyleAgreement];
    
    
    // 自定义的文字
    self.textLabel.LL_matchArr = @[
                                   @{
                                       @"string":@"高亮显示",
                                       @"color":[UIColor magentaColor]
                                       }
                                   ];
    
    // block 打印的字符串
    self.textLabel.LL_tapOperation = ^(UILabel * label, HandleStyle style, NSString * selectedString, NSRange range) {
        
        NSLog(@"selectedString--%@",selectedString);
        
        
        if (style == HandleStyleLink) {
            LLWebViewController *webVC = [LLWebViewController new];
            webVC.urlString = selectedString;
            [self.navigationController pushViewController:webVC animated:YES];
        }                
    };
    
    self.textLabel.delegate = self;
    
}


#pragma LLLabelDelegate
- (void)LL_label:(LLLabel *)label didSelectedString:(NSString *)selectedStr forStyle:(HandleStyle)style inRange:(NSRange)range{
    NSLog(@"代理打印的字符串----%@",selectedStr);
}





@end
