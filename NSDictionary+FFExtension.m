//
//  NSDictionary+FFExtension.m
//  追追漫画
//
//  Created by chenfei on 16/7/18.
//  Copyright © 2016年 Levin Wei. All rights reserved.
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
