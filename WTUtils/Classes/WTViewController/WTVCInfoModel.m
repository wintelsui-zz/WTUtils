//
//  WTVCInfoModel.m
//
//  Created by wintel sui on 2018/7/5
//  Copyright (c) 2018 Chinasofti. All rights reserved.
//

#import "WTVCInfoModel.h"


NSString *const kWTVCInfoModelStoryboardID = @"storyboardID";
NSString *const kWTVCInfoModelClassname = @"classname";
NSString *const kWTVCInfoModelStoryboard = @"storyboard";
NSString *const kWTVCInfoModelNavigation = @"navigation";
NSString *const kWTVCInfoModelNavigationstoryboardID = @"navigationstoryboardID";
NSString *const kWTVCInfoModelRestorationID = @"restorationID";
NSString *const kWTVCInfoModelNavigationrestorationID = @"navigationrestorationID";


@interface WTVCInfoModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WTVCInfoModel

@synthesize storyboardID = _storyboardID;
@synthesize classname = _classname;
@synthesize storyboard = _storyboard;
@synthesize navigation = _navigation;
@synthesize navigationstoryboardID = _navigationstoryboardID;
@synthesize restorationID = _restorationID;
@synthesize navigationrestorationID = _navigationrestorationID;


+ (BOOL)checkDictionary:(NSDictionary *)dict{
    if (dict != nil && [dict count]) {
        NSString *classname = [dict objectForKey:kWTVCInfoModelClassname];
        NSString *storyboardID = [dict objectForKey:kWTVCInfoModelStoryboardID];
        NSString *storyboard = [dict objectForKey:kWTVCInfoModelStoryboard];
        
        if (classname != nil && classname.length > 0) {
            if (storyboardID != nil && storyboard != nil) {
                if (storyboardID.length > 0 && storyboard.length > 0) {
                    return YES;
                }
            }else if ((storyboardID == nil || storyboardID.length == 0) && (storyboard == nil || storyboard.length == 0 )) {
                return YES;
            }
        }
        
        
    }
    
    return NO;
}

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    if ([WTVCInfoModel checkDictionary:dict] == NO) {return nil;}
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if ([WTVCInfoModel checkDictionary:dict] == NO) {return nil;}
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.storyboardID = [self objectOrNilForKey:kWTVCInfoModelStoryboardID fromDictionary:dict];
            self.classname = [self objectOrNilForKey:kWTVCInfoModelClassname fromDictionary:dict];
            self.storyboard = [self objectOrNilForKey:kWTVCInfoModelStoryboard fromDictionary:dict];
            self.navigation = [self objectOrNilForKey:kWTVCInfoModelNavigation fromDictionary:dict];
            self.navigationstoryboardID = [self objectOrNilForKey:kWTVCInfoModelNavigationstoryboardID fromDictionary:dict];
            self.restorationID = [self objectOrNilForKey:kWTVCInfoModelRestorationID fromDictionary:dict];
            self.navigationrestorationID = [self objectOrNilForKey:kWTVCInfoModelNavigationrestorationID fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.storyboardID forKey:kWTVCInfoModelStoryboardID];
    [mutableDict setValue:self.classname forKey:kWTVCInfoModelClassname];
    [mutableDict setValue:self.storyboard forKey:kWTVCInfoModelStoryboard];
    [mutableDict setValue:self.navigation forKey:kWTVCInfoModelNavigation];
    [mutableDict setValue:self.navigationstoryboardID forKey:kWTVCInfoModelNavigationstoryboardID];
    [mutableDict setValue:self.restorationID forKey:kWTVCInfoModelRestorationID];
    [mutableDict setValue:self.navigationrestorationID forKey:kWTVCInfoModelNavigationrestorationID];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    if (object != nil) {
        return object;
    }
    return @"";
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.storyboardID = [aDecoder decodeObjectForKey:kWTVCInfoModelStoryboardID];
    self.classname = [aDecoder decodeObjectForKey:kWTVCInfoModelClassname];
    self.storyboard = [aDecoder decodeObjectForKey:kWTVCInfoModelStoryboard];
    self.navigation = [aDecoder decodeObjectForKey:kWTVCInfoModelNavigation];
    self.navigationstoryboardID = [aDecoder decodeObjectForKey:kWTVCInfoModelNavigationstoryboardID];
    self.restorationID = [aDecoder decodeObjectForKey:kWTVCInfoModelRestorationID];
    self.navigationrestorationID = [aDecoder decodeObjectForKey:kWTVCInfoModelNavigationrestorationID];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_storyboardID forKey:kWTVCInfoModelStoryboardID];
    [aCoder encodeObject:_classname forKey:kWTVCInfoModelClassname];
    [aCoder encodeObject:_storyboard forKey:kWTVCInfoModelStoryboard];
    [aCoder encodeObject:_navigation forKey:kWTVCInfoModelNavigation];
    [aCoder encodeObject:_navigationstoryboardID forKey:kWTVCInfoModelNavigationstoryboardID];
    [aCoder encodeObject:_restorationID forKey:kWTVCInfoModelRestorationID];
    [aCoder encodeObject:_navigationrestorationID forKey:kWTVCInfoModelNavigationrestorationID];
}

- (id)copyWithZone:(NSZone *)zone
{
    WTVCInfoModel *copy = [[WTVCInfoModel alloc] init];
    
    if (copy) {

        copy.storyboardID = [self.storyboardID copyWithZone:zone];
        copy.classname = [self.classname copyWithZone:zone];
        copy.storyboard = [self.storyboard copyWithZone:zone];
        copy.navigation = [self.navigation copyWithZone:zone];
        copy.navigationstoryboardID = [self.navigationstoryboardID copyWithZone:zone];
        copy.restorationID = [self.restorationID copyWithZone:zone];
        copy.navigationrestorationID = [self.navigationrestorationID copyWithZone:zone];
    }
    
    return copy;
}


@end
