
//
//  UIImage+LATClipCategory.m
//  https://github.com/KKLater/LATClip.git
//
//  Created by Later on 16/6/1.
//  Copyright © 2016年 Later. All rights reserved.
//

#import "UIImage+LATClipCategory.h"

@implementation UIImage (LATClipCategory)
- (UIImage *)clipToRountImageWithRect:(CGRect)rect{
    return [self clipToRountImageWithRect:rect borderWidth:0 borderColor:nil fillColor:nil];
}
- (UIImage *)clipToRountImageWithRect:(CGRect)rect
                          borderWidth:(CGFloat)borderWidth
                          borderColor:(UIColor *)borderColor
                            fillColor:(UIColor *)fillColor{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:CGRectGetHeight(rect)/2.f];
    return  [self clipImageWithRect:rect borderWidth:borderWidth borderColor:borderColor fillColor:fillColor viewContentMode:UIViewContentModeScaleAspectFill path:path.CGPath];
}
- (UIImage *)clipImageWithRect:(CGRect)rect
                       corners:(UIRectCorner)corners
              cornerRadiusSize:(CGSize)cornerRadiusSize{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:cornerRadiusSize];
    return  [self clipImageWithRect:rect borderWidth:0 borderColor:nil fillColor:nil                          viewContentMode:UIViewContentModeScaleAspectFill path:path.CGPath];
    
}
- (UIImage *)clipImageWithRect:(CGRect)rect
                   borderWidth:(CGFloat)borderWidth
                   borderColor:(UIColor *)borderColor
                     fillColor:(UIColor *)fillColor
               viewContentMode:(UIViewContentMode)viewContentMode
                       corners:(UIRectCorner)corners
              cornerRadiusSize:(CGSize)cornerRadiusSize{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:cornerRadiusSize];
    return  [self clipImageWithRect:rect borderWidth:borderWidth borderColor:borderColor fillColor:fillColor viewContentMode:viewContentMode path:path.CGPath];
}
- (UIImage *)clipImageWithRect:(CGRect)rect
                   borderWidth:(CGFloat)borderWidth
                   borderColor:(UIColor *)borderColor
                     fillColor:(UIColor *)fillColor
               viewContentMode:(UIViewContentMode)viewContentMode
                          path:(CGPathRef)path{
    return [LATImageClipHandle clipedImageWithRect:rect originalImage:self borderWidth:borderWidth borderColor:borderColor fillColor:fillColor viewContentMode:viewContentMode path:path];
}
- (UIImage *)clipImageWithRect:(CGRect)rect
                  cornerRadius:(LATRadius)cornerRadius {
    return [self clipImageWithRect:rect cornerRadius:cornerRadius borderWidth:0 borderColor:nil viewContentMode:UIViewContentModeScaleAspectFill];
}
- (UIImage *)clipImageWithRect:(CGRect)rect
                  cornerRadius:(LATRadius)cornerRadius
                   borderWidth:(CGFloat)borderWidth
                   borderColor:(UIColor *)borderColor
               viewContentMode:(UIViewContentMode)viewContentMode {
    return [LATImageClipHandle clipedImageWithRect:rect radius:cornerRadius originalImage:self borderWidth:borderWidth borderColor:borderColor fillColor:nil viewContentMode:viewContentMode];
}
@end
