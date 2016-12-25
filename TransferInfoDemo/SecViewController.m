//
//  SecViewController.m
//  TransferInfoDemo
//
//  Created by Noah on 16/12/25.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "SecViewController.h"

#import "SecondModel.h"

@interface SecViewController ()
{
    NSInteger _count;
}

@end



@implementation SecViewController

- (instancetype)init {
    NSLog(@"%d",self.count);
    if (self = [super init]) {
        NSLog(@"%d",self.count);
    }
    return self;
}

- (void)loadView {
    [super loadView];
    NSLog(@"loadView");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"viewDidLoad");
    self.view.backgroundColor = [UIColor orangeColor];
    
    NSLog(@"%d",self.count);
    
    NSDictionary *dict = @{@"name":@"Noah",@"age":@"10",@"gender":@"男"};
#if 0
    SecondModel *model = [[SecondModel alloc]init];
    model.name = dict[@"name"];
    model.age = dict[@"age"];
    model.gender = dict[@"gender"];
#else
//    SecondModel *model = [[SecondModel alloc]initWithDict:dict];
    
//    SecondModel *model = [[SecondModel alloc]convertIntoModelWithDict:dict];
    
    //使用runtime API来实现自动转换
    SecondModel *model = [SecondModel modelWithDict:dict];
#endif
    NSLog(@"%@",model);
    
    
}


- (NSInteger)count {
    NSLog(@"getter");
    return _count;
}

- (void)setCount:(NSInteger)count {
    NSLog(@"setter");
    _count = count;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
