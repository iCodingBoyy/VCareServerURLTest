//
//  SDHttpRequest.m
//  VCareServerURLTest
//
//  Created by 马远征 on 14-5-29.
//  Copyright (c) 2014年 马远征. All rights reserved.
//

#import "SDHttpRequest.h"

@interface SDHttpRequest()
@property (nonatomic, strong) NSOperationQueue *operationQueue;
@end

@implementation SDHttpRequest

+ (instancetype)sharedInstance
{
    static dispatch_once_t pred;
    static SDHttpRequest *httpRequest = nil;
    dispatch_once(&pred, ^{ httpRequest = [[self alloc] init]; });
    return httpRequest;
}

- (NSOperationQueue*)operationQueue
{
    if (_operationQueue == nil)
    {
        _operationQueue = [[NSOperationQueue alloc]init];
    }
    return _operationQueue;
}

#pragma mark -用户注册
/*!
 * @method
 * @brief 用户注册
 * @see {@URL} /api/skin/user/register
 * @param   email 注册邮箱
 * @param   password 用户密码
 * @param   nickname 用户昵称
 * @param   gender 性别: men：男 women：女
 * @return
 */
- (void)requestRegister:(NSString*)email
               passWord:(NSString*)password
               nickName:(NSString*)nickname
                 gender:(NSString*)gender
                success:(void(^)(id responseObject))success
               failture:(void(^)(NSError *error))failture
{
    NSDictionary *parameters = @{@"email":email,@"password":password,@"nickname":nickname,@"gender":gender};
    NSString *urlString = [NSString stringWithFormat:@"%@/api/skin/user/register",baseURL];
    
    NSError *error = nil;
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer]requestWithMethod:@"POST"
                                                                                URLString:urlString
                                                                               parameters:parameters
                                                                                    error:&error];
    if (error)
    {
        failture(error);
        return;
    }
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *string = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"---string--%@",string);
        success(responseObject);
    }
                                     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                         NSLog(@"---error--%@",error);
                                         failture(error);
                                         
                                     }];
    [self.operationQueue addOperation:operation];
}

#pragma mark -登录
/*!
 * @method
 * @brief 登录
 * @see {@URL} /api/skin/user/login
 * @param  email 邮箱
 * @param  password 用户密码
 * @param  verify 验证码
 * @return
 */
- (void)requestLogin:(NSString*)email
            passWord:(NSString*)password
              verify:(NSString*)verify
             success:(void(^)(id responseObject))success
            failture:(void(^)(NSError *error))failture
{
    NSDictionary *parameters = @{@"email":email,@"password":password,@"verify":verify};
    NSString *urlString = [NSString stringWithFormat:@"%@/api/skin/user/login",baseURL];
    
    NSError *error = nil;
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer]requestWithMethod:@"POST"
                                                                                URLString:urlString
                                                                               parameters:parameters
                                                                                    error:&error];
    if (error)
    {
        failture(error);
        return;
    }
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *string = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"---string--%@",string);
        success(responseObject);
    }
                                     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                         NSLog(@"---error--%@",error);
                                         failture(error);
                                         
                                     }];
    [self.operationQueue addOperation:operation];
}

#pragma mark -获取验证码
/*!
 * @method
 * @brief 获取验证码
 * @see {@URL} /api/skin/user/verify
 * @param  email 邮箱
 * @return
 */
- (void)requestVerify:(NSString*)email
              success:(void(^)(id responseObject))success
             failture:(void(^)(NSError *error))failture
{
    NSDictionary *parameters = @{@"email":email};
    NSString *urlString = [NSString stringWithFormat:@"%@/api/skin/user/verify",baseURL];
    
    NSError *error = nil;
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer]requestWithMethod:@"POST"
                                                                                URLString:urlString
                                                                               parameters:parameters
                                                                                    error:&error];
    if (error)
    {
        failture(error);
        return;
    }
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *string = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"---string--%@",string);
        success(responseObject);
    }
                                     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                         NSLog(@"---error--%@",error);
                                         failture(error);
                                         
                                     }];
    [self.operationQueue addOperation:operation];
}

#pragma mark -注销
/*!
 * @method
 * @brief 注销
 * @see {@URL} /api/skin/user/logout
 * @param  token 用户登录的token
 * @return
 */
- (void)requestLogout:(NSString*)token
              success:(void(^)(id responseObject))success
             failture:(void(^)(NSError *error))failture
{
    NSDictionary *parameters = @{@"token":token};
    NSString *urlString = [NSString stringWithFormat:@"%@/api/skin/user/logout",baseURL];
    
    NSError *error = nil;
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer]requestWithMethod:@"POST"
                                                                                URLString:urlString
                                                                               parameters:parameters
                                                                                    error:&error];
    if (error)
    {
        failture(error);
        return;
    }
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *string = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"---string--%@",string);
        success(responseObject);
    }
                                     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                         NSLog(@"---error--%@",error);
                                         failture(error);
                                         
                                     }];
    [self.operationQueue addOperation:operation];
}

#pragma mark -修改用户信息
/*!
 * @method
 * @brief 修改用户信息
 * @see {@URL} /api/skin/user/update
 * @param  token 用户登录返回的token
 * @param  oldPwd 原始密码
 * @param  password 新密码
 * @param  nickname 用户姓名
 * @param  gender 性别
 * @return
 */
- (void)requestUpdate:(NSString*)token
               oldPwd:(NSString*)oldPwd
             password:(NSString*)password
             nickname:(NSString*)nickname
               gender:(NSString*)gender
              success:(void(^)(id responseObject))success
             failture:(void(^)(NSError *error))failture
{
    NSDictionary *parameters = @{@"token":token,@"oldPwd":oldPwd,@"password":password,@"nickname":nickname,@"gender":gender};
    NSString *urlString = [NSString stringWithFormat:@"%@/api/skin/user/update",baseURL];
    
    NSError *error = nil;
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer]requestWithMethod:@"POST"
                                                                                URLString:urlString
                                                                               parameters:parameters
                                                                                    error:&error];
    if (error)
    {
        failture(error);
        return;
    }
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *string = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"---string--%@",string);
        success(responseObject);
    }
                                     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                         NSLog(@"---error--%@",error);
                                         failture(error);
                                         
                                     }];
    [self.operationQueue addOperation:operation];
}

#pragma mark -获取用户信息
/*!
 * @method
 * @brief 获取用户信息
 * @see {@URL} /api/skin/user/getUser
 * @param  token 登录返回token
 * @return
 */
- (void)requestUserInfo:(NSString*)token
                success:(void(^)(id responseObject))success
               failture:(void(^)(NSError *error))failture
{
    NSDictionary *parameters = @{@"token":token};
    NSString *urlString = [NSString stringWithFormat:@"%@/api/skin/user/getUser",baseURL];
    
    NSError *error = nil;
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer]requestWithMethod:@"POST"
                                                                                URLString:urlString
                                                                               parameters:parameters
                                                                                    error:&error];
    if (error)
    {
        failture(error);
        return;
    }
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *string = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"---string--%@",string);
        success(responseObject);
    }
                                     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                         NSLog(@"---error--%@",error);
                                         failture(error);
                                         
                                     }];
    [self.operationQueue addOperation:operation];
}


#pragma mark -提交测试数据
/*!
 * @method
 * @brief 提交测试数据
 * @see {@URL} /api/skin/test/save
 * @param  testData 提交数据的JSON字符串，参数说明如下：
 * @param  t 登录返回token
 * @param  s 测试评分
 * @param  d 数据前段保存时间
 * @param  p 各个部位测试数据，[数组],包含的字典对象如下
 * @param  n 测试部位名称
 * @param  w 水分值
 * @param  o 油分值
 * @param  v 电压值
 * @param  d 测试时间
 * @param  tm 其他测试相关的map数据{"湿度":"32","温度":"12"}
 * @param  com 其他测试无关的先关数据{"android":"3.2","version":"2.5"}
 * @return
 */
- (void)requestUploadData:(NSString*)token
                   params:(NSArray*)params
                  success:(void(^)(id responseObject))success
                 failture:(void(^)(NSError *error))failture
{
    NSDictionary *parameters = @{@"token":token,@"testData":params};
    NSLog(@"----params--%@",parameters);
    NSString *urlString = [NSString stringWithFormat:@"%@/api/skin/test/save",baseURL];
    
    NSError *error = nil;
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer]requestWithMethod:@"POST"
                                                                                URLString:urlString
                                                                               parameters:parameters
                                                                                    error:&error];
    if (error)
    {
        failture(error);
        return;
    }
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *string = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"---string--%@",string);
        success(responseObject);
    }
                                     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                         NSLog(@"---error--%@",error);
                                         failture(error);
                                         
                                     }];
    [self.operationQueue addOperation:operation];
}

#pragma mark -查询测试数据
/*!
 * @method
 * @brief 查询测试数据
 * @see {@URL} /api/skin/test/query
 * @param  token 登录返回
 * @param  startDate 开始时间
 * @param  endDate [可选] 结束时间
 * @param  页数 最小值1，每页默认8条
 * @return
 */

- (void)requestQueryRecord:(NSString*)token
                 startDate:(NSString*)startDate
                   endDate:(NSString*)endDate
                   pageNum:(NSString*)pageNum
                   success:(void(^)(id responseObject))success
                  failture:(void(^)(NSError *error))failture
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setValue:token forKey:@"token"];
    [parameters setValue:startDate forKey:@"startDate"];
    [parameters setValue:pageNum forKey:@"pageNum"];
    if (endDate)
    {
        [parameters setValue:endDate forKey:@"endDate"];
    }
    NSString *urlString = [NSString stringWithFormat:@"%@/api/skin/test/save",baseURL];
    
    NSError *error = nil;
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer]requestWithMethod:@"POST"
                                                                                URLString:urlString
                                                                               parameters:parameters
                                                                                    error:&error];
    if (error)
    {
        failture(error);
        return;
    }
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *string = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"---string--%@",string);
        success(responseObject);
    }
                                     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                         NSLog(@"---error--%@",error);
                                         failture(error);
                                         
                                     }];
    [self.operationQueue addOperation:operation];
}
@end
