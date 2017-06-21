//
//  AddClickButton.m
//  MVC
//
//  Created by liushaohua on 2016/10/28.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import "LLClickButton.h"

@implementation LLClickButton

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    CGRect bounds = self.bounds;
    CGFloat widthDelta = 44.0 - bounds.size.width;
    CGFloat heightDelta = 44.0 - bounds.size.height;
    bounds = CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta);	//注意这里是负数，扩大了之前的bounds的范围
    return CGRectContainsPoint(bounds, point);
}

@end
