import React, { Component } from 'react';
import {
  StyleSheet,
  Text,
  View
} from 'react-native';

export default class reactNativeInvokeNativeCode extends Component {
    _noCallBack() {
      this.props.actions.clickBtn();
    }
    _blockCallBack() {
      this.props.actions.clickBlockBtn();
    }
    _delegateCallBack() {
      this.props.actions.clickDelegateBtn();
    }
    _notificationCallBack() {
      this.props.actions.clickNotiBtn();
    }
  render() {
    let {noCallBackTitle,blockTitle,delegateTitle,notificationTitle} = this.props.state;
    return (
      <View style={styles.container}>
        <Text style={styles.callback} onPress={()=>{
            this._noCallBack();
        }}>
          {noCallBackTitle}
        </Text>
        <Text style={styles.callback} onPress={()=>{
            this._blockCallBack();
        }}>
          {blockTitle}
        </Text>
        <Text style={styles.callback} onPress={()=>{
            this._delegateCallBack();
        }}>
          {delegateTitle}
        </Text>
        <Text style={styles.callback}>
          {notificationTitle}
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
    width:180
  },
});