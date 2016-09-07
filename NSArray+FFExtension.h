//
//  NSArray+FFExtension.h
//
//  Created by 陈飞
//
#import <Foundation/Foundation.h>

@interface NSArray (FFExtension)
- (BOOL)ff_isEmpty;

- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *strM = [NSMutableString stringWithString:@"(\n"];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [strM appendFormat:@"\t%@,\n", obj];
    }];
    
    [strM appendString:@")"];
    
    return strM;
}
@end
