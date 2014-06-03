//
//  LocalStoreHelper.h
//  JWBNative
//
//  Created by CSDC on 6/3/14.
//  Copyright (c) 2014 CSDC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocalStoreHelper : NSObject
+(BOOL)savePreferences:(NSString *)key data: (NSString *) data;
+(NSString *)getSavedData: (NSString *)key;
@end
