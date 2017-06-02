/**
 * Created by lish on 2017/5/18.
 */
import React,{Component,PropTypes} from 'react';
import {
    requireNativeComponent
}from 'react-native'

//requireNativeComponent
var RCTScrollView = requireNativeComponent('TestScrollView',TextScrollView);

//RCTScrollView 对应下方创建的名字
//'TestScrollView' 对应ios原生组件文件名字
//对应本文件 class 创建及导出的名字
export default class TextScrollView extends Component{

    render(){
        return <RCTScrollView {...this.props}/>
    }

}

TextScrollView.propTypes = {

    //属性类型
    autoScrollTimeInterval:PropTypes.number,
    imageURLStringGroup:PropTypes.array,
    autoScroll:PropTypes.bool,

}

module.exports = TextScrollView;