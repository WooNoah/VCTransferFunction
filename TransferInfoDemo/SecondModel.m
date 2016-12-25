//
//  SecondModel.m
//  TransferInfoDemo
//
//  Created by Noah on 16/12/25.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "SecondModel.h"
#import <objc/runtime.h>

//字符串是否为空
#define isStringEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO || [str isEqualToString:@""])

@implementation SecondModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"进入init方法");
        
        NSLog(@"要跳出init方法了");
    }
    return self;
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self == [super init]) {
        NSLog(@"进入initWithDict方法");
        self.name = dict[@"name"];
        self.age  = dict[@"age"];
        self.gender = dict[@"gender"];
        NSLog(@"要跳出initWithDict方法了");
    }
    return self;
}

/**
 *  构造方法中带不带init都是一样的。
 *  此方法跟上面 initWithDict: 方法是一样的。
 */
- (instancetype)convertIntoModelWithDict:(NSDictionary *)dict {
    if (self == [super init]) {
        NSLog(@"进入convertIntoModelWithDict方法");
        self.name = dict[@"name"];
        self.age  = dict[@"age"];
        self.gender = dict[@"gender"];
        NSLog(@"要跳出convertIntoModelWithDict方法了");
    }
    return self;
}


#pragma mark - 使用runtime API来实现自动转换
+ (instancetype)modelWithDict:(NSDictionary *)dict {
    return [[self alloc]runtimeInitWithDict:dict];
}

- (instancetype)runtimeInitWithDict:(NSDictionary *)dict {
    if (self == [super init]) {
        unsigned int count;
        //获取属性列表 遍历并赋值
        objc_property_t *propertyList = class_copyPropertyList([self class], &count);
        for (unsigned int i=0; i<count; i++) {
            const char *propertyName = property_getName(propertyList[i]);
            //属性键名
            NSString *propertyNameKeyStr = [NSString stringWithUTF8String:propertyName];
            //属性值
            NSString *propertyValueStr = [dict objectForKey:propertyNameKeyStr];
            if (isStringEmpty(propertyValueStr)) {
                propertyValueStr = @"空";
            }
            [self setValue:propertyValueStr forKey:propertyNameKeyStr];
        }
    }
    return self;
}



#pragma mark - Setter 方法
- (void)setName:(NSString *)name {
    NSLog(@"setName");
    _name = name;
}

- (void)setAge:(NSString *)age {
    NSLog(@"setAge");
    _age = age;
}

- (void)setGender:(NSString *)gender {
    NSLog(@"setGender");
    _gender = gender;
}

- (void)setDict:(NSDictionary *)dict {
    NSLog(@"setDict");
    /*
     KVC会默认找到对应的setter方法中
     dict = (__NSCFConstantString *)@空 
     */
    _dict = dict;
}

//防止崩溃
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"setValue forUndefinedKey");
}

@end
