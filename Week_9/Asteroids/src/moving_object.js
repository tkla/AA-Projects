function MovingObject(options) {
    this.pos = options.pos; 
    this.vel = options.vel;
    this.radius = options.radius;
    this.color = options.color;
}

 MovingObject.prototype.draw = function(ctx){
    ctx.beginPath(); 
    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, Math.PI *2, false);
    ctx.strokeStyle = "blue";
    ctx.stroke(); 
    ctx.fillStyle = "blue"; 
    ctx.fill();
}

MovingObject.prototype.move = function(){
    this.pos[0] += this.vel[0];
    this.pos[1] += this.vel[1];
}

module.exports = MovingObject;