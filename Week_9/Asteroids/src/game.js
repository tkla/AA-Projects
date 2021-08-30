const Asteroid = require("./asteroid");

function Game(ctx){
  this.DIM_X = ctx.canvas.width;
  this.DIM_Y = ctx.canvas.height;
  this.NUM_ASTEROIDS = 3;
  this.asteroids = [];
  this.addAsteroids();
  this.draw(ctx);
}

Game.prototype.randomPosition = function() {
  let x = Math.floor(Math.random() * this.DIM_X);
  let y = Math.floor(Math.random() * this.DIM_Y);
  return [x, y];
}

Game.prototype.addAsteroids = function(){
  for(let i = 0; i < this.NUM_ASTEROIDS; i++){
    let a = new Asteroid({pos: this.randomPosition()});
    this.asteroids.push(a);
  }
}

Game.prototype.draw = function(ctx){
  ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);

  this.asteroids.forEach( a => a.draw(ctx));
}

Game.prototype.moveObjects = function() {
  this.asteroids.forEach( a => a.move());
}

module.exports = Game;