import {combineReducers} from 'redux';
import initialReducer from './initialReducer';

const appReducers = combineReducers({
    initialReducer,
});

export default appReducers;