//
//  FTGBorder.m
//  Border
//
//  Created by Khoa Pham on 7/12/15.
//  Fantageek
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>
#import <objc/message.h>

#ifdef DEBUG

#pragma mark - Swizzle
static void swizzleInstanceMethod(Class class, SEL originalAction, SEL swizzledAction) {
    method_exchangeImplementations(class_getInstanceMethod(class, originalAction),
                                   class_getInstanceMethod(class, swizzledAction));
}

static void swizzle() {
    swizzleInstanceMethod(UIView.class, @selector(didMoveToSuperview),
                          @selector(ftg_didMoveToSuperview));
}

__attribute__((constructor)) static void FTGBorderConstructor(void) {
    @autoreleasepool {
        swizzle();
    }
}

#pragma mark - UIView
@interface UIView (FTGBorder)
@end

@implementation UIView (FTGBorder)

- (void)ftg_didMoveToSuperview {
    self.layer.borderWidth = 1;
    self.layer.borderColor = [UIColor brownColor].CGColor;

    [self ftg_didMoveToSuperview];
}

@end

#endif // DEBUG