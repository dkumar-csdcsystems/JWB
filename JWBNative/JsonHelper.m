//
//  JsonHelper.m
//  JWBNative
//
//  Created by CSDC on 6/3/14.
//  Copyright (c) 2014 CSDC. All rights reserved.
//

#import "JsonHelper.h"

@implementation JsonHelper

+(NSString *)toJsonString: (NSDictionary *) dictionary error:(NSError **) error{
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:0 error:error];
    NSString *resultAsString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return resultAsString;
}

+(NSDictionary *)toDictionary:(NSString *)jsonString error:(NSError **) error {
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:error];
    return dictionary;
}


@end
