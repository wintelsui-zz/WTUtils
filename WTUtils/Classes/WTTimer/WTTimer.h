//
//  WTTimer.h
//  SFS_Object
//
//  Created by wintelsui on 2017/9/13.
//  Copyright © 2017年 SFS. All rights reserved.
//

#import <Foundation/Foundation.h>

void wt_gcdtimer_dispatchCreateTimer(id target, double timeInterval, void (^handler)(dispatch_source_t timer))
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer =dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER,0, 0, queue);
    
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), (uint64_t)(timeInterval *NSEC_PER_SEC), 0);
    
    __weak __typeof(target) weaktarget  = target;
    dispatch_source_set_event_handler(timer, ^{
        
        if (!weaktarget)  {
            dispatch_source_cancel(timer);
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (handler) handler(timer);
            });
        }
        
    });
    dispatch_resume(timer);
}

@interface WTTimer : NSObject


@end
