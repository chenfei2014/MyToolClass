//
//  UIBarButtonItem+FFExtension.h
//
//  Created by 陈飞
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (FFExtension)

///  快捷创建UIBarButtonItem
+ (UIBarButtonItem *)ff_itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;

@end
