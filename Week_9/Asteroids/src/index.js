console.log("Webpack is working!"); 

const MovingObject = require("./moving_object.js");
const Util = require("./util.js");
const Asteroid = require("./asteroid.js");
const Game = require("./game.js");

document.addEventListener("DOMContentLoaded", function() {
  const canvas = document.getElementById("asteroid_game");
  const ctx = canvas.getContext('2d');
  window.MovingObject = MovingObject;
  window.Util = Util;
  window.Asteroid = Asteroid;
  window.Game = Game;
});