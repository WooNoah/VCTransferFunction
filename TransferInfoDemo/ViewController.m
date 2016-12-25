//
//  ViewController.m
//  TransferInfoDemo
//
//  Created by Noah on 16/12/25.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "ViewController.h"

#import "SecViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}


- (IBAction)toSecondViewController:(id)sender {
    SecViewController *sec = [[SecViewController alloc]init];
    sec.count = 10;
    
    [self.navigationController pushViewController:sec animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
