//
//  NSString+Custom.h
//  CategoryDemo
//
//  Created by wangning on 15/9/15.
//  Copyright (c) 2015年 IT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*
 
 类别跟继承
 
 类别：A  1000行代码   A类的类别   500行代码
 
 轻量级  对原有类的扩充
 
 类别不能直接对原有类进行属性的扩充，但是可以间接扩充
 @property 属性
 
 
 
 
 继承：A  1000行代码
 
 重量级  继承父类一切属性与方法  相当与创建了一个新类
 
 继承  一个新类  属性随便扩充。
 
 */


@interface NSString (Custom)

//类别  也可以扩充类方法

//获得沙盒路径
+ (NSString*)getHomePath;

//获得Documents路径

+ (NSString*)getDocumentsPath;

//获取文件夹路径
+ (NSString*)getDirectoryPath:(NSString*)path;

//获取文件的路径

+ (NSString*)getFilePath:(NSString*)path;

//也可以扩充实例方法


//类别可以重写原有类的方法
//你可重写系统的方法，但是要慎用
//因为你不知道系统是调用你写的，还是系统写的。


//判断是否包含字符串
//- (BOOL)containsString:(NSString *)aString;
//
//- (BOOL)isEqualToString:(NSString *)aString;

@end

@interface UIView (A)

//- (void)addSubview:(UIView *)view;

@end

