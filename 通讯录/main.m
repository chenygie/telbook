//
//  main.m
//  通讯录
//
//  Created by 陈一根陈一根 on 16/1/9.
//  Copyright © 2016年 陈一根. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CYGMenu.h"

int main(int argc, const char * argv[]) {
    //添加一个联系人
    //删除一个联系人
    //查找一个联系人
    //显示所有的联系人
    //退出
    @autoreleasepool {
        CYGMenu * menu = [[CYGMenu alloc]init]; //创建菜单对象
        while (1) {
            [menu show]; //显示菜单
            if ([menu input]) {
                break;
            }
        }
        
        
    }
    return 0;
}
