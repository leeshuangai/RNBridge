//
//  TestScrollViewManager.m
//  RNTest
//
//  Created by Lish on 2017/5/18.
//  Copyright © 2017年 Lish. All rights reserved.
//

#import "TestScrollViewManager.h"
#import "TestScrollView.h"//第三方组件
#import "RCTBridge.h" //进行通信文件
#import "RCTEventDispatcher.h" //事件派发
@interface TestScrollViewManager()<SDCycleScrollViewDelegate>

@property (nonatomic , strong) TestScrollView *testScrollView;

@end
@implementation TestScrollViewManager

RCT_EXPORT_MODULE()

RCT_EXPORT_VIEW_PROPERTY(onClickBanner, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(autoScroTimeInterval, CGFloat)
RCT_EXPORT_VIEW_PROPERTY(imageURLStringsGroup, NSArray)
RCT_EXPORT_VIEW_PROPERTY(autoScroll, BOOL)
RCT_EXPORT_VIEW_PROPERTY(pageControlAliment, NSInteger);

/** 此处导出的属性名字一定要跟原生组件的属性名字一样这样js才能给原生赋值 */


- (UIView *)view{
    //实际组件的大小位置由js控制
    _testScrollView = [TestScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width/2+20, [UIScreen mainScreen].bounds.size.width/2+20)delegate:self placeholderImage:nil];
    //  初始化时将delegate指向了self
    _testScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    _testScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    return _testScrollView;
    
    
}

//当事件导出用到sendInputEventWithName的方式时会用到
//-(NSArray *)customDirectEventTypes {
//    return @[@"onClickBanner"];
//}


#pragma mark SDCycleScrollViewDelegate
//banner点击
- (void)cycleScrollView:(TestScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    //    这也是导出事件的方式，不过好像是旧方法了，会有警告
    //    [self.bridge.eventDispatcher sendInputEventWithName:@"onClickBanner"
    //                                                   body:@{@"target": cycleScrollView.reactTag,
    //                                                          @"value": [NSNumber numberWithInteger:index+1]
    //                                                        }];
    
    if (!cycleScrollView.onClickBanner) {
        return;
    }
    
    NSLog(@"oc did click %li", [cycleScrollView.reactTag integerValue]);
    
    //  导出事件
    cycleScrollView.onClickBanner(@{@"target": cycleScrollView.reactTag,
                                    @"value": [NSNumber numberWithInteger:index+1]});
}


// 导出枚举常量，给js定义样式用
- (NSDictionary *)constantsToExport
{
    return @{
             @"SDCycleScrollViewPageContolAliment": @{
                     @"right": @(SDCycleScrollViewPageContolAlimentRight),
                     @"center": @(SDCycleScrollViewPageContolAlimentCenter)
                     }
             };
}


@end
