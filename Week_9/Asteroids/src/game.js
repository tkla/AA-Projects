const Asteroid = require("./asteroid");

function Game(ctx){
  this.DIM_X = ctx.canvas.width;
  this.DIM_Y = ctx.canvas.height;
  this.NUM_ASTEROIDS = 3;
  this.asteroids = [];
  this.addAsteroids();
}

Game.prototype.randomPosition = function() {
  let x = Math.floor(Math.random() * this.DIM_X);
  let y = Math.floor(Math.random() * this.DIM_Y);
  return [x, y];
}

Game.prototype.addAsteroids = function(){
  for(let i = 0; i < this.NUM_ASTEROIDS; i++){
    let a = new Asteroid({pos: this.randomPosition()});
    console.log(a);
    this.asteroids.push(a);
  }
}

module.exports = Game;