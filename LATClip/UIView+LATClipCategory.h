//
//  UIView+LATClipCategory.h
//  https://github.com/KKLater/LATClip.git
//
//  Created by Later on 16/6/1.
//  Copyright © 2016年 Later. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LATImageClipHandle.h"

@interface UIView (LATClipCategory)
#pragma mark 圆形图
- (void)clipToRountWithBackgroundColor:(UIColor *)backgroundColor;

- (void)clipToRountWithBackgroundImage:(UIImage *)backgroundImage;

- (void)clipToRountWithBackgroundColor:(UIColor *)backgroundColor
                       viewContentMode:(UIViewContentMode)viewContentMode;

- (void)clipToRountWithBackgroundImage:(UIImage *)backgroundImage
                       viewContentMode:(UIViewContentMode)viewContentMode;

- (void)clipToRountWithBorderWidth:(CGFloat)borderWidth
                       borderColor:(UIColor *)borderColor
                   backgroundColor:(UIColor *)backgroundColor
                   viewContentMode:(UIViewContentMode)viewContentMode;

- (void)clipToRountWithBorderWidth:(CGFloat)borderWidth
                       borderColor:(UIColor *)borderColor
                   backgroundImage:(UIImage *)backgroundImage
                   viewContentMode:(UIViewContentMode)viewContentMode;

- (void)clipToRountWithBorderWidth:(CGFloat)borderWidth
                       borderColor:(UIColor *)borderColor
                   backgroundImage:(UIImage *)backgroundImage
                   backgroundColor:(UIColor *)backgroundColor
                   viewContentMode:(UIViewContentMode)viewContentMode;
#pragma mark 不规则四角切图
- (void)clipWithCorners:(UIRectCorner)corners
       cornerRadiusSize:(CGSize)cornerRadiusSize
        backgroundImage:(UIImage *)backgroundImage;

- (void)clipWithCorners:(UIRectCorner)corners
       cornerRadiusSize:(CGSize)cornerRadiusSize
        backgroundColor:(UIColor *)backgroundColor;

- (void)clipWithCorners:(UIRectCorner)corners
       cornerRadiusSize:(CGSize)cornerRadiusSize
        backgroundImage:(UIImage *)backgroundImage
        viewContentMode:(UIViewContentMode)viewContentMode;

- (void)clipWithCorners:(UIRectCorner)corners
       cornerRadiusSize:(CGSize)cornerRadiusSize
        backgroundColor:(UIColor *)backgroundColor
        viewContentMode:(UIViewContentMode)viewContentMode;

- (void)clipWithCorners:(UIRectCorner)corners
       cornerRadiusSize:(CGSize)cornerRadiusSize
            borderWidth:(CGFloat)borderWidth
            borderColor:(UIColor *)borderColor
        backgroundImage:(UIImage *)backgroundImage;

- (void)clipWithCorners:(UIRectCorner)corners
       cornerRadiusSize:(CGSize)cornerRadiusSize
            borderWidth:(CGFloat)borderWidth
            borderColor:(UIColor *)borderColor
        backgroundColor:(UIColor *)backgroundColor;

- (void)clipWithCorners:(UIRectCorner)corners
       cornerRadiusSize:(CGSize)cornerRadiusSize
            borderWidth:(CGFloat)borderWidth
            borderColor:(UIColor *)borderColor
        backgroundImage:(UIImage *)backgroundImage
        viewContentMode:(UIViewContentMode)viewContentMode;

- (void)clipWithCorners:(UIRectCorner)corners
       cornerRadiusSize:(CGSize)cornerRadiusSize
            borderWidth:(CGFloat)borderWidth
            borderColor:(UIColor *)borderColor
        backgroundColor:(UIColor *)backgroundColor
        viewContentMode:(UIViewContentMode)viewContentMode;

- (void)clipWithCorners:(UIRectCorner)corners
       cornerRadiusSize:(CGSize)cornerRadiusSize
            borderWidth:(CGFloat)borderWidth
            borderColor:(UIColor *)borderColor
        backgroundImage:(UIImage *)backgroundImage
        backgroundColor:(UIColor *)backgroundColor
        viewContentMode:(UIViewContentMode)viewContentMode;

- (void)clipedWithBorderWidth:(CGFloat)borderWidth
                  borderColor:(UIColor *)borderColor
              backgroundImage:(UIImage *)backgroundImage
              backgroundColor:(UIColor *)backgroundColor
              viewContentMode:(UIViewContentMode)viewContentMode
                         path:(CGPathRef)path;
#pragma mark 根据传入裁切半径裁切视图
- (void)clipWithCornerRadius:(LATRadius)cornerRadius
             backgroundColor:(UIColor *)backgroundColor;

- (void)clipWithCornerRadius:(LATRadius)cornerRadius
             backgroundImage:(UIImage *)backgroundImage;

- (void)clipWithCornerRadius:(LATRadius)cornerRadius
             backgroundImage:(UIImage *)backgroundImage
             viewContentMode:(UIViewContentMode)viewContentMode;

- (void)clipWithCornerRadius:(LATRadius)cornerRadius
             backgroundColor:(UIColor *)backgroundColor
             viewContentMode:(UIViewContentMode)viewContentMode;

- (void)clipWithCornerRadius:(LATRadius)cornerRadius
                 borderWidth:(CGFloat)borderWidth
                 borderColor:(UIColor *)borderColor
             backgroundImage:(UIImage *)backgroundImage;

- (void)clipWithCornerRadius:(LATRadius)cornerRadius
                 borderWidth:(CGFloat)borderWidth
                 borderColor:(UIColor *)borderColor
             backgroundColor:(UIColor *)backgroundColor;

- (void)clipWithCornerRadius:(LATRadius)cornerRadius
                 borderWidth:(CGFloat)borderWidth
                 borderColor:(UIColor *)borderColor
             backgroundImage:(UIImage *)backgroundImage
             viewContentMode:(UIViewContentMode)viewContentMode;

- (void)clipWithCornerRadius:(LATRadius)cornerRadius
                 borderWidth:(CGFloat)borderWidth
                 borderColor:(UIColor *)borderColor
             backgroundColor:(UIColor *)backgroundColor
             viewContentMode:(UIViewContentMode)viewContentMode;

- (void)clipWithCornerRadius:(LATRadius)cornerRadius
                 borderWidth:(CGFloat)borderWidth
                 borderColor:(UIColor *)borderColor
             backgroundImage:(UIImage *)backgroundImage
             backgroundColor:(UIColor *)backgroundColor
             viewContentMode:(UIViewContentMode)viewContentMode;
@end
