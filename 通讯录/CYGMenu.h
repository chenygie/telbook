//
//  CYGMenu.h
//  通讯录
//
//  Created by 陈一根陈一根 on 16/1/9.
//  Copyright © 2016年 陈一根. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CYGTelbook.h"
@interface CYGMenu : NSObject
@property (strong,nonatomic) NSArray * items;
@property (strong,nonatomic) CYGTelbook * book;
//通讯录
-(void)show;
-(BOOL)input;

@end
