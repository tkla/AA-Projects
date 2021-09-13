import React from 'react';

export default class Tile extends React.Component {

    constructor(props){
        super(props);
        this.state = {
            bombed: this.props.tile.bombed,
            explored: this.props.tile.explored,
            flagged: this.props.tile.flagged
        }
        this.getState = this.getState.bind(this);
    }

    getState(){
        if (this.state.bombed) {
            return 'x';
        } else if (this.state.explored) {
            return 'e';
        } else if (this.state.flagged) {
            return 'f';
        }
        return '_';
    }

    render(){
        return (<div className='tile'>{this.getState()}</div>);
    }
} 
