export default class Bird {
    constructor(dimensions) {
      this.velocity = 0;
      this.dimensions = dimensions;
      this.gravity = 0.5;
    }
  
    drawBird(ctx) {
      ctx.fillStyle = "yellow";
      ctx.fillRect(this.dimensions.width/3, this.dimensions.height/2, 40, 30);
    }
  
    animate(ctx){
      this.drawBird(ctx);
      this.move();
    }

    move(){
        this.y = this.velocity + this.gravity;
    }

    flap(){
        this.velocity = -8;
    }

}