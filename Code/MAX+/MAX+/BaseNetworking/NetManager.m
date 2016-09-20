//
//  NetManager.m
//  MAX+
//
//  Created by tarena on 16/8/11.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NetManager.h"


@implementation NetManager

+(id)getHomeLastkey:(NSString *)lastkey withNumber:(NSInteger)num completionHandler:(void (^)(QDailyHomeModel *, NSError *))completionHandler{
    NSString *path = nil;
    if (num == 0) {
        path = [NSString stringWithFormat:kMainPath, lastkey];
    }else{
        path = [NSString stringWithFormat:kOtherPath, num, lastkey];
    }
    
    return [BaseNetworking GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        if (error) {
            !completionHandler ?: completionHandler(nil, error);
        }else{
            !completionHandler ?: completionHandler([QDailyHomeModel parse:responseObj], nil);
        }
    }];
}


+(id)getImageLastKey:(NSInteger)lastkey completionHandler:(void (^)(imageModel *, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:kimgPath, lastkey];
    return [BaseNetworking GETImg:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        if (!error) {
            !completionHandler ?: completionHandler([imageModel parse:responseObj], nil);
        }else{
            !completionHandler ?: completionHandler(nil, error);
        }
    }];
}


+(id)getVideoLastKey:(NSInteger)lastkey completionHandler:(void (^)(VideoModel *, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:kVideoPath, lastkey];
    return [BaseNetworking GETImg:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        if (!error) {
            !completionHandler ?: completionHandler([VideoModel parse:responseObj], nil);
        }else{
            !completionHandler ?: completionHandler(nil, error);
        }
    }];
}





















@end
