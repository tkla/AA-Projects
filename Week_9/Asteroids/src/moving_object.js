function MovingObject(options) {
    this.pos = options.pos; 
    this.vel = options.vel;
    this.radius = options.radius;
    this.color = options.color;
    this.game = options.game;
}

 MovingObject.prototype.draw = function(ctx){
    ctx.beginPath(); 
    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, Math.PI *2, false);
    ctx.strokeStyle = this.color;
    ctx.stroke(); 
    ctx.fillStyle = this.color; 
    ctx.fill();
}

MovingObject.prototype.move = function(){
    this.pos[0] += this.vel[0];
    this.pos[1] += this.vel[1];
    this.pos = this.game.wrap(this.pos);
}

MovingObject.prototype.isCollideWith = function(other) {
    let x_1 = this.pos[0];
    let y_1 = this.pos[1];
    let x_2 = other.pos[0];
    let y_2 = other.pos[1];
    let dist = Math.sqrt((x_1 - x_2) ** 2 + (y_1 - y_2) ** 2);

    return (dist < ((this.radius + other.radius) / 2));
}

module.exports = MovingObject;