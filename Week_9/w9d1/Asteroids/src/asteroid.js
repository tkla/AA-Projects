const MovingObject = require('./moving_object');
const Util = require('./util');

function Asteroid(options) {
  this.pos = options.pos;
  this.color = "red";
  this.radius = 20;
  this.vel = Util.randomVec(10);
  this.game = options.game;
  MovingObject.call(this, this);
}

Util.inherits(MovingObject, Asteroid);

module.exports = Asteroid;