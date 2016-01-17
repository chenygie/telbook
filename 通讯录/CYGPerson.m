//
//  CYGPerson.m
//  通讯录
//
//  Created by 陈一根陈一根 on 16/1/9.
//  Copyright © 2016年 陈一根. All rights reserved.
//

#import "CYGPerson.h"

@implementation CYGPerson
@synthesize name,telphone;
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:name forKey:@"NAME"];
    [aCoder encodeObject:telphone forKey:@"TEL"];
}
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.name = [aDecoder decodeObjectForKey:@"NAME"];
        self.telphone = [aDecoder decodeObjectForKey:@"TEL"];
    }
    return self;
}
@end
