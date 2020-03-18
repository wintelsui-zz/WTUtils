//
//  WTViewController.m
//  WTUtils
//
//  Created by wintelsui on 03/16/2020.
//  Copyright (c) 2020 wintelsui. All rights reserved.
//

#import "WTViewController.h"

#import <WTUtils/WTUtils.h>

@interface WTViewController ()

@end

@implementation WTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    wt_gcdtimer_dispatchCreateTimer(self, 1, ^(dispatch_source_t timer) {
        
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
