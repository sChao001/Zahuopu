//
//  WebViewController.h
//  MAX+
//
//  Created by tarena on 16/8/11.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController

@property (nonatomic) NSURL *url;

- (UIViewController *)initWithURL:(NSURL *)url;

@end
