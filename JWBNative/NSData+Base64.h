//
//  NSData+Base64.h
//  JWBNative
//
//  Created by CSDC on 6/27/14.
//  Copyright (c) 2014 CSDC. All rights reserved.
//

#import <Foundation/Foundation.h>

void *NewBase64Decode(
                      const char *inputBuffer,
                      size_t length,
                      size_t *outputLength);

char *NewBase64Encode(
                      const void *inputBuffer,
                      size_t length,
                      bool separateLines,
                      size_t *outputLength);

@interface NSData (Base64)

+ (NSData *)dataFromBase64String:(NSString *)aString;
- (NSString *)base64EncodedString;


- (NSString *)base64EncodedStringWithSeparateLines:(BOOL)separateLines;

@end
