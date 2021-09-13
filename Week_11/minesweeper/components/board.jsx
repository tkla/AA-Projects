import React from "react";
import Tile from './tile';

export default class Board extends React.Component {
    constructor(props){
        super(props);
    }

    render(){
        return (
            <div className='board'>{
                this.props.board.grid.map((row, idx) => {
                    return row.map((col, jdx) => {
                        return <Tile tile={col} updateGame={this.props.updateGame} key={[idx, jdx]}/>
                    })
                })
            }</div>
        );
    }
}