
#import <Foundation/Foundation.h>

@interface NSString (FFExtension)
#pragma mark - 沙盒相关
+ (NSString *)ff_documentPath;
+ (NSString *)ff_cachePath;
+ (NSString *)ff_tmpPath;

///  字符串大小
- (CGSize)ff_sizeWithFont:(UIFont *)font;
///  指定最大宽度的字符串大小
- (CGSize)ff_sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW;
///  文件大小
- (long long)ff_fileSize;
///  json串
- (NSString *)ff_jsonStringWithObject(id)object;
@end
