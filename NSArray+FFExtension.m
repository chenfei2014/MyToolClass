//
//  NSArray+FFExtension.m
//
//  Created by 陈飞
//

#import "NSArray+FFExtension.h"

@implementation NSArray (FFExtension)
- (BOOL)ff_isEmpty
{
    return self.count == 0;
}

- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *strM = [NSMutableString stringWithString:@"(\n"];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [strM appendFormat:@"\t%@,\n", obj];
    }];
    
    [strM appendString:@")"];
    
    return strM;
}
@end
