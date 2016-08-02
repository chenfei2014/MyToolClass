//
//  NSDictionary+FFExtension.h
//  追追漫画
//
//  Created by chenfei on 16/7/18.
//  Copyright © 2016年 Levin Wei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (FFExtension)
- (BOOL)ff_containsObjectForKey:(id)key;
- (BOOL)ff_isEmpty;
@end
