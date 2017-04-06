import React,{Component} from 'react';
import {createStore,applyMiddleware} from 'redux';
import {Provider,connect} from 'react-redux';
import { Router, Scene, Actions } from 'react-native-router-flux';
import thunk from 'redux-thunk';

const RouterWithRedux = connect()(Router);
import reducers from '../reducers';
const createStoreWithMiddleware = applyMiddleware(thunk)(createStore);
const store = createStoreWithMiddleware(reducers);

import LoadInit from './initDataContent';

export default class app extends Component {
    constructor(props) {
        super(props);
    }

    componentWillMount() {
    }
    componentDidMount() {
    }
    componentWillUnmount() {
    }

    render() {
        return (
            <Provider store={store}>
                <RouterWithRedux>
                    <Scene key="yh_initData" title="initData" initial={true} component={LoadInit} hideNavBar={true} />
                </RouterWithRedux>
            </Provider>
        )
    }
}