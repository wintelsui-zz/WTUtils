//
//  WTBaseViewController.m
//  LilysFriends
//
//  Created by wintel on 17/2/8.
//  Copyright © 2017年 wintelsui. All rights reserved.
//

#import "WTBaseViewController.h"

@interface WTBaseViewController ()

@end

@implementation WTBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
        [self setAutomaticallyAdjustsScrollViewInsets:NO];
    }
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20.0f],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    
    [self navigationBarBackgroundByColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.9] translucent:YES];
}


- (void)navigationBarBackgroundByColor:(UIColor *)color translucent:(BOOL)translucent{
    if (color != nil) {
        UIImage *image = [WTBaseViewController imageWithFullColorInSize:CGSizeMake(([[UIScreen mainScreen] bounds].size.width), (CGRectGetHeight([UIApplication sharedApplication].statusBarFrame) + 44)) AndColor:color];
        [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
        CGFloat alpha = CGColorGetAlpha(color.CGColor);
        if (alpha < 1 ) {
            translucent = YES;
        }
        [self.navigationController.navigationBar setBackgroundColor:[UIColor clearColor]];
    }
    
    self.navigationController.navigationBar.translucent = translucent;
}


- (void)navigationBarBackgroundByColor:(UIColor *)color orImage:(UIImage *)bgImage translucent:(BOOL)translucent{
    UIImage *image;
    if (bgImage == nil) {
        image = [WTBaseViewController imageWithFullColorInSize:CGSizeMake(([[UIScreen mainScreen] bounds].size.width), (CGRectGetHeight([UIApplication sharedApplication].statusBarFrame) + 44)) AndColor:color];
    }else{
        image = bgImage;
    }
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    if (color) {
        CGFloat alpha = CGColorGetAlpha(color.CGColor);
        if (alpha == 0 ) {
            translucent = YES;
        }
    }
    [self.navigationController.navigationBar setBackgroundColor:[UIColor clearColor]];
    self.navigationController.navigationBar.translucent = translucent;
}

- (void)navigationBarBackgroundByColor:(UIColor *)color orImage:(UIImage *)bgImage translucentNO:(BOOL)translucent{
    UIImage *image;
    if (bgImage == nil) {
        image = [WTBaseViewController imageWithFullColorInSize:CGSizeMake(([[UIScreen mainScreen] bounds].size.width), (CGRectGetHeight([UIApplication sharedApplication].statusBarFrame) + 44)) AndColor:color];
    }else{
        image = bgImage;
    }
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    if (color) {
        CGFloat alpha = CGColorGetAlpha(color.CGColor);
        if (alpha == 0 ) {
            translucent = YES;
        }
    }
    
    self.navigationController.navigationBar.translucent = NO;
    for (UIView *subview in [self.navigationController.navigationBar subviews]) {
        if ([subview isKindOfClass:NSClassFromString(@"_UIBarBackground")]) {
            subview.backgroundColor = [UIColor clearColor];
        }
    }
    [self.navigationController.navigationBar setBackgroundColor:[UIColor clearColor]];
}

- (void)hidNavigationShadowImage:(BOOL)hidden color:(UIColor *)color{
    
    if ([UINavigationBar instancesRespondToSelector:@selector(setShadowImage:)])
    {
        if (hidden) {
            UIImage *image = [WTBaseViewController imageWithFullColorInSize:CGSizeMake(([[UIScreen mainScreen] bounds].size.width), 1) AndColor:[UIColor clearColor]];
            [self.navigationController.navigationBar setShadowImage:image];
        }else{
            if (color == nil) {
                color = [UIColor clearColor];
            }
            UIImage *image = [WTBaseViewController imageWithFullColorInSize:CGSizeMake(([[UIScreen mainScreen] bounds].size.width), 1) AndColor:color];
            [self.navigationController.navigationBar setShadowImage:image];
        }
    }
}


- (void)setNavLeftButtonWithImageName:(NSString *)imageName title:(NSString *)title normalColor:(UIColor *)normalColor{
    UIView *viewbuttonLeftTemp = [[UIView alloc] init];
    [viewbuttonLeftTemp setBackgroundColor:[UIColor clearColor]];
    
    UIButton *buttonTemp = [UIButton buttonWithType:UIButtonTypeCustom];
    BOOL hasImage = NO;
    if ((imageName != nil && imageName.length > 0)) {
        UIImage *image = [UIImage imageNamed:imageName];
        if (image) {
            hasImage = YES;
        }
    }
    if ((title== nil || title.length == 0) && !hasImage) {
        return;
    }
    if ((hasImage && (title== nil || title.length == 0)) || (!hasImage && (title != nil && title.length > 0))) {
        //只有一个
        if (hasImage) {
            [buttonTemp setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        }else{
            [buttonTemp setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
        }
    }else{
        [buttonTemp setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    }
    CGSize imageSize = CGSizeZero;
    if (hasImage) {
        UIImage *image = [UIImage imageNamed:imageName];
        if (image.size.height > 44) {
            imageSize = CGSizeMake((image.size.width * 44 * 1.0)/image.size.height, 44);
        }else{
            imageSize = image.size;
        }
        [buttonTemp setImage:image forState:UIControlStateNormal];
    }
    CGSize titleSize = CGSizeZero;
    if (title != nil && title.length > 0) {
        titleSize = [WTBaseViewController getLabelWithSize:title width:120 font:[UIFont systemFontOfSize:16.0f] limit:CGSizeMake(0, 120)];
        [buttonTemp setTitle:title forState:UIControlStateNormal];
        [buttonTemp.titleLabel setFont:[UIFont systemFontOfSize:16.0f]];
        if (normalColor) {
            [buttonTemp setTitleColor:normalColor forState:UIControlStateNormal];
        }
    }
    float width = 0;
    float heigth = 44;
    if (imageSize.width > 0) {
        width = imageSize.width + 10;
    }
    if (titleSize.width > 0) {
        width += (titleSize.width + 10);
    }
    if (width < 44) {
        width = 44;
    }
    [viewbuttonLeftTemp setFrame:CGRectMake(0, 0, width, heigth)];
//    [buttonTemp setFrame:CGRectMake(0, 0, width, heigth)];
    [buttonTemp setFrame:CGRectMake(-6, 0, width+6, heigth)];
    [buttonTemp setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 6)];
    
    [viewbuttonLeftTemp addSubview:buttonTemp];
    
    viewbuttonLeft = viewbuttonLeftTemp;
    buttonLeft = buttonTemp;
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:viewbuttonLeft];
    [self.navigationItem setLeftBarButtonItem:backItem];
    
    [buttonLeft addTarget:self action:@selector(pressedLeftButton) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setNavRightButtonWithImageName:(NSString *)imageName title:(NSString *)title normalColor:(UIColor *)normalColor{
    UIView *viewbuttonRightTemp = [[UIView alloc] init];
    [viewbuttonRightTemp setBackgroundColor:[UIColor clearColor]];
    
    UIButton *buttonTemp = [UIButton buttonWithType:UIButtonTypeCustom];
    BOOL hasImage = NO;
    if ((imageName != nil && imageName.length > 0)) {
        UIImage *image = [UIImage imageNamed:imageName];
        if (image) {
            hasImage = YES;
        }
    }
    if ((title== nil || title.length == 0) && !hasImage) {
        return;
    }
    if ((hasImage && (title== nil || title.length == 0)) || (!hasImage && (title != nil && title.length > 0))) {
        //只有一个
        if (hasImage) {
            [buttonTemp setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
        }else{
            [buttonTemp setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
        }
    }else{
        [buttonTemp setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    }
    CGSize imageSize = CGSizeZero;
    if (hasImage) {
        UIImage *image = [UIImage imageNamed:imageName];
        if (image.size.height > 44) {
            imageSize = CGSizeMake((image.size.width * 44 * 1.0)/image.size.height, 44);
        }else{
            imageSize = image.size;
        }
        [buttonTemp setImage:image forState:UIControlStateNormal];
    }
    CGSize titleSize = CGSizeZero;
    if (title != nil && title.length > 0) {
        titleSize = [WTBaseViewController getLabelWithSize:title width:120 font:[UIFont systemFontOfSize:16.0f] limit:CGSizeMake(0, 120)];
        [buttonTemp setTitle:title forState:UIControlStateNormal];
        [buttonTemp.titleLabel setFont:[UIFont systemFontOfSize:16.0f]];
        [buttonTemp setTitleColor:normalColor forState:UIControlStateNormal];
    }
    float width = 0;
    float heigth = 44;
    if (imageSize.width > 0) {
        width = imageSize.width + 10;
    }
    if (titleSize.width > 0) {
        width += (titleSize.width + 10);
    }
    if (width < 44) {
        width = 44;
    }
    
    [viewbuttonRightTemp setFrame:CGRectMake(0, 0, width, heigth)];
    //    [buttonTemp setFrame:CGRectMake(0, 0, width, heigth)];
    [buttonTemp setFrame:CGRectMake(0, 0, width+6, heigth)];
    [buttonTemp setContentEdgeInsets:UIEdgeInsetsMake(0, 6, 0, 0)];
    
    [viewbuttonRightTemp addSubview:buttonTemp];
    
    viewbuttonRight = viewbuttonRightTemp;
    
    buttonRight = buttonTemp;
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:viewbuttonRight];
    [self.navigationItem setRightBarButtonItem:backItem];
    
    [buttonRight addTarget:self action:@selector(pressedRightButton) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setNavRightButtonWithImageName:(NSString *)imageName
                                 title:(NSString *)title
                           normalColor:(UIColor *)normalColor
                           Image01Name:(NSString *)image01Name
                               title01:(NSString *)title01
                         normalColor01:(UIColor *)normalColor01
{
    UIView *viewbuttonRightTemp = [[UIView alloc] init];
    [viewbuttonRightTemp setBackgroundColor:[UIColor clearColor]];
    
    float space = 8.0;
    float widthX2 = 44;
    float startx = 0;
    
    UIButton *buttonTemp = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *buttonTemp01 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    {//01
        BOOL hasImage = NO;
        if ((image01Name != nil && image01Name.length > 0)) {
            UIImage *image = [UIImage imageNamed:image01Name];
            if (image) {
                hasImage = YES;
            }
        }
        if ((title01== nil || title01.length == 0) && !hasImage) {
            return;
        }
        if ((hasImage && (title01== nil || title01.length == 0)) || (!hasImage && (title01 != nil && title01.length > 0))) {
            //只有一个
            if (hasImage) {
                [buttonTemp01 setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
            }else{
                [buttonTemp01 setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
            }
        }else{
            [buttonTemp01 setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
        }
        CGSize imageSize = CGSizeZero;
        if (hasImage) {
            UIImage *image = [UIImage imageNamed:image01Name];
            if (image.size.height > 44) {
                imageSize = CGSizeMake((image.size.width * 44 * 1.0)/image.size.height, 44);
            }else{
                imageSize = image.size;
            }
            [buttonTemp01 setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
            [buttonTemp01 setTintColor:normalColor01];
        }
        CGSize title01Size = CGSizeZero;
        if (title01 != nil && title01.length > 0) {
            title01Size = [WTBaseViewController getLabelWithSize:title01 width:120 font:[UIFont systemFontOfSize:16.0f] limit:CGSizeMake(0, 120)];
            [buttonTemp01 setTitle:title01 forState:UIControlStateNormal];
            [buttonTemp01.titleLabel setFont:[UIFont systemFontOfSize:16.0f]];
            [buttonTemp01 setTitleColor:normalColor01 forState:UIControlStateNormal];
            [buttonTemp01 setTintColor:normalColor01];
        }
        float width = 0;
        if (imageSize.width > 0) {
            width = imageSize.width;
        }
        if (title01Size.width > 0) {
            width += (title01Size.width + 10);
        }
        if (width < 44) {
            width = 44;
        }
        [buttonTemp01 setFrame:CGRectMake(0, 0, width, 44)];
        [buttonTemp01 setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        startx = width + space;
        widthX2 = width + space;
    }
    {
        BOOL hasImage = NO;
        if ((imageName != nil && imageName.length > 0)) {
            UIImage *image = [UIImage imageNamed:imageName];
            if (image) {
                hasImage = YES;
            }
        }
        if ((title== nil || title.length == 0) && !hasImage) {
            return;
        }
        if ((hasImage && (title== nil || title.length == 0)) || (!hasImage && (title != nil && title.length > 0))) {
            //只有一个
            if (hasImage) {
                [buttonTemp setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
            }else{
                [buttonTemp setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
            }
        }else{
            [buttonTemp setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
        }
        CGSize imageSize = CGSizeZero;
        if (hasImage) {
            UIImage *image = [UIImage imageNamed:imageName];
            if (image.size.height > 44) {
                imageSize = CGSizeMake((image.size.width * 44 * 1.0)/image.size.height, 44);
            }else{
                imageSize = image.size;
            }
            [buttonTemp setImage:image forState:UIControlStateNormal];
        }
        CGSize titleSize = CGSizeZero;
        if (title != nil && title.length > 0) {
            titleSize = [WTBaseViewController getLabelWithSize:title width:120 font:[UIFont systemFontOfSize:16.0f] limit:CGSizeMake(0, 120)];
            [buttonTemp setTitle:title forState:UIControlStateNormal];
            [buttonTemp.titleLabel setFont:[UIFont systemFontOfSize:16.0f]];
            [buttonTemp setTitleColor:normalColor forState:UIControlStateNormal];
        }
        float width = 0;
        if (imageSize.width > 0) {
            width = imageSize.width;
        }
        if (titleSize.width > 0) {
            width += (titleSize.width + 10);
        }
        if (width < 44) {
            width = 44;
        }
        [buttonTemp setFrame:CGRectMake(startx, 0, width, 44)];
        [buttonTemp setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        
        widthX2 += width;
    }
    
    [viewbuttonRightTemp setFrame:CGRectMake(0, 0, widthX2, 44)];
    
    [viewbuttonRightTemp addSubview:buttonTemp01];
    [viewbuttonRightTemp addSubview:buttonTemp];
    
    viewbuttonRight = viewbuttonRightTemp;
    
    buttonRight = buttonTemp;
    buttonRight01 = buttonTemp01;
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:viewbuttonRight];
    [self.navigationItem setRightBarButtonItem:backItem];
    
    [buttonRight addTarget:self action:@selector(pressedRightButton) forControlEvents:UIControlEventTouchUpInside];
    [buttonRight01 addTarget:self action:@selector(pressedRightButton01) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setNavRightButtonWithImageName:(NSString *)imageName
                                 title:(NSString *)title
                           normalColor:(UIColor *)normalColor
                           Image01Name:(NSString *)image01Name
                     image01SystemName:(UIBarButtonSystemItem)systemItem
                               title01:(NSString *)title01
                         normalColor01:(UIColor *)normalColor01
{
    UIView *viewbuttonRightTemp = [[UIView alloc] init];
    [viewbuttonRightTemp setBackgroundColor:[UIColor clearColor]];
    
    
    float widthX2 = 44;
    float startx = 0;
    
    UIButton *buttonTemp = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *buttonTemp01 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (image01Name != nil) {//01
        BOOL hasImage = NO;
        if ((image01Name != nil && image01Name.length > 0)) {
            UIImage *image = [UIImage imageNamed:image01Name];
            if (image) {
                hasImage = YES;
            }
        }
        if ((title01== nil || title01.length == 0) && !hasImage) {
            return;
        }
        if ((hasImage && (title01== nil || title01.length == 0)) || (!hasImage && (title01 != nil && title01.length > 0))) {
            //只有一个
            if (hasImage) {
                [buttonTemp01 setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
            }else{
                [buttonTemp01 setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
            }
        }else{
            [buttonTemp01 setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
        }
        CGSize imageSize = CGSizeZero;
        if (hasImage) {
            UIImage *image = [UIImage imageNamed:image01Name];
            if (image.size.height > 44) {
                imageSize = CGSizeMake((image.size.width * 44 * 1.0)/image.size.height, 44);
            }else{
                imageSize = image.size;
            }
            [buttonTemp01 setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
            [buttonTemp01 setTintColor:normalColor01];
        }
        CGSize title01Size = CGSizeZero;
        if (title01 != nil && title01.length > 0) {
            title01Size = [WTBaseViewController getLabelWithSize:title01 width:120 font:[UIFont systemFontOfSize:16.0f] limit:CGSizeMake(0, 120)];
            [buttonTemp01 setTitle:title01 forState:UIControlStateNormal];
            [buttonTemp01.titleLabel setFont:[UIFont systemFontOfSize:16.0f]];
            [buttonTemp01 setTitleColor:normalColor01 forState:UIControlStateNormal];
            [buttonTemp01 setTintColor:normalColor01];
        }
        float width = 0;
        if (imageSize.width > 0) {
            width = imageSize.width;
        }
        if (title01Size.width > 0) {
            width += (title01Size.width + 10);
        }
        if (width < 44) {
            width = 44;
        }
        [buttonTemp01 setFrame:CGRectMake(0, 0, width, 44)];
        [buttonTemp01 setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        startx = width;
        widthX2 = width;
        [buttonTemp01 addTarget:self action:@selector(pressedRightButton01) forControlEvents:UIControlEventTouchUpInside];
    }else{
        
    }
    
    {
        BOOL hasImage = NO;
        if ((imageName != nil && imageName.length > 0)) {
            UIImage *image = [UIImage imageNamed:imageName];
            if (image) {
                hasImage = YES;
            }
        }
        if ((title== nil || title.length == 0) && !hasImage) {
            return;
        }
        if ((hasImage && (title== nil || title.length == 0)) || (!hasImage && (title != nil && title.length > 0))) {
            //只有一个
            if (hasImage) {
                [buttonTemp setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
            }else{
                [buttonTemp setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
            }
        }else{
            [buttonTemp setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
        }
        CGSize imageSize = CGSizeZero;
        if (hasImage) {
            UIImage *image = [UIImage imageNamed:imageName];
            if (image.size.height > 44) {
                imageSize = CGSizeMake((image.size.width * 44 * 1.0)/image.size.height, 44);
            }else{
                imageSize = image.size;
            }
            [buttonTemp setImage:image forState:UIControlStateNormal];
        }
        CGSize titleSize = CGSizeZero;
        if (title != nil && title.length > 0) {
            titleSize = [WTBaseViewController getLabelWithSize:title width:120 font:[UIFont systemFontOfSize:16.0f] limit:CGSizeMake(0, 120)];
            [buttonTemp setTitle:title forState:UIControlStateNormal];
            [buttonTemp.titleLabel setFont:[UIFont systemFontOfSize:16.0f]];
            [buttonTemp setTitleColor:normalColor forState:UIControlStateNormal];
        }
        float width = 0;
        if (imageSize.width > 0) {
            width = imageSize.width;
        }
        if (titleSize.width > 0) {
            width += (titleSize.width + 10);
        }
        if (width < 44) {
            width = 44;
        }
        [buttonTemp setFrame:CGRectMake(startx, 0, width, 44)];
        [buttonTemp setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        
        widthX2 += width;
        
        [buttonTemp addTarget:self action:@selector(pressedRightButton) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [viewbuttonRightTemp setFrame:CGRectMake(0, 0, widthX2, 44)];
    if (buttonTemp01 != nil) {
        [viewbuttonRightTemp addSubview:buttonTemp01];
        buttonRight01 = buttonTemp01;
    }
    if (buttonTemp) {
        [viewbuttonRightTemp addSubview:buttonTemp];
        buttonRight = buttonTemp;
        
    }
    viewbuttonRight = viewbuttonRightTemp;
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:viewbuttonRight];
    if (buttonTemp01 != nil) {
        [self.navigationItem setRightBarButtonItem:backItem];
    }else{
        UIBarButtonItem *backItem01 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(pressedRightButton01)];
        [backItem01 setTintColor:normalColor01];
        
        [self.navigationItem setRightBarButtonItems:@[backItem01,backItem]];
    }
    
}

- (void)setNavMiddleButtonWithImageName:(NSString *)imageName title:(NSString *)title normalColor:(UIColor *)normalColor{
    UIView *viewbuttonMiddleTemp = [[UIView alloc] init];
    [viewbuttonMiddleTemp setBackgroundColor:[UIColor clearColor]];
    
    UIButton *buttonTemp = [UIButton buttonWithType:UIButtonTypeCustom];
    BOOL hasImage = NO;
    if ((imageName != nil && imageName.length > 0)) {
        UIImage *image = [UIImage imageNamed:imageName];
        if (image) {
            hasImage = YES;
        }
    }
    if ((title== nil || title.length == 0) && !hasImage) {
        return;
    }
    
    [buttonTemp setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    
    CGSize imageSize = CGSizeZero;
    if (hasImage) {
        UIImage *image = [UIImage imageNamed:imageName];
        if (image.size.height > 44) {
            imageSize = CGSizeMake((image.size.width * 44 * 1.0)/image.size.height, 44);
        }else{
            imageSize = image.size;
        }
        [buttonTemp setImage:image forState:UIControlStateNormal];
    }
    float titleWidthMax = 200 - (imageSize.width > 0 ? (imageSize.width + 10) : 0);
    CGSize titleSize = CGSizeZero;
    if (title != nil && title.length > 0) {
        titleSize = [WTBaseViewController getLabelWithSize:title width:titleWidthMax font:[UIFont systemFontOfSize:20.0f] limit:CGSizeMake(0, 44)];
        [buttonTemp setTitle:title forState:UIControlStateNormal];
        [buttonTemp.titleLabel setFont:[UIFont systemFontOfSize:20.0f]];
        [buttonTemp setTitleColor:normalColor forState:UIControlStateNormal];
    }
    float width = 0;
    float heigth = 44;
    if (imageSize.width > 0) {
        width = imageSize.width + 10;
    }
    if (titleSize.width > 0) {
        width += (titleSize.width + 10);
    }
    if (width < 44) {
        width = 44;
    }
    
    [viewbuttonMiddleTemp setFrame:CGRectMake(0, 0, width, heigth)];
    [buttonTemp setFrame:CGRectMake(0, 0, width, heigth)];
    
    [viewbuttonMiddleTemp addSubview:buttonTemp];
    
    viewbuttonMiddle = viewbuttonMiddleTemp;
    
    buttonMiddle = buttonTemp;
    [self.navigationItem setTitleView:viewbuttonMiddle];
    
    [buttonMiddle addTarget:self action:@selector(pressedMiddleButton) forControlEvents:UIControlEventTouchUpInside];
}

- (void)pressedLeftButton{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)pressedRightButton{
    
}

- (void)pressedRightButton01{
    
}

- (void)pressedMiddleButton{
    
}


- (BOOL)isEnableSlideToBack{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - -- WTVCManagerProtocol --
////  __attribute__((overloadable))
+ (NSString *)storyBadrdID {
    //默认就是类名
    return NSStringFromClass([self class]);
}

+ (NSString *)storyBadrdName {
    return nil;
}

#pragma mark - -- Attach --


+ (UIImage *)imageWithFullColorInSize:(CGSize)size AndColor:(UIColor*)color{
    UIGraphicsBeginImageContextWithOptions(size, 0, 1.0);
    [color set];
    UIRectFill(CGRectMake(0, 0, size.width, size.height));
    UIImage *pressedColorImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return pressedColorImg;
}

+ (CGSize)getLabelWithSize:(NSString*)string width:(CGFloat)width font:(UIFont *)font limit:(CGSize)limitSize
{
    CGSize size;
    if (string == nil || string.length == 0) {
        size = CGSizeMake(0, 0);
        if (size.height < limitSize.width) {
            size = CGSizeMake(size.width, limitSize.width);
        }
    }else{
        size = [WTBaseViewController getLabelSizeForString:string width:width font:font limitHeight:CGPointMake(limitSize.width, limitSize.height)];
    }
    return size;
}

+ (CGSize)getLabelSizeForString:(NSString*)string width:(CGFloat)width font:(UIFont *)font limitHeight:(CGPoint)limit
{
    CGSize size = CGSizeZero;
    if (string == nil || string.length == 0) {
        
    }
    else{
        NSDictionary *attribute = @{NSFontAttributeName:font};
        size = [string boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading  attributes:attribute context:nil].size;
    }
    if (limit.y > 0) {
        if (size.height < limit.x) {
            size = CGSizeMake(size.width, limit.x);
        }
        if (size.height > limit.y) {
            size = CGSizeMake(size.width, limit.y);
        }
    }
    return size;
}

@end
