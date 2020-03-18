//
//  WTVCManager.m
//  neets
//
//  Created by wintel on 2018/7/5.
//  Copyright © 2018年 chinasofti. All rights reserved.
//

#import "WTVCManager.h"
#import <objc/runtime.h>

#import "WTVCInfoModel.h"

static WTVCManager * _instance;

@interface WTVCManager ()
{
    NSDictionary *_vcDic;
}

@property (nonatomic, copy) NSString *plistFilePath;

@end

@implementation WTVCManager

+ (instancetype)manager{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _instance = [[[self class] alloc] init];
        
    });
    return _instance;
}

- (void)setPlistFilePath:(NSString *)plistFilePath{
    _plistFilePath = plistFilePath;
}

- (NSDictionary *)getVCDic{
    if (_vcDic == nil) {
        if (_plistFilePath != nil && _plistFilePath.length > 0) {
            NSDictionary *dictmp = [NSDictionary dictionaryWithContentsOfFile:_plistFilePath];
            NSMutableDictionary *dicmodel = [[NSMutableDictionary alloc] init];
            if (dictmp) {
                for (NSDictionary *info in [dictmp allValues]) {
                    WTVCInfoModel *model = [WTVCInfoModel modelObjectWithDictionary:info];
                    if (model != nil && model.classname.length > 0) {
                        [dicmodel setObject:model forKey:model.classname];
                    }
                }
            }
            _vcDic = [dicmodel copy];
            NSMutableString *allKeys = [[NSMutableString alloc] init];
            [allKeys appendString:@"\n"];
            for (NSString *key in [dictmp allKeys]) {
                NSString *info = [NSString stringWithFormat:@"#define kVCName%@ @\"%@\"",key,key];
                [allKeys appendString:info];
                [allKeys appendString:@"\n"];
            }
        }
    }
    return _vcDic;
}

+ (UIStoryboard *)storyboardByName:(NSString *)name {
    UIStoryboard *board = nil;
    if (name != nil && name.length > 0) {
        if ([name.lowercaseString isEqualToString:@"main"]) {
            board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            if (board == nil) {
                board = [UIStoryboard storyboardWithName:@"main" bundle:nil];
            }
        }else{
            board = [UIStoryboard storyboardWithName:name bundle:nil];
        }
    }
    return board;
}

+ (UIViewController *)viewControllerByName:(NSString *)name{
    if (name != nil && name.length > 0) {
        UIViewController *vc = nil;
        NSString *classname = @"";
        NSString *storyboardName = @"";
        NSString *storyboardID = @"";
        
        WTVCInfoModel *model = [[[WTVCManager manager] getVCDic] objectForKey:name];
        if (model) {
            classname = model.classname;
            storyboardName = model.storyboard;
            storyboardID = model.storyboardID;
        }else{
            classname = name;
            Class vcclass = NSClassFromString(classname);
            if (vcclass) {
                BOOL conformsToProtocol = NO;
                
                for (Class tcls = vcclass; tcls; tcls = [tcls superclass]) {
                    
                    if ((class_conformsToProtocol(tcls, @protocol(WTVCManagerProtocol)))){
                        conformsToProtocol = YES;
                        break;
                        
                    }
                }
                
                if (conformsToProtocol) {
                    storyboardName = [vcclass storyBadrdName];
                    storyboardID = [vcclass storyBadrdID];
                }
            }
        }
        
        if (classname != nil && classname.length > 0) {
            if (storyboardName != nil && storyboardName.length > 0 &&
                storyboardID != nil && storyboardID.length > 0) {
                UIStoryboard *sb = [WTVCManager storyboardByName:storyboardName];
                if (sb) {
                    vc = [sb instantiateViewControllerWithIdentifier:storyboardID];
                    return vc;
                }
            }
        }
        
        vc = [[NSClassFromString(classname) alloc] init];
        return vc;
        
    }
    return nil;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}
@end
