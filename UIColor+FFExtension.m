
#import "UIColor+FFExtension.h"

@implementation UIColor (FFExtension)
- (u_int8_t)ff_redValue {
    return (u_int8_t)(CGColorGetComponents(self.CGColor)[0] * 255);
}

- (u_int8_t)ff_greenValue {
    return (u_int8_t)(CGColorGetComponents(self.CGColor)[1] * 255);
}

- (u_int8_t)ff_blueValue {
    return (u_int8_t)(CGColorGetComponents(self.CGColor)[2] * 255);
}

- (CGFloat)ff_alphaValue {
    return CGColorGetComponents(self.CGColor)[3];
}
@end
