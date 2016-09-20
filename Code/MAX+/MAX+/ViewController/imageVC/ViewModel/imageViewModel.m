//
//  imageViewModel.m
//  MAX+
//
//  Created by tarena on 16/9/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "imageViewModel.h"
#import "NetManager.h"

@implementation imageViewModel



- (NSString *)titleAtIndex:(NSInteger)index{
    return self.datalist[index].title;
}

- (NSURL *)img1URLAtIndex:(NSInteger)index{
    return self.datalist[index].showitem[0].pic.my_url;
}
- (NSURL *)img2URLAtIndex:(NSInteger)index{
    return self.datalist[index].showitem[1].pic.my_url;
}
- (NSURL *)img3URLAtIndex:(NSInteger)index{
    return self.datalist[index].showitem[2].pic.my_url;
}

- (NSInteger)aidAtIndex:(NSInteger)index{
    return self.datalist[index].aid;
}

- (NSInteger)cellNumber{
    return self.datalist.count;
}















- (void)getRequestMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    if (requestMode == RequestModeRefresh) {
        self.page = 0;
    }else{
        self.page += 10;
    }
    self.dataTask = [NetManager getImageLastKey:_page completionHandler:^(imageModel *model, NSError *error) {
        if (!error) {
            if (requestMode == RequestModeRefresh) {
                [self.datalist removeAllObjects];
            }
            [self.datalist addObjectsFromArray:model.data.list];
            
            !completionHandler ?: completionHandler(nil);
        }else{
            !completionHandler ?: completionHandler(error);
        }
    }];
}

- (NSMutableArray<DataList *> *)datalist {
    if(_datalist == nil) {
        _datalist = [[NSMutableArray<DataList *> alloc] init];
    }
    return _datalist;
}



@end
