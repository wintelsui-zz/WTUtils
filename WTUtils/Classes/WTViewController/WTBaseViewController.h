//
//  WTBaseViewController.h
//  LilysFriends
//
//  Created by wintel on 17/2/8.
//  Copyright © 2017年 wintelsui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTVCManager.h"

//用于 iOS11弃用automaticallyAdjustsScrollViewInsets导致的问题
#define  adjustsScrollViewInsets(scrollView)\
do {\
_Pragma("clang diagnostic push")\
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"")\
if ([scrollView respondsToSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:")]) {\
NSMethodSignature *signature = [UIScrollView instanceMethodSignatureForSelector:@selector(setContentInsetAdjustmentBehavior:)];\
NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];\
NSInteger argument = 2;\
invocation.target = scrollView;\
invocation.selector = @selector(setContentInsetAdjustmentBehavior:);\
[invocation setArgument:&argument atIndex:2];\
[invocation retainArguments];\
[invocation invoke];\
}\
_Pragma("clang diagnostic pop")\
} while (0)


@interface WTBaseViewController : UIViewController <WTVCManagerProtocol>
{
    UIButton *buttonLeft;
    UIView *viewbuttonLeft;
    
    UIButton *buttonRight;
    UIView *viewbuttonRight;
    UIButton *buttonRight01;
    
    UIButton *buttonMiddle;
    UIView *viewbuttonMiddle;
}

- (void)setNavLeftButtonWithImageName:(NSString *)imageName
                                title:(NSString *)title
                          normalColor:(UIColor *)normalColor;

- (void)setNavRightButtonWithImageName:(NSString *)imageName
                                 title:(NSString *)title
                           normalColor:(UIColor *)normalColor;

- (void)setNavRightButtonWithImageName:(NSString *)imageName
                                 title:(NSString *)title
                           normalColor:(UIColor *)normalColor
                           Image01Name:(NSString *)image01Name
                               title01:(NSString *)title01
                         normalColor01:(UIColor *)normalColor01;

- (void)setNavMiddleButtonWithImageName:(NSString *)imageName
                                  title:(NSString *)title
                            normalColor:(UIColor *)normalColor;


- (void)pressedLeftButton;
- (void)pressedRightButton;
- (void)pressedRightButton01;

- (void)pressedMiddleButton;

- (void)navigationBarBackgroundByColor:(UIColor *)color translucent:(BOOL)translucent;
- (void)navigationBarBackgroundByColor:(UIColor *)color orImage:(UIImage *)bgImage translucent:(BOOL)translucent;
- (void)navigationBarBackgroundByColor:(UIColor *)color orImage:(UIImage *)bgImage translucentNO:(BOOL)translucent;
- (void)hidNavigationShadowImage:(BOOL)hidden color:(UIColor *)color;

/**
 *  @author wintelsui
 *
 *  @brief  是否希望页面支持侧滑返回,默认为Yes
 *
 *  @return 是否支持侧滑返回
 */
- (BOOL)isEnableSlideToBack;

#pragma mark - -- WTVCManagerProtocol --
//
//+ (NSString *)storyBadrdID;
//+ (NSString *)storyBadrdName;
@end
