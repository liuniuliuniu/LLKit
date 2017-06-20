//
//  LLPlaceholderTextView.h
//  LLProgramFramework
//
//  Created by 大影象科技 on 2017/4/28.
//  Copyright © 2017年 liushaohua. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LLPlaceholderTextView : UITextView

/**
 占位的字符串 default is 请输入
 */
@property (nonatomic, copy) NSString * placeholderString;

/**
 占位符的颜色 default is darkGrayColor
 */
@property (nonatomic, strong) UIColor * placeholderColor;

/**
 动态更改高度 default is NO
 */
@property (nonatomic,assign) BOOL isChangeHeight;

@end
