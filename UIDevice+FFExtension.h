//
//  UIDevice+FFExtension.h
//
//  Created by 陈飞
//

#import <UIKit/UIKit.h>

@interface UIDevice (FFExtension)
// 设备是否越狱
+ (BOOL)ff_isBroken;
// 设备可用内存
+ (double)ff_availableMemory;
// 设备ip地址
+ (NSString *)ff_ipAddress;
@end
