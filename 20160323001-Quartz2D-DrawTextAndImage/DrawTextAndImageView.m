//
//  DrawTextAndImageView.m
//  20160323001-Quartz2D-DrawTextAndImage
//
//  Created by Rainer on 16/3/23.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "DrawTextAndImageView.h"

@implementation DrawTextAndImageView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    // 超出指定区域就裁剪掉：（这个方法一定要放在绘制图片之前）
    UIRectClip(CGRectMake(0, 0, 100, 100));
    
    UIImage *image = [UIImage imageNamed:@"001"];
    
    // 使用这个方法绘制的图片默认跟图片本身大小一样
//    [image drawAtPoint:CGPointZero];
    
    // 在指定全区域中绘制一张按比例缩放好的图片
//    [image drawInRect:rect];
    
    // 绘制平铺图片
    [image drawAsPatternInRect:rect];
}

- (void)drawText {
    NSString *textString = @"测试画文本";
    
    // 字体设置
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    
    // 字体大小
    attributes[NSFontAttributeName] = [UIFont systemFontOfSize:30];
    // 字体颜色
    attributes[NSForegroundColorAttributeName] = [UIColor greenColor];
    // 描边宽度
    attributes[NSStrokeWidthAttributeName] = @2;
    // 描边颜色（这里相当于前景色即字体颜色，设置了此属性，字体颜色无效）
    attributes[NSStrokeColorAttributeName] = [UIColor redColor];
    
    // 创建阴影对象
    NSShadow *shadow = [[NSShadow alloc] init];
    // 阴影颜色
    shadow.shadowColor = [UIColor grayColor];
    // 阴影大小
    shadow.shadowOffset = CGSizeMake(3, 3);
    // 模糊度
    shadow.shadowBlurRadius = 2;
    
    // 字体阴影
    attributes[NSShadowAttributeName] = shadow;
    
    // 将文字画入视图中
    [textString drawInRect:self.bounds withAttributes:attributes];
}

@end
