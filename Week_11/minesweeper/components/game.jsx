import React from 'react'
import * as Minesweeper from './minesweeper'

export default class Game extends React.Component{

    constructor(){
        super()

        this.state = {
            board: new Minesweeper.Board 
        }

        this.updateGame = this.updateGame.bind(this)
    }

    updateGame(){
        
    }

    render(){
        return (<Minesweeper.Board property={this.state.board} property={this.updateGame}/>)
    }
}