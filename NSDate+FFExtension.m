 //
//  NSDate+FFExtension.m
//  追追漫画
//
//  Created by chenfei on 16/7/18.
//  Copyright © 2016年 Levin Wei. All rights reserved.
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
