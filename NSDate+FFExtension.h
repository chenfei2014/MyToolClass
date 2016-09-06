//
//  NSDate+FFExtension.h
//
//  Created by 陈飞
//

#import <Foundation/Foundation.h>

@interface NSDate (FFExtension)
+ (NSDate *)ff_dateWithString:(NSString *)dateString withFormat:(NSString *)format;
@end
