//
//  SecondModel.h
//  TransferInfoDemo
//
//  Created by Noah on 16/12/25.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SecondModel : NSObject

@property (nonatomic,copy) NSString *name;

@property (nonatomic,copy) NSString *age;

@property (nonatomic,copy) NSString *gender;

@property (strong, nonatomic) NSDictionary *dict;

- (instancetype)initWithDict:(NSDictionary *)dict;

- (instancetype)convertIntoModelWithDict:(NSDictionary *)dict;

//runtime 
+ (instancetype)modelWithDict:(NSDictionary *)dict;

@end
