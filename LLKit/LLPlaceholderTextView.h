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
 占位的lable
 */
@property (nonatomic, strong) UILabel * placeHolderLabel;

/**
 占位的字符串
 */
@property (nonatomic, copy) NSString * placeholder;

/**
 占位符的颜色
 */
@property (nonatomic, strong) UIColor * placeholderColor;


/**
 边框
 */
@property(nonatomic, strong)UIView *lineView;

/**
 文字改变的颜色
 */

- (void)textChanged:(NSNotification * )notification;

@end
