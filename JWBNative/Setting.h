//
//  Setting.h
//  JWBNative
//
//  Created by CSDC on 6/3/14.
//  Copyright (c) 2014 CSDC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Setting : NSObject
@property (strong, nonatomic) NSString* ServiceUrl;
@property (strong, nonatomic) NSString* ConnectionCache;

-(NSString *)getJosnString;
+(Setting *)parseJson: (NSString *) jsonString;
+(Setting *)getPreference;
@end
