//
//  LLLabel.h
//  LLKitDemo
//
//  Created by liushaohua on 2016/10/28.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, HandleStyle) {
    HandleStyleNone = 0,
    HandleStyleUser = 1,
    HandleStyleTopic = 2,
    HandleStyleLink = 3,
    HandleStyleAgreement = 4,
    HandleStyleUserDefine = 5
};

@class LLLabel;

@protocol LLLabelDelegate <NSObject>

-(void)LL_label:(LLLabel *)label didSelectedString:(NSString *)selectedStr forStyle:(HandleStyle)style inRange:(NSRange)range;

@end


typedef void(^TapHandle)(UILabel *, HandleStyle, NSString *, NSRange);

@interface LLLabel : UILabel

/** 普通文字颜色 */
@property(nonatomic, strong)UIColor *LL_commonTextColor;

/** 选中是高亮背景色 */
@property(nonatomic, strong)UIColor *LL_textHightLightBackGroundColor;

/** 给不同种类的高亮文字设置颜色 */
-(void)setHightLightTextColor:(UIColor *)hightLightColor forHandleStyle:(HandleStyle)handleStyle;

/** 自定义要高亮匹配的 字符串+显示颜色 字典数组, 请把要匹配的文字用string这个key存入字典, 把要高亮的颜色用color这个key存入字典, 具体见demo */
@property(nonatomic, strong)NSArray<NSDictionary *> *LL_matchArr;

/** 点击事件block */
@property(nonatomic, strong)TapHandle LL_tapOperation;
/** 代理 */
@property (nonatomic,weak) id<LLLabelDelegate>  delegate;


@end
