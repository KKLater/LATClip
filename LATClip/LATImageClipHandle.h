//
//  latImageClipHandle.h
//  https://github.com/KKLater/LATClip.git
//
//  Created by Later on 16/6/2.
//  Copyright © 2016年 Later. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
struct LATRadius{
    CGFloat topLeftRadius;
    CGFloat topRightRadius;
    CGFloat bottomLeftRadius;
    CGFloat bottomRightRadius;
};
typedef struct LATRadius LATRadius;
static inline LATRadius LATRadiusMake(CGFloat topLeftRadius, CGFloat topRightRadius, CGFloat bottomLeftRadius, CGFloat bottomRightRadius);
@interface LATImageClipHandle : NSObject
/**
 *  @author Later, 16-06-03 12:06
 *
 *  根据路径裁切图片
 *
 *  @param rect            rect
 *  @param originalImage   原图
 *  @param borderWidth     边框宽
 *  @param borderColor     边框颜色
 *  @param fillColor       填充色
 *  @param viewContentMode 视图填充样式
 *  @param path            路径
 *
 *  @return
 */
+ (UIImage *)clipedImageWithRect:(CGRect)rect
                   originalImage:(UIImage *)originalImage
                     borderWidth:(CGFloat)borderWidth
                     borderColor:(UIColor *)borderColor
                       fillColor:(UIColor *)fillColor
                 viewContentMode:(UIViewContentMode)viewContentMode
                            path:(CGPathRef)path;
/**
 *  @author Later, 16-06-03 12:06
 *
 *  根据radius裁切图片
 *
 *  @param rect            rect
 *  @param radius          裁切半径
 *  @param originalImage   原图
 *  @param borderWidth     边框宽度
 *  @param borderColor     边框颜色
 *  @param fillColor       填充色
 *  @param viewContentMode 视图填充样式
 *
 *  @return 
 */
+ (UIImage *)clipedImageWithRect:(CGRect)rect
                          radius:(LATRadius)radius
                   originalImage:(UIImage *)originalImage
                     borderWidth:(CGFloat)borderWidth
                     borderColor:(UIColor *)borderColor
                       fillColor:(UIColor *)fillColor
                 viewContentMode:(UIViewContentMode)viewContentMode;
@end
static inline LATRadius LATRadiusMake(CGFloat topLeftRadius, CGFloat topRightRadius, CGFloat bottomLeftRadius, CGFloat bottomRightRadius) {
    LATRadius radius;
    radius.topLeftRadius = topLeftRadius;
    radius.topRightRadius  = topRightRadius;
    radius.bottomLeftRadius = bottomLeftRadius;
    radius.bottomRightRadius = bottomRightRadius;
    return radius;
}