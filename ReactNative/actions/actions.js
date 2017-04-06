import * as types from './actionTypes';
import YHCallBackModule from '../../Native/NativeCallBackModule'

export function clickBtn() {
    return async function (dispatch) {
        YHCallBackModule.pushNoCallBack();
    }
}

export function clickBlockBtn() {
    return async function (dispatch) {
        let title = await YHCallBackModule.pushBlockCallBack();
        dispatch({type: types.yh_appEntranceModule_block,title:title});
    }
}

export function clickDelegateBtn() {
    return async function (dispatch) {
        let title = await YHCallBackModule.pushDelegateCallBack();
        dispatch({type: types.yh_appEntranceModule_delegate,title:title});
    }
}

export function clickNotiBtn() {
    return async function (dispatch) {
        YHCallBackModule.pushNotiCallBack();
    }
}

export function changeNotiBtn() {
    return {type: types.yh_appEntranceModule_noti,title:'notiChanged'};
}
