//
//  WTVCManager.h
//  我的相关模块 ViewController 管理,记录
//
//  Created by wintel on 2018/7/5.
//  Copyright © 2018年 chinasofti. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kStoryBadrdNameMain @"Main"

#define WTVCSharedManager [WTVCManager manager]
#define WTVCByName(name) [WTVCManager viewControllerByName:(name)]



@protocol WTVCManagerProtocol <NSObject>

@required

+ (NSString *)storyBadrdName;
+ (NSString *)storyBadrdID;

@end

@interface WTVCManager : NSObject

+ (instancetype)manager;

+ (UIViewController *)viewControllerByName:(NSString *)name;

- (void)setPlistFilePath:(NSString *)plistFilePath;

@end
