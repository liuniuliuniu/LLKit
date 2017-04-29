//
//  NSString+Extension.m
//  MVC
//
//  Created by liushaohua on 2017/4/5.
//  Copyright © 2017年 liushaohua. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

// 判断是不是可用的手机号码或固话
- (BOOL)isUserPhone
{
    NSString * MOBILE = @"^[1][3578]\\d{9}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    
    return [regextestmobile evaluateWithObject:self];
}

// 判断用户名
- (BOOL)isUserName
{
    NSString *regex = @"^([\u4e00-\u9fa5]|[A-Za-z]){2,}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:self];
}

// 判断密码
- (BOOL)isPassword
{
    NSString *regex = @"^[?!\\x00-\\xff]{6,16}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:self];
}

// 判断公司名
- (BOOL)isCompany
{
    NSString *regex = @"^([\u4e00-\u9fa5]|[A-Za-z])+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:self];
}

// 判断职务
- (BOOL)isPosition
{
    NSString *regex = @"^([\u4e00-\u9fa5]|[A-Za-z])+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:self];
}

// 判断固话
- (BOOL)isFixTel
{
    NSString *regexThree = @"^(010|021|022|023|024|025|026|027|028|029|852)-\\d{8}$";
    NSString *regexFour = @"^(0[3-9][1-9]{2})-\\d{7,8}$";
    NSPredicate *predThree = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexThree];
    NSPredicate *predFour = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexFour];
    
    return [predThree evaluateWithObject:self] || [predFour evaluateWithObject:self];
}

// 判断是否是座机电话
- (BOOL)isFixTelWithOutConnection {
    NSString *regexThree = @"^(010|021|022|023|024|025|026|027|028|029|852)\\d{8}$";
    NSString *regexFour = @"^(0[3-9][0-9]{2})\\d{7,8}$";
    NSPredicate *predThree = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexThree];
    NSPredicate *predFour = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexFour];
    
    return [predThree evaluateWithObject:self] || [predFour evaluateWithObject:self];
}

// 判断邮箱
- (BOOL)isEmail
{
    NSString *email = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *regextestEmail = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", email];
    
    return [regextestEmail evaluateWithObject:self];
}

- (BOOL)checkInputMsg {
    
    NSString *predicateStr = @"^[\\s]{0,}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", predicateStr];
    
    return [predicate evaluateWithObject:self];
}

- (BOOL)isValidURL {
    
    NSString *predicateStr = @"[a-zA-z]+://[^\\s]*";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", predicateStr];
    
    return [predicate evaluateWithObject:self];
}

- (BOOL)isValidateIdentityCard {
    
    NSString *predicateStr = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", predicateStr];
    return [predicate evaluateWithObject:self];
}

- (CGSize)ex_sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size
{
    CGSize resultSize;
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:@selector(boundingRectWithSize:options:attributes:context:)];
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setTarget:self];
        [invocation setSelector:@selector(boundingRectWithSize:options:attributes:context:)];
        NSDictionary *attributes = @{ NSFontAttributeName:font };
        NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin;
        NSStringDrawingContext *context;
        [invocation setArgument:&size atIndex:2];
        [invocation setArgument:&options atIndex:3];
        [invocation setArgument:&attributes atIndex:4];
        [invocation setArgument:&context atIndex:5];
        [invocation invoke];
        CGRect rect;
        [invocation getReturnValue:&rect];
        resultSize = rect.size;
    } else {
        NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:@selector(sizeWithFont:constrainedToSize:)];
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setTarget:self];
        [invocation setSelector:@selector(sizeWithFont:constrainedToSize:)];
        [invocation setArgument:&font atIndex:2];
        [invocation setArgument:&size atIndex:3];
        [invocation invoke];
        [invocation getReturnValue:&resultSize];
    }
    
    return resultSize;
}

@end
