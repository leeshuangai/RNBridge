//
//  RNCustomController.m
//  RNTest
//
//  Created by Lish on 2017/5/18.
//  Copyright © 2017年 Lish. All rights reserved.
//

#import "RNCustomController.h"
#import <React/RCTRootView.h>
@interface RNCustomController ()

@end

@implementation RNCustomController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *jsCodeLocation;
    jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.ios.bundle?platform=ios&dev=true"];
    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                        moduleName:@"Test2"
                                                 initialProperties:nil
                                                     launchOptions:nil];
    rootView.frame = [[UIScreen mainScreen]bounds];
    [self.view addSubview:rootView];

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
