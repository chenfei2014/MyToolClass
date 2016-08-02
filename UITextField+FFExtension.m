
#import "UITextField+FFExtension.h"

static NSString * const FFPlaceholderColorKey = @"placeholderLabel.textColor";

@implementation UITextField (FFExtension)

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    NSString *oldPlaceholder = self.placeholder;
    self.placeholder = @" ";
    self.placeholder = oldPlaceholder;
    
    if (placeholderColor == nil) {
        placeholderColor = [UIColor colorWithRed:0 green:0 blue:0.0980392 alpha:0.22];
    }
    
    [self setValue:placeholderColor forKeyPath:FFPlaceholderColorKey];
}

- (UIColor *)placeholderColor
{
    return [self valueForKeyPath:FFPlaceholderColorKey];
}

@end
