//
//  CYGTelbook.m
//  通讯录
//
//  Created by 陈一根陈一根 on 16/1/9.
//  Copyright © 2016年 陈一根. All rights reserved.
//

#import "CYGTelbook.h"
#import "CYGPerson.h"

@implementation CYGTelbook
-(instancetype)init
{
    self = [super init];
    if (self) {
        //读取磁盘文件中的联系人
        self.persons = [NSKeyedUnarchiver unarchiveObjectWithFile:@"telbook.data"];//解挡
        if (self.persons == nil) {//如果磁盘上不存在，创建集合对象
            self.persons = [NSMutableArray arrayWithCapacity:100];
        }
    }
    return self;
}
-(BOOL)add
{
    //得到联系人的姓名和电话，然后添加到通讯录，最后持久化
    char ch[20];
    CYGPerson  * person = [[CYGPerson alloc]init];
    printf("请输入联系人的姓名");
    scanf("%s",ch);
    ch[19] = '\0';
    person.name =[NSString stringWithUTF8String:ch];
    printf("请输入联系人的电话号码");
    scanf("%s",ch);
    ch[19] = '\0';
    person.telphone =[NSString stringWithUTF8String:ch];
    //添加到通讯录
    [self.persons addObject:person];
    //持久化归档
    [NSKeyedArchiver archiveRootObject:self.persons toFile:@"telbook.data"];
    
    return YES;
}
-(BOOL)del
{
    //首先得到需要删除的联系人.然后删除内存中的联系人，最好同步到磁盘
    char ch[5];
    printf("请出入删除联系人的编号：");
    scanf("%s",ch);
    ch[3]= '\0';
    int n = atoi(ch);
    if (self.persons.count<n) {
    printf("输入的编号有误！\n");
        
        return NO;
    } else {
        [self.persons removeObjectAtIndex:n-1];
        [NSKeyedArchiver archiveRootObject:self.persons toFile:@"telbook.data"];\
        return YES;
    }
}
-(BOOL)update
{
//   先得到修改联系人的编号,然后修改内存中的联系人
    char ch[5];
    printf("请输入修改联系人的编号：");
    scanf("%s",ch);
    ch[3]= '\0';
    int n = atoi(ch);
    if (self.persons.count<n) {
        printf("输入的编号有误！\n");
        return NO;
    } else {
        char chtemp[20];
        printf("请输入修改后的联系人姓名：");
        scanf("%s",chtemp);
        chtemp[19] = '\0';
        CYGPerson * person = [[CYGPerson alloc]init];
        person.name = [NSString stringWithUTF8String:chtemp];
        printf("请输入修改联系人的电话号码：");
        scanf("%s",chtemp);
        chtemp[19]='\0';
        person.telphone = [NSString stringWithUTF8String:chtemp];
//        修改内存中的联系人
        self.persons[n-1] = person;
//        同步到磁盘中
        [NSKeyedArchiver archiveRootObject:self.persons toFile:@"telbook.data"];
        return YES;
    }
    return YES;
}
-(BOOL)select
{
//    得到查找的内容
//    到内存中去查找
    char ch [20];
    scanf("%s",ch);
    ch[19]='\0';
    NSString * str = [NSString stringWithUTF8String:ch];
    BOOL flag = NO;
    printf("请输入你想查找联系人的姓名或者电话");
    for (CYGPerson * p in self.persons) {
        if ([p.name isEqualToString:str] || [p.telphone isEqualToString:str]) {
            printf("%s\t%s\n",[p.name UTF8String],[p.telphone UTF8String]);
            flag = YES;
        }
    }
    return flag;
}
-(BOOL)show
{
    if (self.persons.count == 0) {
        NSLog(@"没有人");
    }
    else{
        int c =0;
        printf("编号\t姓名\t电话\t\n");
        for (CYGPerson * p in self.persons) {
            c++;
            printf("%d\t%s\t%s\n",c,[p.name UTF8String],[p.telphone UTF8String]);
        }
    }
    return YES;
}
@end
