//
//  LLAlertViewAnimation.m
//  AnimDemo
//
//  Created by liushaohua on 2016/10/4.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import "LLAlertViewAnimation.h"


@interface LLAlertViewAnimation ()

@property (strong, nonatomic) UIView *backgroundView;

@end

@implementation LLAlertViewAnimation

- (instancetype)init {
    if (self = [super initWithFrame:[UIScreen mainScreen].bounds]) {
        self.backgroundColor = [UIColor clearColor];
        
        _backgroundView = [[UIView alloc] initWithFrame:self.frame];
        _backgroundView.backgroundColor = [UIColor blackColor];
        
        self.isAnim = YES;
        [self addSubview:_backgroundView];
    }
    return self;
}

- (void)setContentView:(UIView *)contentView {
    _contentView = contentView;
    _contentView.center = self.center;
    [self addSubview:_contentView];
}

- (void)show {
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    NSArray *windowViews = [window subviews];
    if(windowViews && [windowViews count] > 0){
        
        NSInteger index = [windowViews count]-1;
        
        UIView *subView = [windowViews objectAtIndex:index];
        for(UIView *aSubView in subView.subviews)
        {
            [aSubView.layer removeAllAnimations];
        }
        
        [subView addSubview:self];
        
        [self showBackground];
        
        self.isAnim ? [self showAlertAnimation] : nil;
    }
}


- (void)hide {
    
    [self hideAlertAnimation];
    [self removeFromSuperview];
    
}

- (void)showBackground
{
    
    if (self.isAnim) {
        _backgroundView.alpha = 0;
        [UIView beginAnimations:@"fadeIn" context:nil];
        [UIView setAnimationDuration:0.35];
        _backgroundView.alpha = 0.6;
        [UIView commitAnimations];
    }else{
        _backgroundView.alpha = 0.6;
    }
    
    
}

-(void)showAlertAnimation
{    
    CAKeyframeAnimation * animation;
    animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 1;
    animation.removedOnCompletion = YES;
    animation.fillMode = kCAFillModeForwards;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.5, 0.5, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1, 1.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [_contentView.layer addAnimation:animation forKey:nil];
}


- (void)hideAlertAnimation {
    [UIView beginAnimations:@"fadeIn" context:nil];
    [UIView setAnimationDuration:0.35];
    _backgroundView.alpha = 0.0;
    [UIView commitAnimations];
}



@end
