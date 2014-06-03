//
//  ServiceHelper.h
//  JWBNative
//
//  Created by CSDC on 6/3/14.
//  Copyright (c) 2014 CSDC. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^RequestCompletionHandler)(NSString*, NSError*);

@interface ServiceHelper : NSObject
+(void)requestToPath:(NSString *)userId password:(NSString *)password onCompletion:(RequestCompletionHandler)complete;
+(void)sendRequest:(NSString *)path PostData: (NSDictionary *)data onCompletion:(RequestCompletionHandler)callback;
+(void)prepareAndSend:(NSString *)path PostData: (NSDictionary *)data onCompletion:(RequestCompletionHandler)callback;
@end
