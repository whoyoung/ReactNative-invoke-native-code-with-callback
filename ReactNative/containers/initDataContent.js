import React,{Component} from 'react';
import {bindActionCreators} from 'redux';
import {connect} from 'react-redux';
import EntranceComponent from '../components/entranceComponent';
import * as entranceActions from '../actions/actions';

class entranceComponent extends Component {

    constructor(props) {
        super(props);
    }

    render() {
        return (
            <EntranceComponent {...this.props}/>
        )
    }
}

export default connect(state => ({
        state:state.initialReducer
    }),
    (dispatch) => ({
        actions:bindActionCreators(entranceActions,dispatch)
    })
) (entranceComponent);