//
//  UIColor+FFExtension.h
//
//  Created by 陈飞
//

#import <UIKit/UIKit.h>

@interface UIColor (FFExtension)
///  随机色
+ (instancetype)ff_randomColor;
///  RGB颜色
+ (instancetype)ff_colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue;
///  RGB颜色加透明度
+ (instancetype)ff_colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue alpha:(uint8_t)alpha;
/// CSS颜色  #333333
+ (instancetype)ff_colorWithString:(NSString *)str;
/// 16进制数字 0xFF0000 红色
+ (instancetype)ff_colorWithHex:(uint32_t)hex;
/// r值(0～255)
- (u_int8_t)ff_redValue;
/// g值(0～255)
- (u_int8_t)ff_greenValue;
/// b值(0～255)
- (u_int8_t)ff_blueValue;
/// alpha 值
- (CGFloat)ff_alphaValue;
@end
