//
//  ViewController.m
//  AFNetWorkingDemo
//
//  Created by student on 16/3/2.
//  Copyright © 2016年 student. All rights reserved.
//

#import "ViewController.h"

#import "HttpManager.h"



@interface ViewController ()

@property (nonatomic, copy) NSString *token;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSArray *array = @[@"注册",@"登录",@"上传图片",@"信息",@"好友列表",@"退出"];
    
    
    for (NSInteger i = 0; i < 6; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [button setTitle:array[i] forState:UIControlStateNormal];
        
        button.frame = CGRectMake(100 + i/3 * 150, 200 + i%3 * 150, 100, 80);
        button.backgroundColor = [UIColor redColor];
        button.tag = i;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:button];
    }
    

    
}


- (void)buttonClick:(UIButton *)sender {
    
    NSLog(@"%ld",sender.tag);
    
    switch (sender.tag) {
        case 0:{

            
        
            break;
        }
        case 1:{
            [HttpManager POSTRequestSuccess:^(id respoinseObject) {
                
                NSDictionary *dic = (NSDictionary *)respoinseObject;
                
                NSLog(@"%@",dic.description);
                
                self.token = dic[@"Token"];
                
            } failure:^(NSError *error) {
                
                NSLog(@"%@",error);
            }];
            
            break;
        }
        case 2:{
                [HttpManager upload:self.token];
            
            break;
        }
        case 3:{
            [HttpManager getMes:self.token];
            
            break;
        }
        case 4:{
            
            [HttpManager getFriendList:self.token];
            
            break;
        }
        case 5:{
            
            [HttpManager exit:self.token];
            
            break;
        }
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
