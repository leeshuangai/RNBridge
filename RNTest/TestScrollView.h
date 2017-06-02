//
//  TestScrollView.h
//  RNTest
//
//  Created by Lish on 2017/5/18.
//  Copyright © 2017年 Lish. All rights reserved.
//

#import <SDCycleScrollView/SDCycleScrollView.h>
#import "UIView+React.h"
#import "RCTComponent.h"

@interface TestScrollView : SDCycleScrollView
@property (nonatomic , copy) RCTBubblingEventBlock onClickBanner;
@end

/*
 
 1.创建一个继承原生视图的类  -> TestScrollView
 2.导入 UIView+React.h(对原生视图进行扩展) / RCTComponent.h
 3.如果有点击事件 -> 属性一般以on开头命名
   @property (nonatomic , copy) RCTBubblingEventBlock onClickBanner
 
  4.创建一个继承RCTViewManager的类 -> TestScrollViewManager
  5.在TestScrollViewManager中 
    5.1)导入
    "TestScrollView.h"      //第三方组件
    "RCTBridge.h"           //进行通信文件
    "RCTEventDispatcher.h"  //事件派发
 
    5.2)如果有协议则<>
    5.3)重写下面方法
    - (UIView *)view{
 
    }
    5.4) RCT_EXPORT_MODULE()
    5.5)导出属性->导出的属性名字一定要跟原生组件的属性名字一样
    RCT_EXPORT_VIEW_PROPERTY(onClickBanner, RCTBubblingEventBlock)
    RCT_EXPORT_VIEW_PROPERTY(autoScroTimeInterval, CGFloat)

    5.6)在协议里或合适的地方导出事件
    cycleScrollView.onClickBanner(@{@"target": cycleScrollView.reactTag,
    @"value": [NSNumber numberWithInteger:index+1]})
    5.7)导出常量给js用
    - (NSDictionary *)constantsToExport
   6.js文件中
    6.1)var RCTScrollView = requireNativeComponent('TestScrollView',TextScrollView);
            RCTScrollView 对应下方创建的名字
                                                   'TestScrollView' 对应ios原生组件文件名字
                                                                    TextScrollView:对应js,class创建及导出的名字


  */




 
 
 
 
 
 
 
 
 
 






