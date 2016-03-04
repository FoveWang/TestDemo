//
//  NSString+Addition.h
//  CategoryDemo
//
//  Created by wangning on 15/11/4.
//  Copyright (c) 2015年 IT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Addition)


//类别不仅能扩充实例方法，还可以扩充类方法

//- (BOOL)containsString:(NSString *)aString;

//沙盒地址
+ (NSString*)getHomePath;

+ (NSString*)getDocmentsPath;


+ (NSString*)getDirectoryWithPath:(NSString*)path;


+ (NSString*)getFileWithPath:(NSString*)path;

+ (float)getDocumentsFileSize;


@end
