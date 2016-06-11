//
//  UIView+LATClipCategory.m
//  LATClip
//
//  Created by Later on 16/6/1.
//  Copyright © 2016年 Later. All rights reserved.
//

#import "UIView+LATClipCategory.h"

@implementation UIView (LATClipCategory)
- (void)clipToRountWithBackgroundColor:(UIColor *)backgroundColor {
    [self clipToRountWithBackgroundColor:backgroundColor viewContentMode:UIViewContentModeScaleAspectFill];
}
- (void)clipToRountWithBackgroundImage:(UIImage *)backgroundImage {
    [self clipToRountWithBackgroundImage:backgroundImage viewContentMode:UIViewContentModeScaleAspectFill];
}
- (void)clipToRountWithBackgroundColor:(UIColor *)backgroundColor
                       viewContentMode:(UIViewContentMode)viewContentMode {
    [self clipToRountWithBorderWidth:0 borderColor:nil backgroundColor:backgroundColor viewContentMode:viewContentMode];
}
- (void)clipToRountWithBackgroundImage:(UIImage *)backgroundImage
                       viewContentMode:(UIViewContentMode)viewContentMode {
    [self clipToRountWithBorderWidth:0 borderColor:nil backgroundImage:backgroundImage viewContentMode:viewContentMode];
}
- (void)clipToRountWithBorderWidth:(CGFloat)borderWidth
                       borderColor:(UIColor *)borderColor
                   backgroundColor:(UIColor *)backgroundColor
                   viewContentMode:(UIViewContentMode)viewContentMode {
    [self clipToRountWithBorderWidth:borderWidth borderColor:borderColor backgroundImage:nil backgroundColor:backgroundColor viewContentMode:viewContentMode];
    
}
- (void)clipToRountWithBorderWidth:(CGFloat)borderWidth
                       borderColor:(UIColor *)borderColor
                   backgroundImage:(UIImage *)backgroundImage
                   viewContentMode:(UIViewContentMode)viewContentMode {
    [self clipToRountWithBorderWidth:borderWidth borderColor:borderColor backgroundImage:backgroundImage backgroundColor:nil viewContentMode:viewContentMode];
}
- (void)clipToRountWithBorderWidth:(CGFloat)borderWidth
                       borderColor:(UIColor *)borderColor
                   backgroundImage:(UIImage *)backgroundImage
                   backgroundColor:(UIColor *)backgroundColor
                   viewContentMode:(UIViewContentMode)viewContentMode {
    CGRect rect = CGRectZero;
    __block typeof(rect)blockRect = rect;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        if (CGRectEqualToRect(rect, CGRectZero)) {
            dispatch_sync(dispatch_get_main_queue(), ^{
                blockRect = self.bounds;
            });
        }
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:blockRect cornerRadius:CGRectGetHeight(blockRect)/2.f];
        UIImage *image = [LATImageClipHandle clipedImageWithRect:blockRect originalImage:backgroundImage borderWidth:borderWidth borderColor:borderColor fillColor:backgroundColor viewContentMode:viewContentMode path:path.CGPath];
        dispatch_async(dispatch_get_main_queue(), ^{
            if ([self isKindOfClass:[UIImageView class]]) {
                ((UIImageView *)self).image = image;
            } else if ([self isKindOfClass:[UIButton class]]) {
                [((UIButton *)self) setImage:image forState:UIControlStateNormal];
            } else {
                self.layer.backgroundColor = [UIColor colorWithPatternImage:image].CGColor;
            }
        });
        
    });
}


- (void)clipWithCorners:(UIRectCorner)corners
       cornerRadiusSize:(CGSize)cornerRadiusSize
        backgroundImage:(UIImage *)backgroundImage {
    [self clipWithCorners:corners cornerRadiusSize:cornerRadiusSize backgroundImage:backgroundImage viewContentMode:UIViewContentModeScaleAspectFill];
}
- (void)clipWithCorners:(UIRectCorner)corners
       cornerRadiusSize:(CGSize)cornerRadiusSize
        backgroundColor:(UIColor *)backgroundColor {
    [self clipWithCorners:corners cornerRadiusSize:cornerRadiusSize backgroundColor:backgroundColor viewContentMode:UIViewContentModeScaleAspectFill];
}
- (void)clipWithCorners:(UIRectCorner)corners
       cornerRadiusSize:(CGSize)cornerRadiusSize
        backgroundImage:(UIImage *)backgroundImage
        viewContentMode:(UIViewContentMode)viewContentMode {
    [self clipWithCorners:corners cornerRadiusSize:cornerRadiusSize borderWidth:0 borderColor:nil backgroundImage:backgroundImage backgroundColor:nil viewContentMode:viewContentMode];
    
}
- (void)clipWithCorners:(UIRectCorner)corners
       cornerRadiusSize:(CGSize)cornerRadiusSize
        backgroundColor:(UIColor *)backgroundColor
        viewContentMode:(UIViewContentMode)viewContentMode {
    [self clipWithCorners:corners cornerRadiusSize:cornerRadiusSize borderWidth:0 borderColor:nil backgroundImage:nil backgroundColor:backgroundColor viewContentMode:viewContentMode];
    
}
- (void)clipWithCorners:(UIRectCorner)corners
       cornerRadiusSize:(CGSize)cornerRadiusSize
            borderWidth:(CGFloat)borderWidth
            borderColor:(UIColor *)borderColor
        backgroundImage:(UIImage *)backgroundImage {
    [self clipWithCorners:corners cornerRadiusSize:cornerRadiusSize borderWidth:borderWidth borderColor:borderColor backgroundImage:backgroundImage backgroundColor:nil viewContentMode:UIViewContentModeScaleAspectFill];
    
}
- (void)clipWithCorners:(UIRectCorner)corners
       cornerRadiusSize:(CGSize)cornerRadiusSize
            borderWidth:(CGFloat)borderWidth
            borderColor:(UIColor *)borderColor
        backgroundColor:(UIColor *)backgroundColor {
    [self clipWithCorners:corners cornerRadiusSize:cornerRadiusSize borderWidth:borderWidth borderColor:borderColor backgroundImage:nil backgroundColor:backgroundColor viewContentMode:UIViewContentModeScaleAspectFill];
}
- (void)clipWithCorners:(UIRectCorner)corners
       cornerRadiusSize:(CGSize)cornerRadiusSize
            borderWidth:(CGFloat)borderWidth
            borderColor:(UIColor *)borderColor
        backgroundImage:(UIImage *)backgroundImage
        viewContentMode:(UIViewContentMode)viewContentMode {
    [self clipWithCorners:corners cornerRadiusSize:cornerRadiusSize borderWidth:borderWidth borderColor:borderColor backgroundImage:backgroundImage backgroundColor:nil viewContentMode:viewContentMode];
    
}
- (void)clipWithCorners:(UIRectCorner)corners
       cornerRadiusSize:(CGSize)cornerRadiusSize
            borderWidth:(CGFloat)borderWidth
            borderColor:(UIColor *)borderColor
        backgroundColor:(UIColor *)backgroundColor
        viewContentMode:(UIViewContentMode)viewContentMode {
    [self clipWithCorners:corners cornerRadiusSize:cornerRadiusSize borderWidth:borderWidth borderColor:borderColor backgroundImage:nil backgroundColor:backgroundColor viewContentMode:viewContentMode];
}
- (void)clipWithCorners:(UIRectCorner)corners
       cornerRadiusSize:(CGSize)cornerRadiusSize
            borderWidth:(CGFloat)borderWidth
            borderColor:(UIColor *)borderColor
        backgroundImage:(UIImage *)backgroundImage
        backgroundColor:(UIColor *)backgroundColor
        viewContentMode:(UIViewContentMode)viewContentMode {
    CGRect rect = CGRectZero;
    __block typeof(rect)blockRect = rect;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        if (CGRectEqualToRect(rect, CGRectZero)) {
            dispatch_sync(dispatch_get_main_queue(), ^{
                blockRect = self.bounds;
            });
        }
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:blockRect byRoundingCorners:corners cornerRadii:cornerRadiusSize];
        UIImage *image = [LATImageClipHandle clipedImageWithRect:blockRect originalImage:backgroundImage borderWidth:borderWidth borderColor:borderColor fillColor:backgroundColor viewContentMode:viewContentMode path:path.CGPath];
        dispatch_async(dispatch_get_main_queue(), ^{
            if ([self isKindOfClass:[UIImageView class]]) {
                ((UIImageView *)self).image = image;
            } else if ([self isKindOfClass:[UIButton class]]) {
                [((UIButton *)self) setImage:image forState:UIControlStateNormal];
            } else {
                self.layer.backgroundColor = [UIColor colorWithPatternImage:image].CGColor;
            }
        });
        
    });
}

- (void)clipedWithBorderWidth:(CGFloat)borderWidth
                  borderColor:(UIColor *)borderColor
              backgroundImage:(UIImage *)backgroundImage
              backgroundColor:(UIColor *)backgroundColor
              viewContentMode:(UIViewContentMode)viewContentMode
                         path:(CGPathRef)path {
    CGRect rect = CGRectZero;
    __block typeof(rect)blockRect = rect;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        if (CGRectEqualToRect(rect, CGRectZero)) {
            dispatch_sync(dispatch_get_main_queue(), ^{
                blockRect = self.bounds;
            });
        }
        UIImage *image = [LATImageClipHandle clipedImageWithRect:blockRect originalImage:backgroundImage borderWidth:borderWidth borderColor:borderColor fillColor:backgroundColor viewContentMode:viewContentMode path:path];
        dispatch_async(dispatch_get_main_queue(), ^{
            if ([self isKindOfClass:[UIImageView class]]) {
                ((UIImageView *)self).image = image;
            } else if ([self isKindOfClass:[UIButton class]]) {
                [((UIButton *)self) setImage:image forState:UIControlStateNormal];
            } else {
                self.layer.backgroundColor = [UIColor colorWithPatternImage:image].CGColor;
            }
        });
        
    });
}

- (void)clipWithCornerRadius:(LATRadius)cornerRadius
             backgroundColor:(UIColor *)backgroundColor {
    [self clipWithCornerRadius:cornerRadius backgroundColor:backgroundColor viewContentMode:UIViewContentModeScaleAspectFill];
}
- (void)clipWithCornerRadius:(LATRadius)cornerRadius
             backgroundImage:(UIImage *)backgroundImage {
    [self clipWithCornerRadius:cornerRadius backgroundImage:backgroundImage viewContentMode:UIViewContentModeScaleAspectFill];
}
- (void)clipWithCornerRadius:(LATRadius)cornerRadius
             backgroundImage:(UIImage *)backgroundImage
             viewContentMode:(UIViewContentMode)viewContentMode {
    [self clipWithCornerRadius:cornerRadius borderWidth:0 borderColor:nil backgroundImage:backgroundImage viewContentMode:viewContentMode];
}
- (void)clipWithCornerRadius:(LATRadius)cornerRadius
             backgroundColor:(UIColor *)backgroundColor
             viewContentMode:(UIViewContentMode)viewContentMode {
    [self clipWithCornerRadius:cornerRadius borderWidth:0 borderColor:nil backgroundColor:backgroundColor viewContentMode:viewContentMode];
}
- (void)clipWithCornerRadius:(LATRadius)cornerRadius
                 borderWidth:(CGFloat)borderWidth
                 borderColor:(UIColor *)borderColor
             backgroundImage:(UIImage *)backgroundImage {
    [self clipWithCornerRadius:cornerRadius borderWidth:borderWidth borderColor:borderColor backgroundImage:backgroundImage viewContentMode:UIViewContentModeScaleAspectFill];
}
- (void)clipWithCornerRadius:(LATRadius)cornerRadius
                 borderWidth:(CGFloat)borderWidth
                 borderColor:(UIColor *)borderColor
             backgroundColor:(UIColor *)backgroundColor {
    [self clipWithCornerRadius:cornerRadius borderWidth:borderWidth borderColor:borderColor backgroundColor:backgroundColor viewContentMode:UIViewContentModeScaleAspectFill];
}
- (void)clipWithCornerRadius:(LATRadius)cornerRadius
                 borderWidth:(CGFloat)borderWidth
                 borderColor:(UIColor *)borderColor
             backgroundImage:(UIImage *)backgroundImage
             viewContentMode:(UIViewContentMode)viewContentMode {
    [self clipWithCornerRadius:cornerRadius borderWidth:borderWidth borderColor:borderColor backgroundImage:backgroundImage backgroundColor:nil viewContentMode:viewContentMode];
}

- (void)clipWithCornerRadius:(LATRadius)cornerRadius
                 borderWidth:(CGFloat)borderWidth
                 borderColor:(UIColor *)borderColor
             backgroundColor:(UIColor *)backgroundColor
             viewContentMode:(UIViewContentMode)viewContentMode {
    [self clipWithCornerRadius:cornerRadius borderWidth:borderWidth borderColor:borderColor backgroundImage:nil backgroundColor:backgroundColor viewContentMode:viewContentMode];
}
- (void)clipWithCornerRadius:(LATRadius)cornerRadius
                 borderWidth:(CGFloat)borderWidth
                 borderColor:(UIColor *)borderColor
             backgroundImage:(UIImage *)backgroundImage
             backgroundColor:(UIColor *)backgroundColor
             viewContentMode:(UIViewContentMode)viewContentMode {
    CGRect rect = CGRectZero;
    __block typeof(rect)blockRect = rect;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        if (CGRectEqualToRect(rect, CGRectZero)) {
            dispatch_sync(dispatch_get_main_queue(), ^{
                blockRect = self.bounds;
            });
        }
        UIImage *image = [LATImageClipHandle clipedImageWithRect:blockRect radius:cornerRadius originalImage:backgroundImage borderWidth:borderWidth borderColor:borderColor fillColor:backgroundColor viewContentMode:viewContentMode];
        dispatch_async(dispatch_get_main_queue(), ^{
            if ([self isKindOfClass:[UIImageView class]]) {
                ((UIImageView *)self).image = image;
            } else if ([self isKindOfClass:[UIButton class]]) {
                [((UIButton *)self) setImage:image forState:UIControlStateNormal];
            } else {
                self.layer.backgroundColor = [UIColor colorWithPatternImage:image].CGColor;
            }
        });
    });
}
@end
