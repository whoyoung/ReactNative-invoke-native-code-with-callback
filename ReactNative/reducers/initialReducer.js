import * as types from '../actions/actionTypes';

const initState = {
    noCallBackTitle:'noCallBack',
    blockTitle:'block',
    delegateTitle:'delegate',
    notificationTitle:'notification'
};

export default function entranceReducer(state = initState, action = {}) {
    switch(action.type) {
        case types.yh_appEntranceModule_block: 
            return {
                    ...state,
                    blockTitle:action.title,
            }
        case types.yh_appEntranceModule_delegate: 
            return {
                    ...state,
                    delegateTitle:action.title,
            }
        case types.yh_appEntranceModule_noti: 
            return {
                    ...state,
                    notificationTitle:action.title,
            }
        default: 
            return state;
    }
        
} 