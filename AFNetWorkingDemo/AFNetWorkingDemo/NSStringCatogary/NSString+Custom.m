//
//  NSString+Custom.m
//  CategoryDemo
//
//  Created by wangning on 15/9/15.
//  Copyright (c) 2015年 IT. All rights reserved.
//

#import "NSString+Custom.h"

@implementation NSString (Custom)

+ (NSString*)getHomePath{
    
    return NSHomeDirectory();
}

+ (NSString*)getDocumentsPath{
    
    
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
}

+ (NSString*)getDirectoryPath:(NSString*)path{
    
    //首先获取到Docments的路径
    NSString *docPath = [self getDocumentsPath];
    //拼接出来最终路径
    NSString *finalPath = [docPath stringByAppendingPathComponent:path];
    
    //文件管理类
    NSFileManager *manager = [NSFileManager defaultManager];
    
    //如果没有当前文件夹就创建一个
    if (![manager fileExistsAtPath:finalPath]) {
        
        [manager createDirectoryAtPath:finalPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return finalPath;
    
}

//此方法   文件夹名  与文件名不能相同
//+ (NSString*)getFilePath:(NSString*)path{
//    
//    //ceshi/test/1.mp4
//    //拆分传进来的路径
//    NSArray *array = [path componentsSeparatedByString:@"/"];
//    
//    //得到文件的路径  1.mp4
//    NSString *fileName = [array lastObject];
//    
//    //用空字符串替换掉文件名，得到文件夹的路径
//    //  ceshi/test/
//    NSString *directoryPath = [path stringByReplacingOccurrencesOfString:fileName withString:@""];
//    
//    
//    //调用方法  先把文件夹创建出来
//    //创建文件夹 Users/aa/Library/Developer/CoreSimulator/Devices/35DB7383-B6AF-4C99-8DA2-FC27ABD8F0AB/data/Containers/Data/Application/D3F72204-9F1D-4733-8B3A-CDE276FEA972/Documents/ceshi/test
//    NSString *finalDirectoryPath = [self getDirectoryPath:directoryPath];
//    
//    //创建文件路径
//    //Users/aa/Library/Developer/CoreSimulator/Devices/35DB7383-B6AF-4C99-8DA2-FC27ABD8F0AB/data/Containers/Data/Application/D3F72204-9F1D-4733-8B3A-CDE276FEA972/Documents/ceshi/test/1.mp4
//    NSString *filePath = [finalDirectoryPath stringByAppendingPathComponent:fileName];
//    //判断有木有此文件   如果没有  就创建出来
//    NSFileManager *manger = [NSFileManager defaultManager];
//    
//    if (![manger fileExistsAtPath:filePath]) {
//        
//        [manger createFileAtPath:filePath contents:nil attributes:nil];
//        
//    }
//    
//    return filePath;
//}
+ (NSString*)getFilePath:(NSString*)path{
    
    //nihao/ceshi/test.mp4//
    NSArray *array = [path componentsSeparatedByString:@"/"];
    // 此方法只能 处理多加了一个“/”
    
//    if ([fileName isEqualToString:@""]) {
//
//        fileName = [array objectAtIndex:array.count - 2];
//    }
    
    
    //创建一个可变数组
    NSMutableArray *arr = [NSMutableArray arrayWithArray:array];
    //把空字符串移除掉
    [arr removeObject:@""];
    //取最后一个值  就是fileName
    NSString *fileName = [arr lastObject];
    
    //得到fileName的 range
    NSRange range = [path rangeOfString:fileName options:NSBackwardsSearch];
    
    //用空字符串替换掉文件名
    NSString *directoryPath = [path stringByReplacingCharactersInRange:range withString:@""];
    
    NSString *finalDirectoryPath = [self getDirectoryPath:directoryPath];
    
    
    NSString *filePath = [finalDirectoryPath stringByAppendingPathComponent:fileName];
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    if (![manager fileExistsAtPath:filePath]) {
        
        [manager createFileAtPath:filePath contents:nil attributes:nil];
        
    }
    
    
    return filePath;
    
    
    
//    
//    NSRange range = [path rangeOfString:fileName];

    
    return @"123";
    
    
    
}

//- (BOOL)containsString:(NSString *)aString{
//    
//    NSLog(@"我自己写的");
//    
//    return [self rangeOfString:aString].length == 0;
//}
//
//- (BOOL)isEqualToString:(NSString *)aString{
//    
//    NSLog(@"还是我自己写的");
//    
//    return YES;
//}

@end


@implementation UIView (A)

//- (void)addSubview:(UIView *)view{
//    
//    NSLog(@"dsbhkfbfjkdb");
//}

@end
