//
//  UIImage+Extension.m
//
//  Created by 陈飞
//

#import "UIImage+FFExtension.h"

@implementation UIImage (FFExtension)

+ (UIImage *)imageAddWatermark:(UIImage *)image waterMark:(NSString *)mark markDict:(NSDictionary *)dict point:(CGPoint)point
{
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0);
    [image drawAtPoint:CGPointZero];
    [mark drawAtPoint:CGPointZero withAttributes:dict];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)imageCut:(UIImage *)image
{
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [path addClip];
    [image drawAtPoint:CGPointZero];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return  newImage;
}

+ (UIImage *)imageCut:(UIImage *)image withBorder:(CGFloat)border borderColor:(UIColor *)color
{
    CGFloat imageW = image.size.width + 2 * border;
    CGFloat imageH = image.size.height + 2 * border;
    
    CGFloat circleW = imageW > imageH ? imageH : imageW;
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(circleW, circleW), NO, 0.0);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, circleW, circleW)];
    CGContextRef ref = UIGraphicsGetCurrentContext();
    CGContextAddPath(ref, path.CGPath);
    
    [color set];
    
    CGContextFillPath(ref);

    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(border, border, image.size.width, image.size.height)];
    [clipPath addClip];
    [image drawAtPoint:CGPointMake(border, border)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)imagePrintScreen:(UIView *)view;
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0.0);
    CGContextRef ref = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:ref];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
@end
