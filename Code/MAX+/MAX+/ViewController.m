//
//  ViewController.m
//  MAX+
//
//  Created by tarena on 16/8/9.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "NormalCell.h"
#import "HomeViewModel.h"
#import "WebViewController.h"
#import "ImageCell.h"
#import "headerView.h"


@interface ViewController ()<headerVdelegate,headerDataSourse>
@property (nonatomic) HomeViewModel *homeVM;
@property (nonatomic) UITableView *tableView;
@property (nonatomic) NSInteger time;
@property (nonatomic) NSTimer *timer;
@property (nonatomic) headerView *headV;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    [self.navigationController setNavigationBarHidden:YES];
    
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    NSString *ribaoCachePath = [cachePath stringByAppendingPathComponent:@"ribaoCache"];
    NSString *ribao = [ribaoCachePath stringByAppendingPathComponent:@"ribaoCache"];
    NSString *adimg = [ribaoCachePath stringByAppendingPathComponent:@"adimgCache"];
    
    if (![fileManager fileExistsAtPath:ribaoCachePath]) {
        NSError *err = nil;
        [[NSFileManager defaultManager] createDirectoryAtPath:ribaoCachePath withIntermediateDirectories:YES attributes:nil error:&err];
    }
    self.homeVM.dataList = [NSKeyedUnarchiver unarchiveObjectWithFile:ribao];
    self.homeVM.banners = [NSKeyedUnarchiver unarchiveObjectWithFile:adimg];
    if (!self.homeVM.dataList) {
        [self.tableView reloadData];
    }
    
    __weak typeof(self) weakSelf = self;
    [self.tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    //************//图片****************
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf.homeVM getRequestMode:RequestModeRefresh withNumber:0  completionHandler:^(NSError *error) {
            [weakSelf.tableView.mj_header endRefreshing];
            [weakSelf.tableView reloadData];
            [weakSelf.headV reloadData];
            [NSKeyedArchiver archiveRootObject:self.homeVM.dataList toFile:ribao];
            [NSKeyedArchiver archiveRootObject:self.homeVM.banners toFile:adimg];
        }];
    }];
    
    
    MJRefreshGifHeader *gifHeader = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        [weakSelf.homeVM getRequestMode:RequestModeRefresh withNumber:0  completionHandler:^(NSError *error) {
            [weakSelf.tableView.mj_header endRefreshing];
            [weakSelf.tableView reloadData];
            [weakSelf.headV reloadData];
            [NSKeyedArchiver archiveRootObject:self.homeVM.dataList toFile:ribao];
            [NSKeyedArchiver archiveRootObject:self.homeVM.banners toFile:adimg];
    }];
    }];
    
    NSMutableArray<UIImage *> *imgArr = [NSMutableArray new];
    for (int i = 0; i < 9; i++) {
        NSString *imgName = [NSString stringWithFormat:@"Loading_0005%d", i+1];
        //NSLog(@"%@",imgName);
        UIImage *img = [UIImage imageNamed:imgName];
        [imgArr addObject:img];
    }
    UIImage *imgbg = [UIImage imageNamed:@"reveal_refresh_foreground"];
    NSArray<UIImage *> *imgbgArr = @[imgbg];
    gifHeader.gifView.image = imgbg;
    gifHeader.lastUpdatedTimeLabel.hidden = YES;
    gifHeader.stateLabel.hidden = YES;
    //self.tableView.mj_header = gifHeader;
    [self.tableView.mj_header beginRefreshing];
    
    [gifHeader setImages:imgbgArr forState:MJRefreshStateIdle];
    [gifHeader setImages:imgArr forState:MJRefreshStateRefreshing];
    [gifHeader setImages:imgArr forState:MJRefreshStateNoMoreData];
    
    //***************滚动 图片*****
    self.headV = [[headerView alloc] initWithFrame:CGRectMake(0, 0, kMainWindowWidth, kMainWindowWidth*0.6)];
    
    self.tableView.tableHeaderView = self.headV;
    
    self.headV.delegate = self;
    self.headV.dataSourse = self;

    
    //*******注册*******
    [self.tableView registerClass:[NormalCell class] forCellReuseIdentifier:@"normal"];
    [self.tableView registerClass:[ImageCell class] forCellReuseIdentifier:@"image"];
    self.time = 0;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"contentOffset"]) {
        //NSLog(@"%@",change);
        if (_time == 0) {
            if (((self.tableView.contentOffset.y +self.tableView.frame.size.height + 300) >self.tableView.contentSize.height)) {
                [self.homeVM getRequestMode:RequestModeMore withNumber:0 completionHandler:^(NSError *error) {
                    
                    [self.tableView reloadData];
                }];
                _time = 1;
                [NSTimer bk_scheduledTimerWithTimeInterval:2 block:^(NSTimer *timer) {
                    _time = 0;
                } repeats:NO];
                
            }
        }
        
    }
}




-(void)dealloc{
    
    [self.tableView removeObserver:self forKeyPath:@"contentOffset"];
}

#pragma headerView delegata, dataSourse

-(NSInteger)numberOfItems:(headerView *)view{
    //NSLog(@"%ld",(long)self.homeVM.headVnum);
    //NSLog(@"");
    return self.homeVM.headVnum;
}
-(NSURL *)headerView:(headerView *)view URLForImgAtIndex:(NSInteger)index{
    return [self.homeVM headImgURLAtIndex:index];
}
-(void)headerView:(headerView *)view didSelectedAtIndex:(NSInteger)index{
    WebViewController *vc = [[WebViewController alloc] initWithURL:[self.homeVM headImgWebURLAtIndex:index]];
    
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}


#pragma tableView delegate, datasourse
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.homeVM.cellNumber;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch ([self.homeVM cellTypeForIndex:indexPath.row]) {
        case 1:
        {
            NormalCell *cell = [tableView dequeueReusableCellWithIdentifier:@"normal" forIndexPath:indexPath];
            [cell.imageV setImageURL:[self.homeVM imgURLForIndex:indexPath.row]];
            cell.titleLb.text = [self.homeVM titleForIndex:indexPath.row];
            cell.comment_count.text = [self.homeVM comment_countForIndex:indexPath.row];
            cell.publish_time.text = [self.homeVM publish_timeForIndex:indexPath.row];
            cell.praise_count.text = [self.homeVM praise_countForIndex:indexPath.row];
            cell.type.text = [self.homeVM artistForIndex:indexPath.row];
            return cell;
        }
            break;
        case 0:{
            NormalCell *cell = [tableView dequeueReusableCellWithIdentifier:@"normal" forIndexPath:indexPath];
            [cell.imageV setImageURL:[self.homeVM imgURLForIndex:indexPath.row]];
            cell.titleLb.text = [self.homeVM titleForIndex:indexPath.row];
            cell.comment_count.text = [self.homeVM comment_countForIndex:indexPath.row];
            cell.publish_time.text = [self.homeVM publish_timeForIndex:indexPath.row];
            cell.praise_count.text = [self.homeVM praise_countForIndex:indexPath.row];
            cell.type.text = [self.homeVM artistForIndex:indexPath.row];
            
            return cell;
        }
            break;
        case 2:
        {
            NormalCell *cell = [tableView dequeueReusableCellWithIdentifier:@"normal" forIndexPath:indexPath];
            [cell.imageV setImageURL:[self.homeVM imgURLForIndex:indexPath.row]];
            cell.titleLb.text = [self.homeVM titleForIndex:indexPath.row];
            cell.comment_count.text = [self.homeVM comment_countForIndex:indexPath.row];
            cell.publish_time.text = [self.homeVM publish_timeForIndex:indexPath.row];
            cell.praise_count.text = [self.homeVM praise_countForIndex:indexPath.row];
            cell.type.text = [self.homeVM artistForIndex:indexPath.row];
            
            return cell;
        }
            break;
        default:
            return nil;
            break;
    }
}



- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    WebViewController *vc = [[WebViewController alloc] initWithURL:[self.homeVM URLForIndex:indexPath.row]];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}


















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (HomeViewModel *)homeVM {
	if(_homeVM == nil) {
		_homeVM = [[HomeViewModel alloc] init];
	}
	return _homeVM;
}

- (UITableView *)tableView {
	if(_tableView == nil) {
		_tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
	}
	return _tableView;
}

@end
