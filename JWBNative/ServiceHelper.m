//
//  ServiceHelper.m
//  JWBNative
//
//  Created by CSDC on 6/3/14.
//  Copyright (c) 2014 CSDC. All rights reserved.
//

#import "ServiceHelper.h"
#import "JsonHelper.h"

@interface ServiceHelper()
+(NSData*)encodeDictionary:(NSDictionary*)dictionary;
@end

@implementation ServiceHelper

+(void)requestToPath:(NSString *)userId password:(NSString *)password onCompletion:(RequestCompletionHandler)complete{
    NSString *path = @"http://192.168.50.13:8080/axis/MobileSync6/logon.jsp" ;
    NSOperationQueue *backgroundQueue = [[NSOperationQueue alloc] init];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]
                                    initWithURL:[NSURL URLWithString:path]
                                    cachePolicy:NSURLCacheStorageAllowedInMemoryOnly
                                    timeoutInterval:10];
    
    [request setHTTPMethod: @"POST"];
    //NSString *postData = [NSString stringWithFormat:@"CC=msdev_qa&UN=%@&PW=%@&FM=json", userId, password];
    [request setValue:@"msdev_qa" forKey:@"CC"];
    [request setValue:userId forKey:@"UN"];
    [request setValue:password forKey:@"PW"];
    [request setValue:@"json" forKey:@"FM"];
    
    //[request setHTTPBody:[postData dataUsingEncoding:NSUTF8StringEncoding]];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:backgroundQueue
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
                               NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                               if(complete) complete(result, error);
                           }];
}

+(void)sendRequest:(NSString *)path PostData:(NSDictionary *)data onCompletion:(RequestCompletionHandler)callback {
    NSData *postData = [ServiceHelper encodeDictionary:data];
    NSOperationQueue *backgroundQueue = [[NSOperationQueue alloc] init];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]
                                    initWithURL:[NSURL URLWithString:path]
                                    cachePolicy:NSURLCacheStorageAllowedInMemoryOnly
                                    timeoutInterval:10];
    
    [request setHTTPMethod:@"POST"];
    //[request setValue:[NSString stringWithFormat:@"%d", postData.length] forHTTPHeaderField:@"Content-Length"];
    //[request setValue:@"application/x-www-form-urlencoded charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    [NSURLConnection
     sendAsynchronousRequest:request
     queue:backgroundQueue
     completionHandler:^(NSURLResponse *response, NSData *responsedata, NSError *error){
         NSString *result = [[NSString alloc] initWithData:responsedata encoding:NSUTF8StringEncoding];
         if(callback) callback(result, error);
     }];
}


+(void)prepareAndSend:(NSString *)path PostData: (NSDictionary *)data onCompletion:(RequestCompletionHandler)callback{
    NSError *error = nil;
    NSString *jsonString = [JsonHelper toJsonString:data error:&error];
    if(jsonString && !error){
        NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                    jsonString,@"requestJSON", nil];
        [ServiceHelper sendRequest:path PostData:dictionary onCompletion:callback];
    }else {
        NSLog(@"%@", error);
    }
}


+(NSData*)encodeDictionary:(NSDictionary*)dictionary {
    NSMutableArray *parts = [[NSMutableArray alloc] init];
    for (NSString *key in dictionary) {
        NSString *encodedValue = [[dictionary objectForKey:key] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *encodedKey = [key stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *part = [NSString stringWithFormat: @"%@=%@", encodedKey, encodedValue];
        [parts addObject:part];
    }
    NSString *encodedDictionary = [parts componentsJoinedByString:@"&"];
    return [encodedDictionary dataUsingEncoding:NSUTF8StringEncoding];
    //return encodedDictionary;
}

@end
