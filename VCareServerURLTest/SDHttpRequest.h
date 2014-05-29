//
//  SDHttpRequest.h
//  VCareServerURLTest
//
//  Created by 马远征 on 14-5-29.
//  Copyright (c) 2014年 马远征. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

static const NSString *baseURL = @"http://192.168.1.112:8080/skin";

#warning 使用此文件之前，你需要导入最新的AFNetWorking开源库

@interface SDHttpRequest : NSObject
+ (instancetype)sharedInstance;

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
               failture:(void(^)(NSError *error))failture;

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
            failture:(void(^)(NSError *error))failture;


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
             failture:(void(^)(NSError *error))failture;


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
             failture:(void(^)(NSError *error))failture;


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
             failture:(void(^)(NSError *error))failture;


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
               failture:(void(^)(NSError *error))failture;


#pragma mark -提交测试数据
/*!
 * @method
 * @brief 提交测试数据
 * @see {@URL} /api/skin/test/save
 * @param  token 登录返回token
 * @param  testData [数组]：包含字典对象，字典对象如下：
 * @param  // NSDictionary 字典对象
 * @param  i 记录ID
 * @param  sn 后台保存后的唯一标识
 * @param  s 总评估分数
 * @param  d 数据前端保存时间
 * @param  p [数组] 各个部位测试数据
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
                 failture:(void(^)(NSError *error))failture;


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
                  failture:(void(^)(NSError *error))failture;
@end
