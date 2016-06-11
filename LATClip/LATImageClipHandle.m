//
//  LATImageClipHandle.m
//  https://github.com/KKLater/LATClip.git
//
//  Created by Later on 16/6/2.
//  Copyright © 2016年 Later. All rights reserved.
//

#import "LATImageClipHandle.h"

@interface UIImage (_LAT_ScalImage)
- (UIImage *)scaleToSize:(CGSize)size withContentMode:(UIViewContentMode)contentMode backgroundColor:(UIColor *)backgroundColor;
@end
@implementation LATImageClipHandle
+ (UIImage *)clipedImageWithRect:(CGRect)rect originalImage:(UIImage *)originalImage borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor fillColor:(UIColor *)fillColor viewContentMode:(UIViewContentMode)viewContentMode path:(CGPathRef)path {
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, CGRectGetHeight(rect));
    CGContextScaleCTM(context, 1, -1);
    if (borderWidth != 0) {
        CGContextSetLineWidth(context, borderWidth);
    }
    if (borderColor) {
        CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
    } else {
        CGContextSetStrokeColorWithColor(context, [UIColor clearColor].CGColor);
    }
    if (originalImage) {
        UIImage *image = [originalImage scaleToSize:rect.size withContentMode:viewContentMode backgroundColor:[UIColor colorWithCGColor:fillColor.CGColor]];
        CGContextSetFillColorWithColor(context, [UIColor colorWithPatternImage:image].CGColor);
    } else {
        if (fillColor) {
            CGContextSetFillColorWithColor(context, fillColor.CGColor);
        } else {
            CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
        }
    }
    CGContextAddPath(context, path);
    CGContextDrawPath(context, kCGPathEOFillStroke); //根据坐标绘制路径
    UIImage *cutImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return  cutImage;
}
+ (UIImage *)clipedImageWithRect:(CGRect)rect radius:(LATRadius)radius originalImage:(UIImage *)originalImage borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor fillColor:(UIColor *)fillColor viewContentMode:(UIViewContentMode)viewContentMode {
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, CGRectGetHeight(rect));
    CGContextScaleCTM(context, 1, -1);
    
    if (borderWidth != 0) {
        CGContextSetLineWidth(context, borderWidth);
    }
    if (borderColor) {
        CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
    } else {
        CGContextSetStrokeColorWithColor(context, [UIColor clearColor].CGColor);
    }
    if (originalImage) {
        UIImage *image = [originalImage scaleToSize:rect.size withContentMode:viewContentMode backgroundColor:[UIColor colorWithCGColor:fillColor.CGColor]];
        fillColor = [UIColor colorWithPatternImage:image];
    } else {
        if (!fillColor) {
            fillColor = [UIColor clearColor];
        }
    }
    CGContextSetFillColorWithColor(context, fillColor.CGColor);
    LATRadius newRadius = [self transformationJMRadius:radius size:rect.size borderWidth:borderWidth];
    CGFloat halfBorderWidth = borderWidth / 2.f;
    
    CGFloat minx = CGRectGetMinX(rect);
    CGFloat maxx = CGRectGetMaxX(rect);
    
    CGFloat miny = CGRectGetMinY(rect);
    CGFloat maxy = CGRectGetMaxY(rect);
    
    CGContextMoveToPoint(context, minx+halfBorderWidth, miny + newRadius.topLeftRadius);
    
    CGContextAddArcToPoint(context, minx+halfBorderWidth, miny+halfBorderWidth, minx + newRadius.topLeftRadius, miny+halfBorderWidth, newRadius.topLeftRadius);
    CGContextAddLineToPoint(context, maxx - newRadius.topRightRadius, miny+halfBorderWidth);
    
    CGContextAddArcToPoint(context, maxx-halfBorderWidth, miny + halfBorderWidth, maxx-halfBorderWidth, miny+newRadius.topRightRadius, newRadius.topRightRadius);
    CGContextAddLineToPoint(context, maxx-halfBorderWidth, maxy - newRadius.bottomRightRadius);
    
    CGContextAddArcToPoint(context, maxx-halfBorderWidth, maxy-halfBorderWidth, maxx - newRadius.bottomRightRadius, maxy-halfBorderWidth, newRadius.bottomRightRadius);
    CGContextAddLineToPoint(context, minx+newRadius.bottomLeftRadius, maxy-halfBorderWidth );
    CGContextAddArcToPoint(context, minx+halfBorderWidth, maxy-halfBorderWidth, minx+halfBorderWidth, maxy - newRadius.bottomLeftRadius, newRadius.bottomLeftRadius);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
    UIImage *cutImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return cutImage;
}

+ (LATRadius)transformationJMRadius:(LATRadius)radius size:(CGSize)size borderWidth:(CGFloat)borderWidth {
    radius.topLeftRadius = minimum(size.width - borderWidth, size.height - borderWidth, radius.topLeftRadius - borderWidth / 2);
    radius.topRightRadius = minimum(size.width - borderWidth - radius.topLeftRadius, size.height - borderWidth, radius.topRightRadius - borderWidth /2);
    radius.bottomLeftRadius = minimum(size.width - borderWidth, size.height - borderWidth - radius.topLeftRadius, radius.bottomLeftRadius - borderWidth / 2);
    radius.bottomRightRadius = minimum(size.width - borderWidth - radius.bottomLeftRadius, size.height - borderWidth - radius.topRightRadius, radius.bottomRightRadius - borderWidth / 2);
    return radius;
}

static inline CGFloat minimum(CGFloat a, CGFloat b, CGFloat c) {
    return MAX(MIN(MIN(a, b), c), 0);
}

@end

@implementation UIImage (_LAT_ScalImage)

- (UIImage *)scaleToSize:(CGSize)size withContentMode:(UIViewContentMode)contentMode backgroundColor:(UIColor *)backgroundColor {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(size, NO, UIScreen.mainScreen.scale);
    
    if (backgroundColor) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, backgroundColor.CGColor);
        CGContextAddRect(context, rect);
        CGContextDrawPath(context, kCGPathFillStroke); //根据坐标绘制路径
    }
    [self drawInRect:CGRectMake(0.0f, 0.0f, size.width, size.height) withContentMode:contentMode];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

- (void)drawInRect:(CGRect)rect withContentMode:(UIViewContentMode)contentMode {
    [self drawInRect:[self convertRect:rect withContentMode:contentMode]];
}

- (CGRect)convertRect:(CGRect)rect withContentMode:(UIViewContentMode)contentMode {
    CGSize size = self.size;
    rect = CGRectStandardize(rect);
    size.width = size.width < 0 ? -size.width : size.width;
    size.height = size.height < 0 ? -size.height : size.height;
    CGPoint center = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
    switch (contentMode) {
        case UIViewContentModeRedraw:
        case UIViewContentModeScaleAspectFit:
        case UIViewContentModeScaleAspectFill: {
            if (rect.size.width < 0.01 || rect.size.height < 0.01 ||
                size.width < 0.01 || size.height < 0.01) {
                rect.origin = center;
                rect.size = CGSizeZero;
            } else {
                CGFloat scale;
                if (contentMode == UIViewContentModeScaleAspectFill) {
                    if (size.width / size.height < rect.size.width / rect.size.height) {
                        scale = rect.size.width / size.width;
                    } else {
                        scale = rect.size.height / size.height;
                    }
                } else {
                    if (size.width / size.height < rect.size.width / rect.size.height) {
                        scale = rect.size.height / size.height;
                    } else {
                        scale = rect.size.width / size.width;
                    }
                }
                size.width *= scale;
                size.height *= scale;
                rect.size = size;
                rect.origin = CGPointMake(center.x - size.width * 0.5, center.y - size.height * 0.5);
            }
        } break;
        case UIViewContentModeCenter: {
            rect.size = size;
            rect.origin = CGPointMake(center.x - size.width * 0.5, center.y - size.height * 0.5);
        } break;
        case UIViewContentModeTop: {
            rect.origin.x = center.x - size.width * 0.5;
            rect.size = size;
        } break;
        case UIViewContentModeBottom: {
            rect.origin.x = center.x - size.width * 0.5;
            rect.origin.y += rect.size.height - size.height;
            rect.size = size;
        } break;
        case UIViewContentModeLeft: {
            rect.origin.y = center.y - size.height * 0.5;
            rect.size = size;
        } break;
        case UIViewContentModeRight: {
            rect.origin.y = center.y - size.height * 0.5;
            rect.origin.x += rect.size.width - size.width;
            rect.size = size;
        } break;
        case UIViewContentModeTopLeft: {
            rect.size = size;
        } break;
        case UIViewContentModeTopRight: {
            rect.origin.x += rect.size.width - size.width;
            rect.size = size;
        } break;
        case UIViewContentModeBottomLeft: {
            rect.origin.y += rect.size.height - size.height;
            rect.size = size;
        } break;
        case UIViewContentModeBottomRight: {
            rect.origin.x += rect.size.width - size.width;
            rect.origin.y += rect.size.height - size.height;
            rect.size = size;
        } break;
        case UIViewContentModeScaleToFill:
        default: {
            rect = rect;
        }
    }
    return rect;
}

@end