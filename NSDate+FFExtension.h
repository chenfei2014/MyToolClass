//
//  NSDate+FFExtension.h
//
//  Created by 陈飞
//

#import <Foundation/Foundation.h>

@interface NSDate (FFExtension)
+ (NSDate *)ff_dateWithString:(NSString *)dateString withFormat:(NSString *)format;

///  是否是今年
- (BOOL)ff_isThisYear;

///  是否是昨天
- (BOOL)ff_isYesterday;

///  是否是今天
- (BOOL)ff_isToday;
@end
