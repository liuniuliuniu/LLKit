//
//  LLAlertViewAnimation.h
//  AnimDemo
//
//  Created by liushaohua on 2016/10/4.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLAlertViewAnimation : UIView

/**需要展示的customView*/
@property (strong, nonatomic) UIView *contentView;

/**是否需要动画展示出来  default is YES*/
@property (nonatomic,assign) BOOL isAnim;

/**展示*/
- (void)show;

/**隐藏*/
- (void)hide;

@end


