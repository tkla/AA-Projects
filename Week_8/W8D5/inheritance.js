Function.prototype.inherits = function (parent) {
    function Surrogate() {};
    Surrogate.prototype = parent.prototype;
    this.prototype = new Surrogate();
    this.prototype.constructor = this;
}

function MovingObject (name) {
    this.name = name;
}

MovingObject.prototype.sayHello = function () {
    console.log("Herro");
}


function Ship (name) {
    MovingObject.call(this, name);
}
Ship.inherits(MovingObject);

function Asteroid (name, color) {
    MovingObject.call(this, name);
    this.color = color;
}
Asteroid.inherits(MovingObject);

let billy = new Ship('billy');
console.log(billy.color);
billy.sayHello();

let haley = new Asteroid('haley', 'blue');
console.log(haley.color);
haley.sayHello();