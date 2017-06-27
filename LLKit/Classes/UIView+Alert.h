//
//  UIView+Alert.h
//  Pods
//
//  Created by liushaohua on 2017/1/10.
//
//

#import <UIKit/UIKit.h>


@protocol Alert <NSObject>

/**展示菊花*/
- (void)showHUD;
/**展示带文字的菊花*/
- (void)showHUDWithText:(NSString *)text;
- (void)hideHUD;
/**只展示文字*/
- (void)showToastWithText:(NSString *)toastString;
/**展示文字以及位置*/
- (void)showToastWithText:(NSString *)toastString positon:(id)positon;
/**延迟几s后再进行展示*/
- (void)showToastWithText:(NSString *)toastString afterDelay:(NSTimeInterval)timeInterval;
/**alert默认是确定文字*/
- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message confirmHandler:(void(^)(UIAlertAction *confirmAction))handler;
/**alert更改确定文字*/
- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message confirmTitle:(NSString *)confirmTitle confirmHandler:(void(^)(UIAlertAction *confirmAction))handler;
/**alert*/
- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message cancelAction:(UIAlertAction *)cancelAction confirmAction:(UIAlertAction *)confirmAction;

@end

@interface UIView (Alert)<Alert>


@end

@interface UIViewController (Alert)<Alert>
@end
