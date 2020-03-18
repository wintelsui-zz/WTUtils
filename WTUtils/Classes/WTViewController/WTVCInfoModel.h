//
//  WTVCInfoModel.h
//
//  Created by wintel sui on 2018/7/5
//  Copyright (c) 2018 Chinasofti. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface WTVCInfoModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *storyboardID;
@property (nonatomic, strong) NSString *classname;
@property (nonatomic, strong) NSString *storyboard;
@property (nonatomic, strong) NSString *navigation;
@property (nonatomic, strong) NSString *navigationstoryboardID;
@property (nonatomic, strong) NSString *restorationID;
@property (nonatomic, strong) NSString *navigationrestorationID;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
