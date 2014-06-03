//
//  LocalStoreHelper.m
//  JWBNative
//
//  Created by CSDC on 6/3/14.
//  Copyright (c) 2014 CSDC. All rights reserved.
//

#import "LocalStoreHelper.h"

@implementation LocalStoreHelper

+(BOOL)savePreferences:(NSString *)key data: (NSString *) data{

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setValue:data forKey:key];
    return true;
}


+(NSString *)getSavedData: (NSString *)key{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *data = [userDefaults stringForKey:key];
    return data;
}

@end
