//
//  WTDeviceInfo.h
//  SFS_Object
//
//  Created by wintelsui on 2017/9/13.
//  Copyright © 2017年 SFS. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 #if targetEnvironment(macCatalyst)
 
 #endif
 */


#define DEVICE_SYSTEM_VERSION   ([[UIDevice currentDevice].systemVersion floatValue])
#define DEVICE_MODEL            ([UIDevice currentDevice].model)
//#define APP_MacCatalystMode     [WTDeviceInfo macCatalystMode]

#define IS_IPAD     (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA   ([[UIScreen mainScreen] scale] > 1.0)

#define SCREEN_WIDTH        ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT       ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH   (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH   (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define UISCREEN_CAN_CURRENTMODE  [UIScreen instancesRespondToSelector:@selector(currentMode)]
#define UISCREEN_CURRENTMODE_SIZE ([[UIScreen mainScreen] currentMode].size)

#define IPHONE_4_OR_LESS    (UISCREEN_CAN_CURRENTMODE ? CGSizeEqualToSize(CGSizeMake(640, 960), UISCREEN_CURRENTMODE_SIZE) : (SCREEN_MAX_LENGTH < 568.0))
#define IPHONE_5            (UISCREEN_CAN_CURRENTMODE ? CGSizeEqualToSize(CGSizeMake(640, 1136), UISCREEN_CURRENTMODE_SIZE) : (SCREEN_MAX_LENGTH == 568.0))
#define IPHONE_6            (UISCREEN_CAN_CURRENTMODE ? CGSizeEqualToSize(CGSizeMake(750, 1334), UISCREEN_CURRENTMODE_SIZE) : (SCREEN_MAX_LENGTH == 667.0))
#define IPHONE_6P_STANDARD  (UISCREEN_CAN_CURRENTMODE ? CGSizeEqualToSize(CGSizeMake(1242, 2208), UISCREEN_CURRENTMODE_SIZE) : (SCREEN_MAX_LENGTH == 736.0))
#define IPHONE_6P_ZOOM      (UISCREEN_CAN_CURRENTMODE ? CGSizeEqualToSize(CGSizeMake(1125, 2001), UISCREEN_CURRENTMODE_SIZE) : NO)
#define IPHONE_6P           (IPHONE_6P_STANDARD || IPHONE_6P_ZOOM)


#define IPHONE_XR           (UISCREEN_CAN_CURRENTMODE ? CGSizeEqualToSize(CGSizeMake(828, 1792), UISCREEN_CURRENTMODE_SIZE) : (SCREEN_MAX_LENGTH == 896.0))
#define IPHONE_XS           (UISCREEN_CAN_CURRENTMODE ? CGSizeEqualToSize(CGSizeMake(1125, 2436), UISCREEN_CURRENTMODE_SIZE) : (SCREEN_MAX_LENGTH == 812.0))
#define IPHONE_XSMax_STANDARD (UISCREEN_CAN_CURRENTMODE ? CGSizeEqualToSize(CGSizeMake(1242, 2688), UISCREEN_CURRENTMODE_SIZE) : (SCREEN_MAX_LENGTH == 896.0))
#define IPHONE_XSMax_Zoom   (UISCREEN_CAN_CURRENTMODE ? CGSizeEqualToSize(CGSizeMake(1125, 2436), UISCREEN_CURRENTMODE_SIZE) : NO)
#define IPHONE_XSMax        (IPHONE_XSMax_STANDARD || IPHONE_XSMax_Zoom)

#define IPHONE_12M_STANDARD           (UISCREEN_CAN_CURRENTMODE ? CGSizeEqualToSize(CGSizeMake(1080, 2340), UISCREEN_CURRENTMODE_SIZE) : (SCREEN_MAX_LENGTH == 780.0))
#define IPHONE_12_STANDARD           (UISCREEN_CAN_CURRENTMODE ? CGSizeEqualToSize(CGSizeMake(1170, 2532), UISCREEN_CURRENTMODE_SIZE) : (SCREEN_MAX_LENGTH == 844.0))
#define IPHONE_12PM_STANDARD           (UISCREEN_CAN_CURRENTMODE ? CGSizeEqualToSize(CGSizeMake(1284, 2778), UISCREEN_CURRENTMODE_SIZE) : (SCREEN_MAX_LENGTH == 926.0))

#define IPHONE_X            (IPHONE_XS || IPHONE_XSMax || IPHONE_XR || IPHONE_12M_STANDARD || IPHONE_12_STANDARD || IPHONE_12PM_STANDARD)
#define IPHONE_XSeries      IPHONE_X
#define IPHONE_NotXSeries   (IPHONE_4_OR_LESS || IPHONE_5 || IPHONE_6 || IPHONE_6P)

#define IPHONEX_HEIGHT_SAFE_BOTTOM_VERTICAL  (IPHONE_NotXSeries ? 0 : 34)
#define IPHONEX_HEIGHT_SAFE_BOTTOM_LANDSCAPE (IPHONE_NotXSeries ? 0 : 21)
#define IPHONE_HEIGHT_STATUSBAR              (IPHONE_NotXSeries ? 20 : 44)

#define IPHONE_HEIGHT_STATUSBAR_RealTime ([UIApplication sharedApplication].statusBarFrame.size.height)


//iphonex 安全区域大小
#define IPHONEX_SAFE_AREA_SPACE_TOP_LANDSCAPE       (0)
#define IPHONEX_SAFE_AREA_SPACE_LEFT_LANDSCAPE      (IPHONE_NotXSeries ? 0 : 44)
#define IPHONEX_SAFE_AREA_SPACE_BOTTOM_LANDSCAPE    (IPHONE_NotXSeries ? 0 : 21)
#define IPHONEX_SAFE_AREA_SPACE_RIGHT_LANDSCAPE     (IPHONE_NotXSeries ? 0 : 44)

#define IPHONEX_SAFE_AREA_SPACE_TOP_VERTICAL        (IPHONE_NotXSeries ? 0 : 44)
#define IPHONEX_SAFE_AREA_SPACE_LEFT_VERTICAL       (0)
#define IPHONEX_SAFE_AREA_SPACE_BOTTOM_VERTICAL     (IPHONE_NotXSeries ? 0 : 34)
#define IPHONEX_SAFE_AREA_SPACE_RIGHT_VERTICAL      (0)

@interface WTDeviceInfo : NSObject


/**
 获取机器设备码

 @return 机器设备码（iPhone9,2）
 */
+ (NSString *)devicMachineCode;

//+ (BOOL)macCatalystMode;

@end
