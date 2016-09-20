//
//  VideoPlayController.m
//  MAX+
//
//  Created by tarena on 16/9/8.
//  Copyright © 2016年 tarena. All rights reserved.
//


#import "VideoPlayController.h"
#import <IJKMediaFramework/IJKMediaFramework.h>
#import "layerView.h"




@interface VideoPlayController ()<UIScrollViewDelegate>
@property (nonatomic) IJKFFMoviePlayerController *player;
@property (nonatomic) UIImageView *placeholderView;

@end

@implementation VideoPlayController

- (void)viewDidLoad {
    NSLog(@"did load");
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.hidden = YES;
    
    [self configPlayer];
    [self placeholderView];
    [self configlayer];
    [self configBackBtn];
    
    
    
}
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)configBackBtn{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(backbtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn setImage:[UIImage imageNamed:@"mg_room_btn_guan_h"] forState:UIControlStateNormal];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(-10);
        make.size.equalTo(CGSizeMake(40, 40));
    }];
    btn.layer.cornerRadius = 15;
    btn.layer.masksToBounds = YES;
    
}
- (void)backbtn:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)configlayer{
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scroll.delegate = self;
    scroll.pagingEnabled = YES;
    scroll.showsVerticalScrollIndicator = NO;
    scroll.showsHorizontalScrollIndicator = NO;
    scroll.contentSize = CGSizeMake(kMainWindowWidth *2, kMainWindowHeight);
    scroll.contentOffset = CGPointMake(kMainWindowWidth, 0);
    UIView *clearView = [[UIView alloc] initWithFrame:self.view.bounds];
    clearView.backgroundColor = [UIColor clearColor];
    
    /**
    UIView *layerView = [[UIView alloc] initWithFrame:CGRectMake(kMainWindowWidth, 0, kMainWindowWidth, kMainWindowHeight)];
    layerView.backgroundColor = [UIColor clearColor];
    // 渐变色
    CAGradientLayer *gradientlayer = [CAGradientLayer layer];
    UIColor *gray = [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:0.8];
    UIColor *white = [UIColor colorWithRed:1 green:1 blue:1 alpha:0];
    gradientlayer.colors = @[(id)gray.CGColor, (id)white.CGColor, (id)gray.CGColor];
    gradientlayer.locations = @[@(0.1f), @(0.4f)];
    gradientlayer.startPoint = CGPointMake(0, 0);
    gradientlayer.endPoint = CGPointMake(1, 1);
    [layerView.layer addSublayer:gradientlayer];
    [scroll addSubview:layerView];  */
    
    layerView *layV = [[NSBundle mainBundle] loadNibNamed:@"layerView" owner:nil options:nil].firstObject;
    layV.frame = CGRectMake(kMainWindowWidth, 0, kMainWindowWidth, kMainWindowHeight);
    layV.backgroundColor = [UIColor clearColor];
    [layV.headV setImageURL:self.model.smallpic.my_url];
    layV.headV.layer.cornerRadius = 21;
    layV.headV.layer.masksToBounds = YES;
    layV.allnumber.text = [NSString stringWithFormat:@"%ld", (long)self.model.allnum];
    NSDate *cur = [NSDate date];
    NSDateFormatter *datefor = [[NSDateFormatter alloc] init];
    datefor.dateFormat = @"yyyy.MM.dd";
    NSString *da = [datefor stringFromDate:cur];
    layV.timenow.text = da;
    
    [scroll addSubview:layV];
    [scroll addSubview:clearView];
    
    [self.view addSubview:scroll];
}





#pragma configPlayer
- (void)configPlayer{
    self.player = [[IJKFFMoviePlayerController alloc] initWithContentURLString:self.model.flv withOptions:[IJKFFOptions optionsByDefault]];
    [self.view addSubview:self.player.view];
    self.player.shouldAutoplay = YES;
    self.player.scalingMode = IJKMPMovieScalingModeAspectFit;
    [self.player prepareToPlay];
    
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.player shutdown];
    //NSLog(@"did disappear");
}


- (UIImageView *)placeholderView {
	if(_placeholderView == nil) {
		_placeholderView = [[UIImageView alloc] initWithFrame:self.view.bounds];
        [_placeholderView setImageURL:_model.bigpic.my_url];
        _placeholderView.contentMode = UIViewContentModeScaleAspectFill;
        _placeholderView.clipsToBounds = YES;
        //模糊效果
        UIVisualEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        UIVisualEffectView *view = [[UIVisualEffectView alloc] initWithEffect:blur];
        view.frame = _placeholderView.bounds;
        [_placeholderView addSubview:view];
        [self.view addSubview:_placeholderView];
        [self.view sendSubviewToBack:_placeholderView];
        
        
	}
	return _placeholderView;
}




- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"will appear");
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [self.player prepareToPlay];
    
}


- (void)viewWillDisappear:(BOOL)animated{
    NSLog(@"will disappear");
    [super viewWillDisappear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    //[self.player shutdown];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
