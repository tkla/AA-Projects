import React from 'react';

export default class Tile extends React.Component {

    constructor(props){
        super(props);

        this.alt = false; 
        this.getState = this.getState.bind(this);
        this.handleClick = this.handleClick.bind(this);
    }

    getState(){
        if (this.props.tile.explored){
            return "tile"
        }else {
            return "tile explored"
        }
    }

    handleClick(e){
        this.props.updateGame(this, e.altKey);
    }

    render(){
        console.log(this.getState())
        let test = " "
        if (this.props.tile.flagged){
            test = "F"
        }else if (this.props.tile.explored){
                test =  this.props.tile.adjacentBombCount();
        }
        
       
  
        return (<div onClick={this.handleClick} className={this.getState()}>{test}</div>);
    }
} 
