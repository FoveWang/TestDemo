//
//  HttpManager.m
//  AFNetWorkingDemo
//
//  Created by student on 16/3/2.
//  Copyright © 2016年 student. All rights reserved.
//

#import "HttpManager.h"
#import "AFNetworking.h"
#import "NSData+Base64.h"

#define BASEURL @"http://172.16.11.158:8080/api/"


@implementation HttpManager

+ (void)GETRequestSuccess:(SuccessBlock)success
                  failure:(FailureBlock)failure{
    
    NSString *str = @"http://wthrcdn.etouch.cn/weather_mini?city=北京";
    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    
//    [manager GET:str parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//    }];
    
    str = [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSLog(@"%@",str);
    
    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
//    
//    
//    
//    [manager GET:str parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
//        
//        if (success) {
//            success(responseObject);
//        }
//        
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        
//        if (failure) {
//            failure(error);
//        }
//        
//    }];
    
    [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:str parameters:nil error:nil];
    
}


+ (void)POSTRequestSuccess:(SuccessBlock)success
                   failure:(FailureBlock)failure {
    
    NSString *str = [NSString stringWithFormat:@"%@login",BASEURL];
    
    NSString *name = @"ceshiBylwx";
    
    NSString *password = @"123";
    
    NSString *str1 = [[name dataUsingEncoding:NSUTF8StringEncoding] base64EncodedString];
    
    NSString *str2 = [[password dataUsingEncoding:NSUTF8StringEncoding] base64EncodedString];
    
    
//    NSDictionary *user = ;

    NSDictionary *dic = @{@"flag":@1, @"user": @{@"Name":str1,@"Password":str2}};
    

    
    NSLog(@"%@",dic);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    [manager POST:str parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];

    
    
    
}

+ (void)upload:(NSString *)token {
    
    
    NSString *urlStr = [NSString stringWithFormat:@"%@upload?token=",BASEURL];
    
//    NSString *token = @"Y2VzaGlCeWx3eCAxMjMgMjAxNi0wMy0wMiAyMDoyODoxOA==";
    
//    NSString *newToken = [[token dataUsingEncoding:NSUTF8StringEncoding] base64EncodedString];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
//    NSLog(@"%@",dic);
    
//    urlStr = [NSString stringWithFormat:@"%@%@",urlStr,newToken];
    
    NSLog(@"%@",urlStr);
    
    [manager POST:urlStr parameters:@{@"token":token} constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        for (NSInteger i = 0; i < 10; i++) {
            
            NSString *string = [NSString stringWithFormat:@"%ld.png",i];
            
            
//            NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:string ofType:@"png"]];
            
//            [formData appendPartWithFileData:data name:@"file" fileName:[NSString stringWithFormat:@"lwx%@.jpg",string] mimeType:@"image/png"];
//            [formData appendPartWithFormData:data name:@"file"];
            
            NSURL *url = [[NSBundle mainBundle] URLForResource:string withExtension:nil];
            [formData appendPartWithFileURL:url name:@"file" fileName:[NSString stringWithFormat:@"lwxlwx%@",string] mimeType:@"asd" error:nil];
        }



        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//               NSDictionary *dic = responseObject;
//        
//               NSLog(@"%@",dic.description);
        
               NSError *error = nil;
        
               NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:(NSData*)responseObject options:NSJSONReadingAllowFragments error:&error];
//
               NSLog(@"%@---------%@",error,dic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
               NSLog(@"%@",error);
    }];

//    [manager POST:urlStr parameters:@{@"token":token} constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//       
//
//       // 单张图片上传
////       NSURL    * fileURL = [[NSBundle mainBundle] URLForResource:@"1.png" withExtension:nil];
////       
////       [formData appendPartWithFileURL:fileURL name:@"1.png" error:nil];
//       NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"2" ofType:@"jpg"]];
//       
//       [formData appendPartWithFileData:data name:@"header" fileName:@"2" mimeType:@"image/jpg"];
////       [formData appendPartWithFormData:data name:@"header.jpg"];
//       
//   } success:^(NSURLSessionDataTask *task, id responseObject) {
//       
////       NSDictionary *dic = responseObject;
////
////       NSLog(@"%@",dic.description);
//       
//       NSError *error = nil;
//       
//       NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:(NSData*)responseObject options:NSJSONReadingMutableContainers error:&error];
//       
//       NSLog(@"%@---------%@",error,dic);
//       
//   } failure:^(NSURLSessionDataTask *task, NSError *error) {
//       NSLog(@"%@",error);
//   }];


}


+ (void)getMes:(NSString *)token {
    
    NSString *url = [NSString stringWithFormat:@"%@update/userinfo",BASEURL];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    

    [manager POST:url parameters:@{@"token":token} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
}



+ (void)getFriendList:(NSString *)token {
    NSString *url = [NSString stringWithFormat:@"%@friends?token=",BASEURL];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    [manager POST:url parameters:@{@"token":token} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}


+ (void)exit:(NSString *)token {
    NSString *url = [NSString stringWithFormat:@"%@exit?token=",BASEURL];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    [manager POST:url parameters:@{@"token":token} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

@end
