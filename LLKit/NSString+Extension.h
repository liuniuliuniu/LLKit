//
//  NSString+Extension.h
//  MVC
//
//  Created by liushaohua on 2017/4/5.
//  Copyright © 2017年 liushaohua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (Extension)

- (BOOL)isUserPhone;  // 判断是手机号码
- (BOOL)isUserName;   // 判断用户名
- (BOOL)isPassword;   // 判断密码
- (BOOL)isCompany;    // 判断公司名
- (BOOL)isPosition;   // 判断职务
- (BOOL)isFixTel;     // 判断固话
- (BOOL)isEmail;      // 判断邮箱
- (BOOL)checkInputMsg;// 判断输入信息是否为空
- (BOOL)isFixTelWithOutConnection; // 判断输入是否是座机 中间没有“－”连接符
- (BOOL)isValidURL;// 判断是否是有效网址
- (BOOL)isValidateIdentityCard;// 验证身份证号

//计算字符串的CGSize
- (CGSize)ex_sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

@end
