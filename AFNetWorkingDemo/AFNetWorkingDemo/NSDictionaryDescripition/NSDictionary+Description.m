//
//  NSDictionary+Description.m
//  AFNetWorkingDemo
//
//  Created by student on 16/3/2.
//  Copyright © 2016年 student. All rights reserved.
//

#import "NSDictionary+Description.h"

@implementation NSDictionary (Description)

- (NSString*)description{
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
    
    NSString *string = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    return string;
}

@end
