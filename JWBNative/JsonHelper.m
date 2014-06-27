//
//  JsonHelper.m
//  JWBNative
//
//  Created by CSDC on 6/3/14.
//  Copyright (c) 2014 CSDC. All rights reserved.
//

#import "JsonHelper.h"
//#import "NSData+Base64.h"

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


+(NSString*)decodeBase64: (NSString *)base64String {
    //NSData *data = [NSData dataFromBase64String: base64String];
    //NSString *convertedString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:base64String options:0];
    NSString *decodedString = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
    //NSLog(@"%@", decodedString);
    
    return decodedString;
}


+(NSString *)encodeBase64: (NSString *)plainString{
    NSData *plainData = [plainString dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String = [plainData base64EncodedStringWithOptions:0];
    //NSLog(@"%@", base64String);
    return base64String;
}

@end
