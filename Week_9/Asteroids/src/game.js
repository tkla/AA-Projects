const Asteroid = require("./asteroid");

function Game(ctx){
  this.DIM_X = ctx.canvas.width;
  this.DIM_Y = ctx.canvas.height;
  this.NUM_ASTEROIDS = 4;
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
    let a = new Asteroid({pos: this.randomPosition(), game: this});
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

Game.prototype.wrap = function(pos) {
  let newPos = pos;
  if (pos[0] >= this.DIM_X + 10){
    newPos[0] = -10;
  } else if (pos[0] < -10) {
    newPos[0] = this.DIM_X + 10;
  }

  if (pos[1] >= this.DIM_Y + 10){
    newPos[1] = -10;
  } else if (pos[1] < -10){
    newPos[1] = this.DIM_Y + 10;
  }

  return newPos;  
}

Game.prototype.checkCollisions = function() {
  this.asteroids.forEach(a => {
    for(let i = 0; i < this.asteroids.length; i++){
      if (this.asteroids[i] !== a){
        if (a.isCollideWith(this.asteroids[i])) {
          alert("COLLISION");
        }
      }
    }
  })
}

Game.prototype.step = function() {
  this.moveObjects();
  this.checkCollisions();
}

module.exports = Game;