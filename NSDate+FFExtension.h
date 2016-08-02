//
//  NSDate+FFExtension.h
//  追追漫画
//
//  Created by chenfei on 16/7/18.
//  Copyright © 2016年 Levin Wei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (FFExtension)
+ (NSDate *)ff_dateWithString:(NSString *)dateString withFormat:(NSString *)format;
@end
