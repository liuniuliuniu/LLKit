//
//  NSDate+String.m
//  MVC
//
//  Created by liushaohua on 2017/4/5.
//  Copyright © 2017年 liushaohua. All rights reserved.
//

#import "NSDate+String.h"

@implementation NSDate (String)

#pragma mark - 单例
+ (NSDateFormatter *)sharedDateFormatter {
    static NSDateFormatter *dateFormatter;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en"];
    });
    
    return dateFormatter;
}

+ (NSCalendar *)sharedCalendar {
    static NSCalendar *calendar;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        calendar = [NSCalendar currentCalendar];
    });
    
    return calendar;
}

#pragma mark - 日期方法
+ (NSString *)dateStringWithDelta:(NSTimeInterval)delta {
    [self sharedDateFormatter].dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:delta];
    
    return [[self sharedDateFormatter] stringFromDate:date];
}

- (NSString *)dateDescription {
    
    NSUInteger units = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *dateComponents = [[NSDate sharedCalendar] components:units fromDate:self];
    NSDateComponents *thisComponents = [[NSDate sharedCalendar] components:units fromDate:[NSDate date]];
    
    // 今天
    if (dateComponents.year == thisComponents.year
        && dateComponents.month == thisComponents.month
        && dateComponents.day == thisComponents.day) {
        
        NSInteger delta = (NSInteger)[[NSDate date] timeIntervalSinceDate:self];
        
        if (delta < 60) {
            return @"刚刚";
        }
        if (delta < 3600) {
            return [NSString stringWithFormat:@"%zd 分钟前", delta / 60];
        }
        return [NSString stringWithFormat:@"%zd 小时前", delta / 3600];
    }
    
    NSString *format = @"MM-dd HH:mm";
    
    if (dateComponents.year != thisComponents.year) {
        format = [@"yyyy-" stringByAppendingString:format];
    }
    [NSDate sharedDateFormatter].dateFormat = format;
    
    return [[NSDate sharedDateFormatter] stringFromDate:self];
}

@end
