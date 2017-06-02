/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
    AppRegistry,
    StyleSheet,
    Text,
    View,
    NativeAppEventEmitter,
    TouchableOpacity,
    Alert,
    NativeModules,
    ScrollView
} from 'react-native';

//引用组件
var TextScrollView = require('./TextScrollView');

//轮播图数组
var bannerImgs = [
    'http://upload-images.jianshu.io/upload_images/2321678-ba5bf97ec3462662.png?imageMogr2/auto-orient/strip%7CimageView2/2',
    'http://upload-images.jianshu.io/upload_images/1487291-2aec9e634117c24b.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/480/q/100',
    'http://f.hiphotos.baidu.com/zhidao/pic/item/e7cd7b899e510fb37a4f2df3db33c895d1430c7b.jpg'
];

var TestScrollViewConsts = require('react-native').UIManager.TestScrollView.Constants;

class NativeUIModule extends Component{

    constructor(props){
        super(props);
        this.state={
            bannerNum:0
        }
    }

    render() {

        return (
            <ScrollView style = {{marginTop:64}}>
                <View>
                    <TextScrollView style={styles.scrollViewStyle}
                                    autoScrollTimeInterval = {2}
                                    imageURLStringsGroup = {bannerImgs}
                                    pageControlAliment = {TestScrollViewConsts.SDCycleScrollViewPageContolAliment.right}
                                    onClickBanner={(e) => {
                                        console.log('test' + e.nativeEvent.value);
                                        this.setState({bannerNum:e.nativeEvent.value});
                                    }}
                    />
                    <Text style={{fontSize: 15, margin: 10, textAlign:'center'}}>
                        点击banner -> {this.state.bannerNum}
                    </Text>
                </View>
            </ScrollView>
        );
    }
}





//js 调用原生函数 函数名 RNTest
var RN = NativeModules.RNModule;
//RNModule 这个是原生对应得文件名字

//OC调用js
var Js = NativeAppEventEmitter.addListener(
    'ocCallJs',
    (para)=> Alert.alert('被oc点击','字典数据:\n name:'+para.name+'\n age:'+para.age)

);


export default class test extends Component {

  // 构造
    constructor(props) {
      super(props);
      // 初始状态
      this.state = {

      };
    }

    componentWillUnmount() {
        Js.remove();
    }

  render() {
    return (
      <View style={styles.container}>
      <TouchableOpacity
      onPress = {()=>{
          RN.OCTest()

      }}>
        <Text style={styles.welcome}>
      OC调用RN方法
        </Text>
      </TouchableOpacity>
      <TouchableOpacity
      onPress = {()=>{
          RN.RNTest('Lishuang',25);
      }}>
        <Text style={styles.welcome}>
         RN调用OC方法
        </Text>
         </TouchableOpacity>
         <TouchableOpacity
       onPress = {()=>{
          RN.jsCallback('Lishuang',(error,callBack)=>{
            if(error){
              Alert.alert({error})
            }else{
                  //Alert.alert('J2O带返回值', '数组的三个值：\n[0]:'+callBack[0]+'\n[1]:'+callBack[1])
                   Alert.alert(callBack)
              }
          });
      }}>
        <Text style={styles.welcome}>
         RN调用OC方法-带回调函数
        </Text>
          </TouchableOpacity>
      </View>
    );
  }
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#e7e7e7',
    },
    scrollViewStyle: {
        padding: 30,
        marginTop: 10,
        height: 200,
        backgroundColor:'orange',
        width:375
    },

    welcome: {
        fontSize: 20,
        textAlign: 'center',
        margin: 10,
    },
    instructions: {
        textAlign: 'center',
        color: '#333333',
        marginBottom: 5,
    },
});
AppRegistry.registerComponent('Test2', () => NativeUIModule);
AppRegistry.registerComponent('test', () => test);
