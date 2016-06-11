//
//  UIImage+latBClipCategory.h
//  https://github.com/KKLater/LATClip.git
//
//  Created by Later on 16/6/1.
//  Copyright © 2016年 Later. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LATImageClipHandle.h"

@interface UIImage (LATClipCategory)
/**
 *  @author Later, 16-06-01 15:06
 *
 *  获取圆形图片
 *
 *  @param rect 图片的rect
 *
 *  @return 圆形图片
 */
- (UIImage *)clipToRountImageWithRect:(CGRect)rect;
/**
 *  @author Later, 16-06-01 15:06
 *
 *  获取带有边框的圆形图片
 *
 *  @param rect        图片rect
 *  @param borderWidth 边框大小
 *  @param borderColor 边框颜色
 *  @param fillColor   填充色
 *
 *  @return
 */
- (UIImage *)clipToRountImageWithRect:(CGRect)rect
                          borderWidth:(CGFloat)borderWidth
                          borderColor:(UIColor *)borderColor
                            fillColor:(UIColor *)fillColor;
/**
 *  @author Later, 16-06-01 15:06
 *
 *  获取一个切角的图片
 *
 *  @param rect             图片rect
 *  @param corner           切脚类型
 *  @param cornerRadiusSize 圆角尺度
 *
 *  @return
 */
- (UIImage *)clipImageWithRect:(CGRect)rect
                       corners:(UIRectCorner)corner
              cornerRadiusSize:(CGSize)cornerRadiusSize;
/**
 *  @author Later, 16-06-01 15:06
 *
 *  获取一个带有边框和填充色的切角图片
 *
 *  @param rect              图片rect
 *  @param borderWidth       边框大小
 *  @param borderColor       边框颜色
 *  @param fillColor         填充颜色
 *  @param viewContentMode   填充样式
 *  @param corner            切角类型
 *  @param cornerRadiusSize  切角尺寸
 *
 *  @return
 */
- (UIImage *)clipImageWithRect:(CGRect)rect
                   borderWidth:(CGFloat)borderWidth
                   borderColor:(UIColor *)borderColor
                     fillColor:(UIColor *)fillColor
               viewContentMode:(UIViewContentMode)viewContentMode
                       corners:(UIRectCorner)corners
              cornerRadiusSize:(CGSize)cornerRadiusSize;
/**
 *  @author Later, 16-06-01 15:06
 *
 *  获取一个路径下的切角图片
 *
 *  @param rect              图片rect
 *  @param borderWidth       边框尺寸
 *  @param borderColor       边框颜色
 *  @param fillColor         填充色
 *  @param viewContentMode   填充样式
 *  @param path              路径
 *
 *  @return 
 */
- (UIImage *)clipImageWithRect:(CGRect)rect
                   borderWidth:(CGFloat)borderWidth
                   borderColor:(UIColor *)borderColor
                     fillColor:(UIColor *)fillColor
               viewContentMode:(UIViewContentMode)viewContentMode
                          path:(CGPathRef)path;
/**
 *  @author Later, 16-06-02 10:06
 *
 *  按不同的角来切图
 *
 *  @param rect         rect
 *  @param cornerRadius cornerRadius
 *
 *  @return
 */
- (UIImage *)clipImageWithRect:(CGRect)rect
                  cornerRadius:(LATRadius)cornerRadius;
/**
 *  @author Later, 16-06-02 10:06
 *
 *  按不同的角度来切图
 *
 *  @param rect            rect
 *  @param cornerRadius    角度
 *  @param borderWidth     边框宽
 *  @param borderColor     边框颜色
 *  @param viewContentMode 视图填充演示
 *
 *  @return 
 */
- (UIImage *)clipImageWithRect:(CGRect)rect
                  cornerRadius:(LATRadius)cornerRadius
                   borderWidth:(CGFloat)borderWidth
                   borderColor:(UIColor *)borderColor
               viewContentMode:(UIViewContentMode)viewContentMode;
@end
