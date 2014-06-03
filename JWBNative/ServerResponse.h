//
//  ServerResponse.h
//  JWBNative
//
//  Created by CSDC on 6/3/14.
//  Copyright (c) 2014 CSDC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServerResponse : NSObject

@property (nonatomic) int Status;
@property (nonatomic) NSString* Error;
@property (nonatomic) NSString* Response;
@property (nonatomic) NSString* methodName;

-(NSString *)getJosnString;
+(ServerResponse *)parseJson: (NSString *) jsonString;

@end
