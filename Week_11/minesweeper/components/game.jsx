import React from 'react'
import * as Minesweeper from './minesweeper'
import Board from './board'


export default class Game extends React.Component{

    constructor(){
        super()

        this.state = {
            board: new Minesweeper.Board(3, 1)
        }
        
        this.updateGame = this.updateGame.bind(this)
    }

    updateGame(tile, alt){
        let newTile = tile.props.tile;
        if (alt){
            newTile.toggleFlag();
        } else {
            newTile.explore();
        }

        this.setState({board: this.state.board});
    }

    render(){
        const win = document.getElementById('win');
        const lose = document.getElementById('lose');
        if (this.state.board.won()){
            win.id = 'win-display';
        }
        if (this.state.board.lost()){
            lose.id = 'lose-display';
        }
        return (
            <div>
                <Board board={this.state.board} updateGame={this.updateGame}/>
            </div>
        )
        
    }
}