//
//  LLPlaceholderTextView.m
//  LLProgramFramework
//
//  Created by liushaohua on 2016/10/28.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import "LLPlaceholderTextView.h"

@interface LLPlaceholderTextView ()

/**
 占位的lable
 */
@property (nonatomic, strong) UILabel * placeHolderLabel;

@end


@implementation LLPlaceholderTextView{

    // 默认的高度
    CGRect defaultFrame;
    // 变化的高度
    CGRect changeFrame;
}


-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
                
        self.placeholderString = @"请输入";
        self.placeholderColor = [UIColor lightGrayColor];
        self.isChangeHeight = NO;
        self.layer.borderColor = [UIColor darkGrayColor].CGColor;
        self.layer.borderWidth = 0.5;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
    }
    
    return self;
}

- (void)layoutSubviews{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultFrame = self.frame;
        changeFrame = self.frame;
    });
}


// 设置占位符的文字
- (void)setPlaceholderString:(NSString *)placeholderString{
    
    if (_placeholderString != placeholderString) {
        
        _placeholderString = placeholderString;
        
        [self.placeHolderLabel removeFromSuperview];
        
        self.placeHolderLabel = nil;
        
        [self setNeedsDisplay];
        
    }
}

- (void)textChanged:(NSNotification *)notification{
    
    if ([[self placeholderString] length] == 0) {
        return;
    }
    
    if ([[self text] length] == 0) {
        [[self viewWithTag:999] setAlpha:1.0];
    }
    
    else{
        [[self viewWithTag:999] setAlpha:0];
    }
    
    
    if (_isChangeHeight) {
        CGFloat labelHeight = self.contentSize.height;
        CGFloat count = labelHeight / self.font.lineHeight;
        CGFloat changeHeight = count * self.font.lineHeight;
        changeFrame.size.height = changeHeight;
        
        if (changeHeight < defaultFrame.size.height) {
            self.frame = defaultFrame;
        }else{
            self.frame = changeFrame;
        }
    }

}

-(void)drawRect:(CGRect)rect{
    
    [super drawRect:rect];
    
    if ([[self placeholderString] length] > 0) {
        if (_placeHolderLabel == nil) {
            _placeHolderLabel = [[UILabel alloc]initWithFrame:CGRectMake(8, 8, self.bounds.size.width - 16, 0)];
            _placeHolderLabel.lineBreakMode = NSLineBreakByWordWrapping;
            _placeHolderLabel.numberOfLines = 0;
            _placeHolderLabel.font = self.font;
            _placeHolderLabel.backgroundColor = [UIColor clearColor];
            _placeHolderLabel.textColor = self.placeholderColor;
            _placeHolderLabel.alpha = 0;
            _placeHolderLabel.tag = 999;
            [self addSubview:_placeHolderLabel];
        }
        _placeHolderLabel.text = self.placeholderString;
        [_placeHolderLabel sizeToFit];
        [self sendSubviewToBack:_placeHolderLabel];
    }
    
    if ([[self text] length] == 0 && [[self placeholderString] length] >0) {
        [[self viewWithTag:999] setAlpha:1.0];        
    }
    
}

@end
