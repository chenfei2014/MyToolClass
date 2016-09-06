//
//  NSDictionary+FFExtension.h
//
//  Created by 陈飞
//

#import <Foundation/Foundation.h>

@interface NSDictionary (FFExtension)
- (BOOL)ff_containsObjectForKey:(id)key;
- (BOOL)ff_isEmpty;
@end
