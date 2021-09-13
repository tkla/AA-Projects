import React from 'react';

export default class Tile extends React.Component {

    constructor(props){
        super(props);
        this.state = {
            bombed: this.props.tile.bombed,
            explored: this.props.tile.explored,
            flagged: this.props.tile.flagged
        }

        this.alt = false; 
        this.getState = this.getState.bind(this);
        this.handleClick = this.handleClick.bind(this);
        this.handleKeyDown = this.handleKeyDown.bind(this);
        this.handleKeyUp = this.handleKeyUp.bind(this);
    }

    getState(){
        if (this.state.bombed) {
            return 'x';
        } else if (this.state.explored) {
            return 'e';
        } else if (this.state.flagged) {
            return 'f';
        }
        return ' ';
    }

    handleClick(e){
        this.props.updateGame(this, this.alt);
    }

    handleKeyDown(e){
        if(e.key === 'altKey'){
            this.alt = true;
        }
    }

    handleKeyUp(){
        this.alt = false;
    }

    render(){
        return (<div 
            onClick={this.handleClick} 
            onKeyDown={this.handleKeyDown}
            onlyKeyUp={this.handleKeyUp}
            className='tile'>{this.getState()}</div>);
    }
} 
