//
//  NSDate+FFExtension.m
//
//  Created by 陈飞
//

#import "NSDate+FFExtension.h"

@implementation NSDate (FFExtension)
+ (NSDate *)ff_dateWithString:(NSString *)dateString withFormat:(NSString *)format
{
    if (dateString.length == 0 || format.length == 0) return nil;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSDate *date = [formatter dateFromString:dateString];
    return date;
}
@end
