import * as types from './actionTypes';
import YHCallBackModule from '../../Native/NativeCallBackModule'

export function clickBlockBtn() {
    return async function (dispatch) {
        let title = await YHCallBackModule.pushBlockCallBack();
        dispatch({type: types.yh_appEntranceModule_block,title:title});
    }
}
