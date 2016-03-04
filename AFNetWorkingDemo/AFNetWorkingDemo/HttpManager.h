//
//  HttpManager.h
//  AFNetWorkingDemo
//
//  Created by student on 16/3/2.
//  Copyright © 2016年 student. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlock)(id respoinseObject);
typedef void(^FailureBlock)(NSError *error);

@interface HttpManager : NSObject

+ (void)GETRequestSuccess:(SuccessBlock)success
                  failure:(FailureBlock)failure;


+ (void)POSTRequestSuccess:(SuccessBlock)success
                   failure:(FailureBlock)failure;

+ (void)upload:(NSString *)token;

+ (void)getMes:(NSString *)token;

+ (void)getFriendList:(NSString *)token;

+ (void)exit:(NSString *)token;

@end
