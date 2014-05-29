//
//  ViewController.m
//  VCareServerURLTest
//
//  Created by 马远征 on 14-5-29.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "SDHttpRequest.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

//    [[SDHttpRequest sharedInstance]requestLogin:@"myz1104@126.com"
//                                       passWord:@"123qwe"
//                                         verify:@"231540"
//                                        success:^(id responseObject) {
//        
//                                           
//                                            
//    } failture:^(NSError *error) {
//        
//    }];
    
//    [[SDHttpRequest sharedInstance]requestUpdate:@"fd13836b974f46ae918fcfcf5a04c5f8" oldPwd:@"123qwe" password:@"qwe123" nickname:@"mayz" gender:@"men" success:^(id responseObject) {
//        
//    } failture:^(NSError *error) {
//        
//    }];
//
//    
//    return;
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:@"额头",@"n",
                          @"38.5",@"w",@"16.8",@"o",@"2014-05-29 17:46:43",@"d",@"",@"tm",@"",@"om", nil];
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:@"鼻子",@"n",
                          @"37.5",@"w",@"16.7",@"o",@"2014-05-29 17:45:45",@"d",@"",@"tm",@"",@"om", nil];
    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:@"脸蛋",@"n",
                          @"36.5",@"w",@"16.5",@"o",@"2014-05-29 17:49:47",@"d",@"",@"tm",@"",@"om", nil];
//    NSLog(@"-dic1-%@",dic1);
    NSArray *pArray = [NSArray arrayWithObjects:dic1,dic2,dic3, nil];
    
    NSDictionary *pDic = [NSDictionary dictionaryWithObjectsAndKeys:@"12",@"i",@"",@"sn",@"98",@"s",@"2014-05-29 18:22:40",@"d",pArray,@"p", nil];
    NSArray *paramsArray = [NSArray arrayWithObjects:pDic, nil];
    [[SDHttpRequest sharedInstance]requestUploadData:@"fd13836b974f46ae918fcfcf5a04c5f8"
                                              params:paramsArray
                                             success:^(id responseObject) {
        
    } failture:^(NSError *error) {
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
