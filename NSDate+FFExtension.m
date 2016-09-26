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

- (BOOL)ff_isThisYear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *newComponents = [calendar components:NSCalendarUnitYear fromDate:[NSDate date]];
    return newComponents.year == dateComponents.year;
}

- (BOOL)ff_isYesterday
{
    NSDate *now = [NSDate date];
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    NSString *dateStr = [fmt stringFromDate:self];
    NSString *nowStr = [fmt stringFromDate:now];
    
    NSDate *date = [fmt dateFromString:dateStr];
    now = [fmt dateFromString:nowStr];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *dateComponents = [calendar components:unit fromDate:date toDate:now options:0];
    return dateComponents.year == 0 && dateComponents.month == 0 && dateComponents.day == 1;
}

- (BOOL)ff_isToday
{
    NSDate *now = [NSDate date];
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    NSString *dateStr = [fmt stringFromDate:self];
    NSString *nowStr = [fmt stringFromDate:now];
    
    return [dateStr isEqualToString:nowStr];
}
@end
