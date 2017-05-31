//
//  UILabel+addition.h
//
//
//  Created by liushaohua on 16/8/12.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (addition)


+ (instancetype)LabelmakeLableWithText:(NSString *)text andTextColor:(UIColor *)color andFontSize:(CGFloat)fontSize;



/**
 设置label的行间距

 @param label label对象
 @param space 行间距
 */
+ (void)LabelchangeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变字间距
 */
+ (void)LabelchangeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变行间距和字间距
 */
+ (void)LabelchangeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace;



@end
