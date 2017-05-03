//
//  LLWebViewController.m
//  LLKitDemo
//
//  Created by 大影象科技 on 2017/5/3.
//  Copyright © 2017年 liushaohua. All rights reserved.
//

#import "LLWebViewController.h"

@interface LLWebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation LLWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:self.urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];

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
