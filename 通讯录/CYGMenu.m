//
//  CYGMenu.m
//  通讯录
//
//  Created by 陈一根陈一根 on 16/1/9.
//  Copyright © 2016年 陈一根. All rights reserved.
//

#import "CYGMenu.h"

@implementation CYGMenu
@synthesize  items;
-(instancetype)init
{
    self = [super init];
    if (self) {
        self.items=[NSArray arrayWithObjects:@"添加一个联系人", @"删除一个联系人",@"修改一个联系人",@"查找一个联系人",@"显示所有联系人",@"退出",nil];
        self.book = [[CYGTelbook alloc]init];
    }
    return self;
}
-(void)show
{
    int no=0;
    for (NSString * str in items) {
        no++;
        printf("%d.%s\n",no,[str UTF8String]);
    }
}
-(BOOL)input
{
    char ch[2];
    printf("请输入功能选项（1－6）：");
    scanf("%s",ch);
    ch[1]='\0';
    if (strcmp(ch, "1")==0) {
        if ([self.book add]) {
            printf("联系人添加成功\n");
        }
        else
        {
            printf("联系人添加失败\n");
        }
    }
    else if (strcmp(ch, "2")==0)
    {
        if ([self.book del]) {
            printf("联系人删除成功\n");
        } else {
            printf("联系人删除失败\n");
        }
    }
    else if (strcmp(ch, "3")==0)
    {
        if ([self.book update]) {
            printf("联系人修改成功\n");
        } else {
            printf("联系人修改失败\n");
        };
    }
    else if (strcmp(ch, "4")==0)
    {
        if ([self.book select]) {
            printf("联系人查找成功\n");
        } else {
            printf("联系人查找失败\n");
        }
    }
    else if (strcmp(ch, "5")==0)
    {
        if ([self.book show]==NO) {
            printf("联系人显示失败\n");
        }
    }
    else if (strcmp(ch, "6")==0)
    {
        return YES;
    }
    else
        printf("非法的选择！\n");
    return NO;
}
@end
