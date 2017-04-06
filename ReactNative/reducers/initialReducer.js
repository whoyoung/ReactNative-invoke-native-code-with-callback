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
        default: 
            return state;
    }
        
} 