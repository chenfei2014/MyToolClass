//
//  UIImage+Extension.h
//
//  Created by 陈飞
//

#import <UIKit/UIKit.h>

@interface UIImage (FFExtension)

///  图片添加水印
+ (UIImage *)imageAddWatermark:(UIImage *)image waterMark:(NSString *)mark markDict:(NSDictionary *)dict point:(CGPoint)point;

///  裁剪图片为圆形
+ (UIImage *)imageCut:(UIImage *)image;

///  裁剪图片为带边的圆形图片
+ (UIImage *)imageCut:(UIImage *)image withBorder:(CGFloat)border borderColor:(UIColor *)color;

///  截图
+ (UIImage *)imagePrintScreen:(UIView *)view;
@end
