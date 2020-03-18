//
//  NavViewController.m
//  PointlessBack
//
//  Created by wintel on 16/8/3.
//  Copyright © 2016年 ChinaSofti. All rights reserved.
//

#import "WTBaseNavViewController.h"
#import "WTBaseViewController.h"

@interface WTBaseNavViewController () <UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation WTBaseNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.delegate = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = self;
        self.interactivePopGestureRecognizer.delaysTouchesBegan = NO;
        self.interactivePopGestureRecognizer.enabled = NO;
    }
}

#pragma mark - UIGestureRecognizerDelegate Start
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    NSUInteger numberVCs = [self.viewControllers count];
    if (numberVCs > 1){
        id lastVC = [self.viewControllers lastObject];
        if ([lastVC isKindOfClass:[WTBaseViewController class]]) {
            BOOL isEnableSlideToBack = ((WTBaseViewController *)lastVC).isEnableSlideToBack;
            if (!isEnableSlideToBack) {
                return NO;
            }
        }
        return YES;
    }
    return NO;
}
#pragma mark - UIGestureRecognizerDelegate End
#pragma mark


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    [super pushViewController:viewController animated:animated];
}
#pragma mark - UINavigationControllerDelegate Start
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = YES;
    }
}
#pragma mark - UINavigationControllerDelegate End
#pragma mark

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
