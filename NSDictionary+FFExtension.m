//
//  NSDictionary+FFExtension.m
//
//  Created by 陈飞
//

#import "NSDictionary+FFExtension.h"

@implementation NSDictionary (FFExtension)
- (BOOL)ff_containsObjectForKey:(id)key {
    return [[self allKeys] containsObject:key];
}

- (BOOL)ff_isEmpty {
    return self.count == 0;
}

- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *strM = [NSMutableString stringWithString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [strM appendFormat:@"\t%@ = %@;\n", key, obj];
    }];
    
    [strM appendString:@"}\n"];
    
    return strM;
}
@end
