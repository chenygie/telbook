//
//  CYGTelbook.h
//  通讯录
//
//  Created by 陈一根陈一根 on 16/1/9.
//  Copyright © 2016年 陈一根. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CYGTelbook : NSObject
@property (strong,nonatomic) NSMutableArray * persons;
-(BOOL)add;
-(BOOL)del;
-(BOOL)update;
-(BOOL)select;
-(BOOL)show;
@end
