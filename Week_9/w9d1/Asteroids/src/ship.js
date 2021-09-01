const MovingObject = require('./moving_object');
const Util = require('./util');

function Ship(options) {
  this.radius = 5;
  this.color = 'blue';
  this.vel = [0, 0];
  this.pos = options.pos;
  this.game = options.game;
  MovingObject.call(this, this);
}

Util.inherits(MovingObject, Ship);

module.exports = Ship;