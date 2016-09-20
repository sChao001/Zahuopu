//
//  UIView+HUD.m
//  MAX+
//
//  Created by tarena on 16/8/9.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "UIView+HUD.h"

static NSArray *animateImages = nil;

@implementation UIView (HUD)

-(void)showHUD{
    [self hideHUD]; //先隐藏其他的提示
    //再添加新的. 这样可以保证只有一个提示
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    //自定义繁忙动画
    hud.mode = MBProgressHUDModeCustomView;
    //根据头文件的注释, 最佳大小37*37
    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 37, 37)];
    
    //图片数组只初始化一次. 因为图片从png格式解码为bmp位图非常消耗CPU. 最好不要反复进行!
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        animateImages = [self animateImages];
    });
    
    //设置动画
    iv.animationImages = animateImages;
    iv.animationDuration = 0.6;
    [iv startAnimating];
    hud.customView = iv;
    iv.frame = CGRectMake(0, 0, 37, 37);
    //最长转圈的时间30
    
    [hud hideAnimated:YES afterDelay:30];
    hud.backgroundView.backgroundColor = [UIColor clearColor];
}

- (NSArray *)animateImages{
    NSArray *imageNames = @[@"00", @"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11"];
    NSMutableArray *images = [NSMutableArray new];
    [imageNames enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [images addObject:[UIImage imageNamed:obj]];
    }];
    return images.copy;
}

- (void)hideHUD{
    [MBProgressHUD hideHUDForView:self animated:YES];
}
- (void)showWarning:(NSString *)msg{
    [self hideHUD];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = msg;
    [hud hideAnimated:YES afterDelay:1.5];
}

@end
