//
//  MyNaviViewController.m
//  MAX+
//
//  Created by tarena on 16/9/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "MyNaviViewController.h"

@interface MyNaviViewController ()

@end

@implementation MyNaviViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(UIViewController *)childViewControllerForStatusBarStyle{
    return self.topViewController;
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

@end
