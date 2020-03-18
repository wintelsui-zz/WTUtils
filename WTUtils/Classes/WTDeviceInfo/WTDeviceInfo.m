//
//  WTDeviceInfo.m
//  SFS_Object
//
//  Created by wintelsui on 2017/9/13.
//  Copyright © 2017年 SFS. All rights reserved.
//

#import "WTDeviceInfo.h"

#import <sys/utsname.h>

@implementation WTDeviceInfo

+ (NSString *)devicMachineCode
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *code = [NSString stringWithCString:systemInfo.machine
                                        encoding:NSUTF8StringEncoding];
    
    return code;
}

@end
