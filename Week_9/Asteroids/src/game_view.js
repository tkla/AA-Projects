//const Game = require('./game');

function GameView(game, ctx){
    this.ctx = ctx;
    this.game = game;
}

GameView.prototype.start = function () {
    let thisGame = this.game;
    let thisGameView = this; 

    
    setInterval(function(){
        thisGame.moveObjects();
    }, 20);
    
    setInterval(function(){
        console.log(thisGame);
        console.log(thisGameView);
        thisGame.draw(thisGameView.ctx);
    }, 20);
}

module.exports = GameView;