import MovingObject from './moving_object';
import Util from './util';

function Asteroid(pos) {
  Util.inherits(MovingObject, this);
  this.pos = pos;
  this.color = "red";
  this.radius = 10;
  this.vec = Util.randomVec(500);
  MovingObject.call(this, this);
}

module.exports = Asteroid;