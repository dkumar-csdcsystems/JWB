//
//  JsonHelper.h
//  JWBNative
//
//  Created by CSDC on 6/3/14.
//  Copyright (c) 2014 CSDC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonHelper : NSObject

+(NSString *)toJsonString: (NSDictionary *) dictionary error:(NSError **) error;
+(NSDictionary*)toDictionary: (NSString *)jsonString error:(NSError **)error;

@end
