1.RN与ios原生互相通信 -> RNViewController/RNModule
2.RN调用ios组件 -> RNCustomController
步骤:
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

3.原有ios项目集成RN
步骤:
cocopods 集成react native 到ios项目中
1.终端创建个rn项目 
2.把rn创建好的 pacgage.json文件和index.ios.js文件拷贝到根目录
3.在原有ios项目中根目录 npm install
4.touch Podfile
5.填写需要的文件
platform :ios, '8.0'
target 'NumberTileGame' do
react_native_path = "./node_modules/react-native”
pod "React", :path => react_native_path, :subspecs => [
'Core',
'RCTActionSheet',
'RCTGeolocation',
'RCTImage',
'RCTLinkingIOS',
'RCTNetwork',
'RCTSettings',
'RCTText',
'RCTVibration',
'RCTWebSocket'
]
end
6.pod install 
如果中断出现找不到yoga路径 那么需要在podfile文件中添加路径 ./是相对位置
注意：
pod 'Yoga', :path => './node_modules/react-native/ReactCommon/yoga'

7.修改index.ios.js 内容
8.修改原生项目里的内容
9.修改info。plist文件
App Transport Security Settings -> Allow Arbitrary Loads-> yes



