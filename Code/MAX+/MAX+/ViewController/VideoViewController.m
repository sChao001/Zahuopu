//
//  VideoViewController.m
//  MAX+
//
//  Created by tarena on 16/8/30.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "VideoViewController.h"
#import "VideoVideoModel.h"
#import "VideoCell.h"
#import "VideoPlayController.h"


@interface VideoViewController ()
@property (nonatomic) VideoVideoModel *videoVM;
@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    
    // 创建缓存文件夹
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    NSString *videoCachePath = [cachePath stringByAppendingPathComponent:@"videoCacheDocument"];
    NSString *videoCache = [videoCachePath stringByAppendingPathComponent:@"videoCache"];
    if (![fileManager fileExistsAtPath:videoCachePath]) {
        NSError *err = nil;
        [[NSFileManager defaultManager] createDirectoryAtPath:videoCachePath withIntermediateDirectories:YES attributes:nil error:&err];
    }
    self.videoVM.datalist = [NSKeyedUnarchiver unarchiveObjectWithFile:videoCache];
    if (self.videoVM.datalist) {
        [self.tableView reloadData];
    }
    
    
    __weak typeof(self) weakSelf = self;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.videoVM getRequestMode:RequestModeRefresh completionHandler:^(NSError *error) {
            if (!error) {
                [weakSelf.tableView.mj_header endRefreshing];
                [weakSelf.tableView reloadData];
                
                [NSKeyedArchiver archiveRootObject:weakSelf.videoVM.datalist toFile:videoCache];
                
            }
            
        }];
    }];
    self.tableView.mj_footer = [MJRefreshBackFooter footerWithRefreshingBlock:^{
        [self.videoVM getRequestMode:RequestModeMore completionHandler:^(NSError *error) {
            if (!error) {
                [weakSelf.tableView.mj_footer endRefreshing];
                [weakSelf.tableView reloadData];
                
                [NSKeyedArchiver archiveRootObject:weakSelf.videoVM.datalist toFile:videoCache];
                
            }
            
        }];
    }];
    [self.tableView.mj_header beginRefreshing];
    
    
    
    
    [self.tableView registerClass:[VideoCell class] forCellReuseIdentifier:@"videocell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.videoVM.cellNum;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VideoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"videocell" forIndexPath:indexPath];
    cell.allnum.text = [self.videoVM allnumOfItemAtIndex:indexPath.row];
    [cell.smallpic setImageURL:[self.videoVM smallpicOfItemAtIndex:indexPath.row]];
    
    cell.myname.text = [self.videoVM mynameOfItemAtIndex:indexPath.row];
    cell.gps.text = [self.videoVM gpsOfItemAtIndex:indexPath.row];
    [cell.bigpic setImageURL:[self.videoVM bigpicOfItemAtIndex:indexPath.row]];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    VideoPlayController *vc = [[VideoPlayController alloc]init];
    vc.model = self.videoVM.datalist[indexPath.row];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}










- (VideoVideoModel *)videoVM {
	if(_videoVM == nil) {
		_videoVM = [[VideoVideoModel alloc] init];
	}
	return _videoVM;
}

@end
