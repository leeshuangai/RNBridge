//
//  RNModule.m
//  RNTest
//
//  Created by Lish on 2017/5/18.
//  Copyright © 2017年 Lish. All rights reserved.
//

#import "RNModule.h"
#import "RCTEventDispatcher.h"
@implementation RNModule
//必写
RCT_EXPORT_MODULE()

//js调用原生方法
RCT_EXPORT_METHOD(RNTest:(NSString *)name age:(int)age){
    
    NSLog(@"RN调用了原生方法 name：%@ ，age%d",name,age);
}


//桥接到Javascript的方法返回值必须是void。React native的桥接操作是异步的。所以要返回给Javascript，必须通过回调函数或者出触发事件
RCT_EXPORT_METHOD(jsCallback:(NSString *)jsString callBack:(RCTResponseSenderBlock)callback){
    
    NSLog(@"调用了jsCallback函数 %@",jsString);
     NSArray *events = [[NSArray alloc] initWithObjects:@"哈哈哈哈",@"回调函数", nil];
    NSString *str  = @"hhhhhhah 哈哈这是返回的字符串";
    callback(@[[NSNull null],str]);
    
    
}


//oc调用js 间接调用 js->oc->js
@synthesize bridge = _bridge;

RCT_EXPORT_METHOD(OCTest){
    
    [self ocCallJs];
    
}

- (void)ocCallJs{
    
    NSDictionary *dict = @{@"name":@"lish-这是oc调用rn的方法",@"age":@25};
    [self.bridge.eventDispatcher sendAppEventWithName:@"ocCallJs" body:dict];

}



@end
