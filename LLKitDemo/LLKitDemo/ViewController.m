//
//  ViewController.m
//  LLKitDemo
//
//  Created by 大影象科技 on 2017/4/29.
//  Copyright © 2017年 liushaohua. All rights reserved.
//

#import "ViewController.h"
#import "LLKit.h"
#import "LLLabelViewController.h"
#import "LLPlaceHodelTextViewVC.h"
#import "UIAlertViewController.h"


static NSString *cellID = @"cellID";

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation ViewController


- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"---");

}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 100;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"LLLabel";
            break;
        case 1:
            cell.textLabel.text = @"LLPlaceholderTextView";
            break;
        case 2:
            cell.textLabel.text = @"UIAlertViewController";
            break;

        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:{
            UIStoryboard *sboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            LLLabelViewController *LabelVC = [sboard instantiateViewControllerWithIdentifier:@"label"];
            [self.navigationController pushViewController:LabelVC animated:YES];
        }
            break;
        case 1:{
            LLPlaceHodelTextViewVC *textVC = [LLPlaceHodelTextViewVC new];
            [self.navigationController pushViewController:textVC animated:YES];                    
        }
            break;
        case 2:
        {
            UIAlertViewController *vc = [UIAlertViewController new];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
        default:
            break;
    }


}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
