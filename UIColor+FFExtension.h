//
//  UIColor+FFExtension.h
//
//  Created by 陈飞
//

#import <UIKit/UIKit.h>

@interface UIColor (FFExtension)
/// r值(0～255)
- (u_int8_t)ff_redValue;
/// g值(0～255)
- (u_int8_t)ff_greenValue;
/// b值(0～255)
- (u_int8_t)ff_blueValue;
/// alpha 值
- (CGFloat)ff_alphaValue;

/// CSS颜色  such as #333333
+ (UIColor *)colorWithString:(NSString *)str;
@end
