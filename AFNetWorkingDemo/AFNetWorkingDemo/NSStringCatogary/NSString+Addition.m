//
//  NSString+Addition.m
//  CategoryDemo
//
//  Created by wangning on 15/11/4.
//  Copyright (c) 2015年 IT. All rights reserved.
//

#import "NSString+Addition.h"

@implementation NSString (Addition)

//- (BOOL)containsString:(NSString *)aString{
//    
//    return NO;
//}

+ (NSString*)getHomePath{

    return NSHomeDirectory();
}


+ (NSString*)getDocmentsPath{
    
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
}

+ (NSString*)getDirectoryWithPath:(NSString*)path{
    
    
    NSString *directoryPath = [[self getDocmentsPath] stringByAppendingPathComponent:path];
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    //判断文件夹是否存在  如果不存在 就创建  最后再把该路径return出去
    
    if (![manager fileExistsAtPath:directoryPath]) {
        
        
        [manager createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:nil];
        
    }
    
    return directoryPath;

}


//该方法   文件件与文件不能同名
//+ (NSString*)getFileWithPath:(NSString*)path{
//    //path   d/e/f
//    
//    NSArray *array = [path componentsSeparatedByString:@"/"];
//    
//    // f
//    NSString *fileName = [array lastObject];
//    
//    // d/e/
//    NSString *directory = [path stringByReplacingOccurrencesOfString:fileName withString:@""];
//    
//    //    /Users/aa/Library/Developer/CoreSimulator/Devices/35DB7383-B6AF-4C99-8DA2-FC27ABD8F0AB/data/Containers/Data/Application/1A7DCD6D-634A-44ED-96B5-D0B09478E23D/Documents/d/e
//
//    NSString *directoryPath = [self getDirectoryWithPath:directory];
//    
//    //    /Users/aa/Library/Developer/CoreSimulator/Devices/35DB7383-B6AF-4C99-8DA2-FC27ABD8F0AB/data/Containers/Data/Application/1A7DCD6D-634A-44ED-96B5-D0B09478E23D/Documents/d/e/f
//    NSString *filePath = [directoryPath stringByAppendingPathComponent:fileName];
//    
//    NSFileManager *manager = [NSFileManager defaultManager];
//    
//    if (![manager fileExistsAtPath:filePath]) {
//        
//        [manager createFileAtPath:filePath contents:nil attributes:nil];
//        
//    }
//    
//    
//    return filePath;
//}

+ (NSString*)getFileWithPath:(NSString *)path{
    
    
    // d/f/f/f/f/f/f
    NSArray *array = [path componentsSeparatedByString:@"/"];
    
    NSMutableArray *arr = [NSMutableArray arrayWithArray:array];
    
    [arr removeObject:@""];
    
    NSString *fileName = [arr lastObject];
    
    
    //defff
    NSRange range = [path rangeOfString:fileName options:NSBackwardsSearch];
    
    //
    NSString *directory = [path stringByReplacingCharactersInRange:range withString:@""];
    
    NSString *directoryPath = [self getDirectoryWithPath:directory];
    
    NSString *filePath = [directoryPath stringByAppendingPathComponent:fileName];
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    if (![manager fileExistsAtPath:filePath]) {
        
        [manager createFileAtPath:filePath contents:nil attributes:nil];
    }
    
    return filePath;
}

+ (float)getDocumentsFileSize{
    
    
    NSString *docmentsPath = [self getDocmentsPath];
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    NSDictionary *dic = [manager attributesOfItemAtPath:docmentsPath error:nil];
    
    long long fileSize = [dic[NSFileSize] longLongValue];
    
    float size = (float)fileSize/(1024*1024);
    
    return size;
    
}


@end
