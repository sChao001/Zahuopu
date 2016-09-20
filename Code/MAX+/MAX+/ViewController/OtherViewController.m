//
//  OtherViewController.m
//  MAX+
//
//  Created by tarena on 16/8/31.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "OtherViewController.h"
#import "HomeViewModel.h"
#import "Cell_img.h"
#import "Cell_normal.h"
#import "head_view.h"
#import "WebViewController.h"


@interface OtherViewController ()
@property (nonatomic) HomeViewModel* homeVM;
@property (nonatomic) UIImageView *img;
@end

@implementation OtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof(self) weakself = self;
    
        [weakself.homeVM getRequestMode:RequestModeRefresh withNumber:self.num completionHandler:^(NSError *error) {
            [weakself.tableView reloadData];
            self.img = [self.view viewWithTag:100];
            [self.img setImageURL:[self.homeVM imgTypeOfVC]];
        }];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakself.homeVM getRequestMode:RequestModeMore withNumber:self.num completionHandler:^(NSError *error) {
            [weakself.tableView reloadData];
            [weakself.tableView endFooder];
        }];
    }];
    
    
    
    
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == self.tableView) {
        CGFloat y = scrollView.contentOffset.y;
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat height = width *3.4/5;
    //NSLog(@"%f", y);
    
    if (y <= 0){
        
        self.img.frame = CGRectMake(0, y, [UIScreen mainScreen].bounds.size.width, height - y);
    }
    }
    
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%ld",self.homeVM.cellNumber);
    return self.homeVM.cellNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.homeVM cellTypeForIndex:indexPath.row] == 0) {
        Cell_img *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_img" forIndexPath:indexPath];
        [cell.imgView setImageURL:[self.homeVM imgURLForIndex:indexPath.row]];
        cell.title.text = [self.homeVM titleForIndex:indexPath.row];
        cell.count.attributedText = [self.homeVM attributedStringAtIndex:indexPath.row];
        cell.detail.text = [self.homeVM detailTextAtIndex:indexPath.row];
        return cell;
    }
    else{
        Cell_normal *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_normal" forIndexPath:indexPath];
        [cell.imgView setImageURL:[self.homeVM imgURLForIndex:indexPath.row]];
        cell.title.text = [self.homeVM titleForIndex:indexPath.row];
        cell.count.attributedText = [self.homeVM attributedStringAtIndex:indexPath.row];

        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    WebViewController *vc = [[WebViewController alloc] initWithURL:[self.homeVM URLForIndex:indexPath.row]];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}



- (HomeViewModel *)homeVM {
	if(_homeVM == nil) {
		_homeVM = [[HomeViewModel alloc] init];
	}
	return _homeVM;
}



@end
