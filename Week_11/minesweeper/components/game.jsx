import React from 'react'
import * as Minesweeper from './minesweeper'
import Board from './board'


export default class Game extends React.Component{

    constructor(){
        super()

        this.state = {
            board: new Minesweeper.Board(3, 1)
        }
        console.log(this.state.board.grid)
        this.updateGame = this.updateGame.bind(this)
    }

    updateGame(tile, alt){
        let newTile = tile.props.tile;
        const board = this.state.board;
        console.log(this.state.board.grid);
        if (alt){
            // newTile = tile.toggleFlag();
        } else {
            newTile.explore();
            // newTile = tile.explore();
            // console.log(board.grid[tile.pos[0]][tile.pos[1]])
            // console.log(newTile)
            // board.grid[tile.pos[0]][tile.pos[1]] = newTile;
            // console.log(board.grid[tile.pos[0]][tile.pos[1]])
        }
        // tile.setState({explore: newTile.explored, flagged: newTile.flagged}, () => {
        //     console.log(this.state.board.grid);
        // });
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