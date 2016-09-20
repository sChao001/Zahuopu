//
//  CosImageController.m
//  MAX+
//
//  Created by tarena on 16/9/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "CosImageController.h"
#import "imageDetailModel.h"


@interface CosImageController ()
@property (nonatomic) NSMutableArray<Content *> *datalist;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *bacbtn;
@property (nonatomic) BOOL showBackBtn;
@end

@implementation CosImageController

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
//    [self preferredStatusBarStyle];
//    [self setNeedsStatusBarAppearanceUpdate];
    self.showBackBtn = YES;
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript", @"text/plain", nil];
    
    NSString *path = [NSString stringWithFormat:@"http://api.tuwan.com/app/?aid=%ld&appid=1", self.aid];
    
    [manager GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",task.currentRequest.URL.absoluteString);
        NSString *cachePath = [docPath stringByAppendingPathComponent:task.currentRequest.URL.absoluteString.md5String];
        [[NSOperationQueue new] addOperationWithBlock:^{
            [NSKeyedArchiver archiveRootObject:responseObject toFile:cachePath];
            
            NSArray<imageDetailModel *> *model = [imageDetailModel parse:responseObject];
            [self.datalist removeAllObjects];
            
            [self.datalist addObjectsFromArray:model[0].content];
            NSLog(@"");
            [self configScrollView];
        }];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"上网请求失败");
        NSLog(@"%@",task.currentRequest.URL.absoluteString);
        NSString *cachePath = [docPath stringByAppendingPathComponent:task.currentRequest.URL.absoluteString].md5String;
        id response = [NSKeyedUnarchiver unarchiveObjectWithFile:cachePath];
        if (response) {
            NSArray<imageDetailModel *> *model = [imageDetailModel parse:response];
            [self.datalist removeAllObjects];
            
            [self.datalist addObjectsFromArray:model[0].content];
            NSLog(@"");
            [self configScrollView];
        }
        
        else{
            
        }
    }];
    self.scrollView.bounces = YES;
    [self.view insertSubview:self.bacbtn aboveSubview:self.scrollView];
    [self addTapGestureRecognizer];
}

//- (UIStatusBarStyle)preferredStatusBarStyle{
//    return UIStatusBarStyleDefault;
//}









- (void)configScrollView{
    
    __block CGFloat h = 0;
    [self.datalist enumerateObjectsUsingBlock:^(Content * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        Content *content = obj;
        CGFloat height = kMainWindowWidth/content.width*content.height;
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, h, kMainWindowWidth, height)];
        h += height;
        
        [image setImageURL:content.pic.my_url];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.scrollView.contentSize = CGSizeMake(kMainWindowWidth, h);
        [self.scrollView addSubview:image];
        }];
    }];
}



- (IBAction)backBtn:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addTapGestureRecognizer{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
        
        [UIView animateWithDuration:0.5 animations:^{
            self.bacbtn.transform =self.showBackBtn ? CGAffineTransformMakeTranslation(0, -100) : CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            self.showBackBtn = !self.showBackBtn;
        }];
        
    }];
    [self.scrollView addGestureRecognizer:tap];
}










- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}








- (NSMutableArray<Content *> *)datalist {
	if(_datalist == nil) {
		_datalist = [[NSMutableArray<Content *> alloc] init];
	}
	return _datalist;
}

@end
