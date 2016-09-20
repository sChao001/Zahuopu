//
//  imageViewController.m
//  MAX+
//
//  Created by tarena on 16/8/30.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "imageViewController.h"
#import "CosplayCell.h"
#import "imageViewModel.h"
#import "CosImageController.h"


@interface imageViewController ()
@property (nonatomic) imageViewModel *imgVM;
@end

@implementation imageViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    NSString *imageCachePath = [cachePath stringByAppendingPathComponent:@"imageCache"];
    NSString *imgCache = [imageCachePath stringByAppendingPathComponent:@"imgCache"];
    if (![fileManager fileExistsAtPath:imageCachePath]) {
        NSError *err = nil;
        [fileManager createDirectoryAtPath:imageCachePath withIntermediateDirectories:YES attributes:nil error:&err];
    }
    self.imgVM.datalist = [NSKeyedUnarchiver unarchiveObjectWithFile:imgCache];
    if (!self.imgVM.datalist) {
        [self.tableView reloadData];
    }
    
    
    
    __weak typeof(self) weakSelf = self;
    
    [self.imgVM getRequestMode:RequestModeRefresh completionHandler:^(NSError *error) {
        [weakSelf.tableView reloadData];
        [NSKeyedArchiver archiveRootObject:self.imgVM.datalist toFile:imgCache];
    }];
    
    self.tableView.mj_footer = [MJRefreshBackFooter footerWithRefreshingBlock:^{
        [self.imgVM getRequestMode:RequestModeMore completionHandler:^(NSError *error) {
            [weakSelf.tableView reloadData];
            [weakSelf.tableView.mj_footer endRefreshing];
            [NSKeyedArchiver archiveRootObject:self.imgVM.datalist toFile:imgCache];
        }];
    }];
    
    // 设置statusbar
    //[UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.modalPresentationCapturesStatusBarAppearance = NO;
#endif
    
    
    [self.navigationController.navigationBar setHidden:YES];
    
    
    
    UINib *nib = [UINib nibWithNibName:@"CosplayCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"cosplayCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.imgVM.cellNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CosplayCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cosplayCell" forIndexPath:indexPath];
    [cell.image1 setImageURL:[self.imgVM img1URLAtIndex:indexPath.row]];
    [cell.image2 setImageURL:[self.imgVM img2URLAtIndex:indexPath.row]];
    [cell.image3 setImageURL:[self.imgVM img3URLAtIndex:indexPath.row]];
    
    cell.titleLb.text = [self.imgVM titleAtIndex:indexPath.row];
    
    return  cell;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CosImageController *vc = [[CosImageController alloc] initWithNibName:@"CosImageController" bundle:nil];
    vc.aid = [self.imgVM aidAtIndex:indexPath.row];
    vc.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:vc animated:YES];
    
    
}

- (BOOL)shouldAutorotate{
    return NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (imageViewModel *)imgVM {
	if(_imgVM == nil) {
		_imgVM = [[imageViewModel alloc] init];
	}
	return _imgVM;
}

@end
