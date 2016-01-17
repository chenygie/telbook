//
//  CYGPerson.h
//  通讯录
//
//  Created by 陈一根陈一根 on 16/1/9.
//  Copyright © 2016年 陈一根. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CYGPerson : NSObject<NSCoding>  //继承coding 进行数据归档处理
@property (strong,nonatomic) NSString * name;
@property (strong,nonatomic) NSString * telphone;

@end
