//
//  UIBarButtonItem+FFExtension.m
//
//  Created by 陈飞

#import "UIBarButtonItem+FFExtension.h"

@implementation UIBarButtonItem (FFExtension)
+ (UIBarButtonItem *)ff_itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    button.size = button.currentBackgroundImage.size;
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}
@end
