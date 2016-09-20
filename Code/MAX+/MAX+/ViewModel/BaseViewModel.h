//
//  BaseViewModel.h
//  MAX+
//
//  Created by tarena on 16/8/11.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, RequestMode) {
    RequestModeRefresh,
    RequestModeMore,
    
};



@interface BaseViewModel : NSObject


- (void)getRequestMode:(RequestMode)requestMode completionHandler:(void(^)(NSError *error))completionHandler;



@property (nonatomic) NSURLSessionTask *dataTask;

@end
