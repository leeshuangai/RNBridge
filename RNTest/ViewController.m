//
//  ViewController.m
//  RNTest
//
//  Created by Lish on 2017/5/18.
//  Copyright © 2017年 Lish. All rights reserved.
//

#import "ViewController.h"
#import "RNViewController.h"
#import "RNCustomController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
}

- (IBAction)openRN:(id)sender {
    
    RNViewController *vc = [[RNViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (IBAction)component:(id)sender {
    
    RNCustomController *vc = [[RNCustomController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
