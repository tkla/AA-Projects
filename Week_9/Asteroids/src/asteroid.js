const MovingObject = require('./moving_object');
const Util = require('./util');

function Asteroid(options) {
  this.pos = options.pos;
  this.color = "red";
  this.radius = 10;
  this.vel = Util.randomVec(10);
  MovingObject.call(this, this);
}

Util.inherits(MovingObject, Asteroid);

module.exports = Asteroid;