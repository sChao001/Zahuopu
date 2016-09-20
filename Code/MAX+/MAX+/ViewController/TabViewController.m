//
//  TabViewController.m
//  MAX+
//
//  Created by tarena on 16/8/31.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TabViewController.h"
#import "pageViewController.h"
#import "imageViewController.h"
#import "VideoViewController.h"
#import "MyNaviViewController.h"


@interface TabViewController ()
@property (nonatomic) pageViewController *pageC;
@property (nonatomic) imageViewController *imgC;
@property (nonatomic) VideoViewController *videoC;
@end

@implementation TabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.tintColor = [UIColor blackColor];
    MyNaviViewController *navi = [[MyNaviViewController alloc]initWithRootViewController:self.pageC];
    navi.title = @"好奇心日报";
    MyNaviViewController *navi1 = [[MyNaviViewController alloc]initWithRootViewController:self.imgC];
    MyNaviViewController *navi2 = [[MyNaviViewController alloc]initWithRootViewController:self.videoC];
    
    self.viewControllers = @[navi, navi1, navi2];
    
}

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

- (VideoViewController *)videoC {
	if(_videoC == nil) {
		_videoC = [[VideoViewController alloc] init];
        _videoC.title = @"直播";
        _videoC.tabBarItem.image = [UIImage imageNamed:@"tab_me"];
        _videoC.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_me_p"];
	}
	return _videoC;
}

- (imageViewController *)imgC {
	if(_imgC == nil) {
		_imgC = [[imageViewController alloc] init];
        _imgC.title = @"COS";
        
        _imgC.tabBarItem.image = [UIImage imageNamed:@"hall_icn_whole_def"];
        _imgC.tabBarItem.selectedImage = [UIImage imageNamed:@"hall_icn_whole_prd"];
        
	}
	return _imgC;
}

- (pageViewController *)pageC {
	if(_pageC == nil) {
		_pageC = [[pageViewController alloc] init];
        _pageC.title = @"资讯";
        _pageC.titleColorSelected = [UIColor blackColor];
        _pageC.tabBarItem.image = [UIImage imageNamed:@"menu_home"];
        
        _pageC.tabBarItem.selectedImage = [UIImage imageNamed:@"menu_home"];
        
        
        
        
        
        
        _pageC.titleColorSelected = [UIColor brownColor];
        _pageC.menuHeight = 60;
        _pageC.menuBGColor = [UIColor clearColor];
        _pageC.menuViewStyle = WMMenuViewStyleLine;
        
        
        
        
        
	}
	return _pageC;
}

//- (BOOL)shouldAutorotate{
//    
//        return self.selectedViewController.shouldAutorotate;
//    
//    
//}
//- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
//    return [self.selectedViewController supportedInterfaceOrientations];
//}
//- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
//    return [self.selectedViewController preferredInterfaceOrientationForPresentation];
//}







@end
