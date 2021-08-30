const Asteroid = require("./asteroid");
const Ship = require("./ship");

function Game(ctx){
  this.DIM_X = ctx.canvas.width;
  this.DIM_Y = ctx.canvas.height;
  this.NUM_ASTEROIDS = 10;
  this.asteroids = [];
  this.ctx = ctx;
  const newShip = new Ship({pos: this.randomPosition(), game: this});
  this.ship = newShip;
  this.addAsteroids();
  this.everything = this.allObjects();
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

  this.everything.forEach( a => a.draw(ctx));
}

Game.prototype.moveObjects = function() {
  this.everything.forEach( a => a.move());
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
  console.log(this.everything)
  this.asteroids.forEach(a => {
    if (this.ship.isCollideWith(a)){
      this.ship.collideWith(a);
    }
  })
}

Game.prototype.step = function() {
  this.moveObjects();
  this.checkCollisions();
}

Game.prototype.remove = function(asteroid){
  let asteroidIdx = this.everything.indexOf(asteroid);

  this.everything.splice(asteroidIdx, 1);
}

Game.prototype.allObjects = function() {
  let all = [];
  all = all.concat(this.asteroids);
  all.push(this.ship);
  return all;
}

module.exports = Game;