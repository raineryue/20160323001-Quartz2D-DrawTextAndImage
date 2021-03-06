//
//  ViewController.m
//  20160323001-Quartz2D-DrawTextAndImage
//
//  Created by Rainer on 16/3/23.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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

    
    self.textLabel.attributedText = [[NSAttributedString alloc] initWithString:@"用来测试的文本" attributes:attributes];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
