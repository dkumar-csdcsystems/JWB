//
//  ServerResponse.m
//  JWBNative
//
//  Created by CSDC on 6/3/14.
//  Copyright (c) 2014 CSDC. All rights reserved.
//

#import "ServerResponse.h"
#import "JsonHelper.h"
#import "LocalStoreHelper.h"


@implementation ServerResponse
-(NSString *)getJosnString{
    NSError* error;
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                [NSString stringWithFormat:@"%d", self.Status], @"Status",
                                self.Error, @"Error",
                                self.Response, @"Response",
                                self.methodName, @"methodName", nil];
    NSString *jsonString = [JsonHelper toJsonString:dictionary error:&error];
    return jsonString;
}

+(ServerResponse *)parseJson:(NSString *) jsonString{
    NSError *jsonError = nil;
    NSDictionary *dictionary = [JsonHelper toDictionary:jsonString error:&jsonError];
    ServerResponse *response = [[ServerResponse alloc] init];
    response.methodName = dictionary[@"methodName"];
    response.Response = dictionary[@"Response"];
    response.Error = dictionary[@"Error"];
    response.Status = [dictionary[@"Status"] intValue];
    return response;
}
@end
