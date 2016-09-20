//
//  pageViewController.m
//  MAX+
//
//  Created by tarena on 16/8/30.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "pageViewController.h"
#import "ViewController.h"


#import "OtherViewController.h"


@interface pageViewController ()

@end

@implementation pageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   // self.showOnNavigationBar = YES;
    
}

-(NSArray<NSString *> *)titles{
    return @[@"日报",@"这世界",@"浮华日报"];
}

-(NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return self.titles.count;
}
-(UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    if (index == 0) {
        ViewController *vc = [[ViewController alloc] init];
        //[vc.navigationController.navigationBar setHidden:YES];
        return vc;
        
    }
    OtherViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"OtherViewController"];
    
    if (index == 1) {
        vc.num = 13;
    }else if (index == 2){
        vc.num = 8;
    }
    
    return vc;
}






- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
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
