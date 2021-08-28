class Lamp {
    constructor() {
        this.name = "a lamp";
    }
}

const turnOn = function () {
    console.log("Turning on " + this.name);
};

const lamp = new Lamp();

turnOn(); // should not work the way we want it to

Function.prototype.myBind = function(obj){
    // Return an arrow function.
    // The arrow function captures this and context.

    // In the anonymous function, call Function.prototype.apply on this, passing the context.
    // this.apply(obj);
    let that = this;
    return function () { that.apply(obj)};
}

const boundTurnOn = turnOn.bind(lamp);
const myBoundTurnOn = turnOn.myBind(lamp);


boundTurnOn(); // should say "Turning on a lamp"
myBoundTurnOn(); // should say "Turning on a lamp"




Function.prototype.myPrint = function (obj) {
    // Return an arrow function.
    // The arrow function captures this and context.

    // In the anonymous function, call Function.prototype.apply on this, passing the context.
    // this.apply(obj);
    console.log(this);
    return function () { console.log(this) };
}

const myBoundPrint = turnOn.myPrint(lamp);

myBoundPrint();