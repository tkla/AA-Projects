console.log("Webpack is working!"); 

const MovingObject = require("./moving_object.js");
const Util = require("./util.js");
const Asteroid = require("./asteroid.js");
const Game = require("./game.js");
const GameView = require("./game_view.js");

document.addEventListener("DOMContentLoaded", function() {
  const canvas = document.getElementById("asteroid_game");
  const ctx = canvas.getContext('2d');
  window.MovingObject = MovingObject;
  window.Util = Util;
  window.Asteroid = Asteroid;
  window.Game = Game;
  const game = new Game(ctx);
  const gameview = new GameView(game, ctx);
  gameview.start();
});