// // TestScrollView.js

import React, { Component, PropTypes } from 'react';
import { requireNativeComponent } from 'react-native';

// requireNativeComponent 自动把这个组件提供给 "RCTScrollView"
var RCTScrollView = requireNativeComponent('TestScrollView', TestScrollView);

export default class TestScrollView extends Component {

  render() {
    return <RCTScrollView {...this.props} />;
  }

}

TestScrollView.propTypes = {
    /**
    * 属性类型，其实不写也可以，js会自动转换类型
    */
    autoScrollTimeInterval: PropTypes.number,
    imageURLStringsGroup: PropTypes.array,
    autoScroll: PropTypes.bool,

    // oonTouchBanner: PropTypes.func
};

module.exports = TestScrollView;