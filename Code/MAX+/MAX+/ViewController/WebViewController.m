//
//  WebViewController.m
//  MAX+
//
//  Created by tarena on 16/8/11.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()<UIWebViewDelegate>
@property (nonatomic) UIWebView *webV;
@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self webV];
    [self backButton];
    [self.navigationController setNavigationBarHidden:YES];
    self.hidesBottomBarWhenPushed = YES;
    //self.tabBarController.tabBar.hidden = YES;
    
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)backButton{
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:back];
    [back setImage:[UIImage imageNamed:@"homeBackButton"] forState:UIControlStateNormal];
    back.alpha = 0.7;
    [back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(60, 60));
        make.bottom.equalTo(-10);
        make.left.equalTo(20);
    }];
    back.layer.cornerRadius = 30;
    back.layer.masksToBounds = YES;
    [back bk_addEventHandler:^(id sender) {
        [self.navigationController popViewControllerAnimated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
}

- (void)toolbarbutton{
    UIImageView *imgV = [UIImageView new];
    [self.view addSubview:imgV];
    imgV.image = [UIImage imageNamed:@"toolbarBg"];
    [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.equalTo(-10);
        make.size.equalTo(CGSizeMake(240, 60));
    }];
    imgV.layer.cornerRadius = 30;
    imgV.layer.masksToBounds = YES;
    
    
}












-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSLog(@"%@",request);
    return YES;
}






//- (UIButton *)button{
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    
//}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(UIViewController *)initWithURL:(NSURL *)url{
    if (self = [super init]) {
        self.url = url;
    }
    return self;
}

- (UIWebView *)webV {
	if(_webV == nil) {
		_webV = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [self.view addSubview:_webV];
        [_webV loadRequest:[NSURLRequest requestWithURL:_url]];
        
	}
	return _webV;
}

@end
