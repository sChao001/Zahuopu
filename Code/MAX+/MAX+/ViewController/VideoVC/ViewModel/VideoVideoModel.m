//
//  VideoVideoModel.m
//  MAX+
//
//  Created by tarena on 16/9/8.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "VideoVideoModel.h"
#import "NetManager.h"

@implementation VideoVideoModel



- (NSString *)allnumOfItemAtIndex:(NSInteger)index{
    NSString *str = [NSString stringWithFormat:@"%ld人在看", self.datalist[index].allnum];
    return str;
}
- (NSURL *)smallpicOfItemAtIndex:(NSInteger)index{
    return self.datalist[index].smallpic.my_url;
}
- (NSURL *)bigpicOfItemAtIndex:(NSInteger)index{
    return self.datalist[index].bigpic.my_url;
}
- (NSString *)mynameOfItemAtIndex:(NSInteger)index{
    return self.datalist[index].myname;
}
- (NSString *)flvOfItemAtIndex:(NSInteger)index{
    return self.datalist[index].flv;
}
- (NSString *)gpsOfItemAtIndex:(NSInteger)index{
    return self.datalist[index].gps;
}
-(NSInteger)cellNum{
    return self.datalist.count;
}













- (void)getRequestMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    if (requestMode == RequestModeRefresh) {
        self.page = 1;
    }else {
        self.page++;
    }
    [NetManager getVideoLastKey:self.page completionHandler:^(VideoModel *model, NSError *error) {
        if (!error) {
            if (requestMode == RequestModeRefresh) {
                [self.datalist removeAllObjects];
            }
            [self.datalist addObjectsFromArray:model.data.list];
            
            !completionHandler ?: completionHandler(nil);
        }else {
            !completionHandler ?: completionHandler(error);
        }
        
    }];
}



- (NSMutableArray<VideoDataList *> *)datalist {
    if(_datalist == nil) {
        _datalist = [[NSMutableArray<VideoDataList *> alloc] init];
    }
    return _datalist;
}
@end
