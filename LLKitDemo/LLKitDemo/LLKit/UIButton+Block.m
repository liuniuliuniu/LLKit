//
//  UIButton+Block.m
//  MVC
//
//  Created by liushaohua on 2017/4/5.
//  Copyright © 2017年 liushaohua. All rights reserved.
//

#import "UIButton+Block.h"
#import <objc/runtime.h>

@implementation UIButton (Block)

- (void)addTargetControlEvent:(UIControlEvents)controlEvents actionBlock:(actionBlock)action {
    objc_setAssociatedObject(self, @selector(addTargetControlEvent:actionBlock:), action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(btnClick:) forControlEvents:controlEvents];
}

- (void)btnClick:(UIButton *)btn {
    actionBlock block = objc_getAssociatedObject(self, @selector(addTargetControlEvent:actionBlock:));
    if (block) {
        block();
    }
}

- (void)addTargetWithButtonControlEvent:(UIControlEvents)controlEvents actionBlock:(actionBlockWithButton)block {
    objc_setAssociatedObject(self, @selector(addTargetWithButtonControlEvent:actionBlock:), block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(btnClickWithButton:) forControlEvents:controlEvents];
}

- (void)btnClickWithButton:(UIButton *)btn {
    actionBlockWithButton block = objc_getAssociatedObject(self, @selector(addTargetWithButtonControlEvent:actionBlock:));
    if (block) {
        block(btn);
    }
}

@end
