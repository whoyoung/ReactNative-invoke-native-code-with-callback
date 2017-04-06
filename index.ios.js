/**
 * Sample React Native App
 * https://github.com/whoyoung/ReactNative-invoke-native-code-with-callback.git
 */

import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View
} from 'react-native';

export default class ReactNativeInvokeNativeCode extends Component {
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.callback}>
          noCallBack
        </Text>
        <Text style={styles.callback}>
          block
        </Text>
        <Text style={styles.callback}>
          delegate
        </Text>
        <Text style={styles.callback}>
          notification
        </Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  callback: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
    backgroundColor:'green',
    color:'white',
    width:150
  },
});

AppRegistry.registerComponent('ReactNativeInvokeNativeCode', () => ReactNativeInvokeNativeCode);
