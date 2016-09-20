//
//  HomeViewModel.m
//  MAX+
//
//  Created by tarena on 16/8/11.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HomeViewModel.h"



@implementation HomeViewModel



//------imgCell

-(NSURL *)imgTypeOfVC{
    return self.dataList[0].post.column.image.my_url;
}

-(NSInteger)headVnum{
    return self.banners.count;
}
- (NSURL *)headImgURLAtIndex:(NSInteger)index{
    return self.banners[index].image.my_url;
}

- (NSURL *)headImgWebURLAtIndex:(NSInteger)index{
    return self.banners[index].post.appview.my_url;
}


//-------normalcell
-(NSString *)detailTextAtIndex:(NSInteger)index{
    return self.dataList[index].post.description;
}

-(NSAttributedString *)attributedStringAtIndex:(NSInteger)index{
    NSAttributedString *type = [[NSAttributedString alloc] initWithString:self.dataList[index].post.category.title attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13], NSForegroundColorAttributeName:[UIColor grayColor]}];
    NSTextAttachment *img1 = [NSTextAttachment new];
    img1.image = [UIImage imageNamed:@"feedComment"];
    img1.bounds = CGRectMake(0, 0, 15, 15);
    NSTextAttachment *img2 = [NSTextAttachment new];
    img2.image = [UIImage imageNamed:@"feedPraise"];
    img2.bounds = CGRectMake(0, 0, 15, 15);
    NSAttributedString *image1 = [NSAttributedString attributedStringWithAttachment:img1];
    NSAttributedString *image2 = [NSAttributedString attributedStringWithAttachment:img2];
    NSString *comment = [NSString stringWithFormat:@"%ld", self.dataList[index].post.comment_count];
    NSAttributedString *com = [[NSAttributedString alloc] initWithString:comment attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13], NSForegroundColorAttributeName:[UIColor grayColor]}];
    NSString *praise = [NSString stringWithFormat:@"%ld", self.dataList[index].post.praise_count];
    NSAttributedString *prai = [[NSAttributedString alloc] initWithString:praise attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13], NSForegroundColorAttributeName:[UIColor grayColor]}];
    NSString *t = nil;
    NSInteger publish_time = self.dataList[index].post.publish_time;
    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970] / 1000;
    NSInteger time = a - publish_time;
    if (time/60 < 0) {
        t = @"刚刚";
    }else if (time/3600 < 0){
        t = [NSString stringWithFormat:@"%ld分钟前",time/60];
    }else if(time/3600/12 < 0){
        t = [NSString stringWithFormat:@"%ld小时前",time/3600];
    }else{
        t = @"昨天";
    }
    
    NSAttributedString *time1 = [[NSAttributedString alloc] initWithString:t attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13], NSForegroundColorAttributeName:[UIColor grayColor]}];
    NSMutableAttributedString *attributedStr = [NSMutableAttributedString new];
    [attributedStr appendAttributedString:type];
    if (self.dataList[index].post.comment_count) {
        [attributedStr appendAttributedString:image1];
        [attributedStr appendAttributedString:com];
    }
    if (self.dataList[index].post.praise_count) {
        [attributedStr appendAttributedString:image2];
        [attributedStr appendAttributedString:prai];
    }
    [attributedStr appendAttributedString:time1];
    return attributedStr;
}

-(NSInteger)cellNumber{
    return self.dataList.count;
}

-(NSURL *)URLForIndex:(NSInteger)index{
    return self.dataList[index].post.appview.my_url;
}

- (NSURL *)imgURLForIndex:(NSInteger)index{
    return self.dataList[index].image.my_url;
}
- (NSString *)titleForIndex:(NSInteger)index{
    return self.dataList[index].post.title;
}
- (NSString *)artistForIndex:(NSInteger)index{
    return self.dataList[index].post.category.title;
}
- (NSString *)comment_countForIndex:(NSInteger)index{
    return [NSString stringWithFormat:@"%ld", self.dataList[index].post.comment_count] ;
}
- (NSString *)praise_countForIndex:(NSInteger)index{
    return [NSString stringWithFormat:@"%ld", self.dataList[index].post.praise_count];
}
- (NSString *)publish_timeForIndex:(NSInteger)index{
    NSInteger publish_time = self.dataList[index].post.publish_time;
    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970] / 1000;
    NSInteger time = a - publish_time;
    if (time/60 < 0) {
        return @"刚刚";
    }else if (time/3600 < 0){
        return [NSString stringWithFormat:@"%ld分钟前",time/60];
    }else if(time/3600/12 < 0){
        return [NSString stringWithFormat:@"%ld小时前",time/3600];
    }else{
        return @"昨天";
    }
}
-(NSInteger)cellTypeForIndex:(NSInteger)index{
    return self.dataList[index].type;
}



-(void)getRequestMode:(RequestMode)requestMode withNumber:(NSInteger)num  completionHandler:(void (^)(NSError *error))completionHandler{
    
    if (requestMode == RequestModeRefresh) {
        self.last = @"0";
    }
    
    self.dataTask = [NetManager getHomeLastkey:self.last withNumber:num  completionHandler:^(QDailyHomeModel *model, NSError *error) {
        if (!error) {
            if (requestMode == RequestModeRefresh) {
                [self.dataList removeAllObjects];
                [self.banners removeAllObjects];
                [self.banners addObjectsFromArray:model.response.banners];
            }
            [self.dataList addObjectsFromArray:model.response.feeds];
            
            self.last = model.response.last_key;
            !completionHandler ?: completionHandler(nil);
        }
        else{
            !completionHandler ?: completionHandler(error);
        }
        
    }];
}

- (NSMutableArray<Feeds *> *)dataList {
    if(_dataList == nil) {
        _dataList = [[NSMutableArray<Feeds *> alloc] init];
    }
    return _dataList;
}

- (NSMutableArray<Feeds *> *)banners {
    if(_banners == nil) {
        _banners = [[NSMutableArray<Feeds *> alloc] init];
    }
    return _banners;
}

@end
