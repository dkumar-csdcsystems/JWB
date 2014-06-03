//
//  Setting.m
//  JWBNative
//
//  Created by CSDC on 6/3/14.
//  Copyright (c) 2014 CSDC. All rights reserved.
//

#import "Setting.h"
#import "JsonHelper.h"
#import "LocalStoreHelper.h"

@implementation Setting


-(NSString *)getJosnString{
    NSError* error;
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                self.ConnectionCache, @"ConnectionCache",
                                self.ServiceUrl, @"ServiceUrl", nil];
    NSString *jsonString = [JsonHelper toJsonString:dictionary error:&error];
    return jsonString;
}

+(Setting *)parseJson:(NSString *) jsonString{
    NSError *jsonError = nil;
    NSDictionary *dictionary = [JsonHelper toDictionary:jsonString error:&jsonError];
    Setting *setting = [[Setting alloc] init];
    setting.ConnectionCache = dictionary[@"ConnectionCache"];
    setting.ServiceUrl = dictionary[@"ServiceUrl"];
    return setting;
}

+ (Setting *)getPreference {
    NSString *jsonString = [LocalStoreHelper getSavedData:@"Setting"];
    if(jsonString != nil){
        return [Setting parseJson:jsonString];
    }
    return nil;
}

@end
