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
@end
