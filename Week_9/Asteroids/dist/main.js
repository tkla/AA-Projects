/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./util */ \"./src/util.js\");\n\nfunction Asteroid(options) {\n  this.pos = options.pos;\n  this.color = \"red\";\n  this.radius = 10;\n  this.vec = Util.randomVec(500);\n  MovingObject.call(this, this);\n}\n\nUtil.inherits(MovingObject, Asteroid);\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\");\n\nfunction Game(ctx){\n  this.DIM_X = ctx.canvas.width;\n  this.DIM_Y = ctx.canvas.height;\n  this.NUM_ASTEROIDS = 3;\n  this.asteroids = [];\n  this.addAsteroids();\n}\n\nGame.prototype.randomPosition = function() {\n  let x = Math.floor(Math.random() * this.DIM_X);\n  let y = Math.floor(Math.random() * this.DIM_Y);\n  return [x, y];\n}\n\nGame.prototype.addAsteroids = function(){\n  for(let i = 0; i < this.NUM_ASTEROIDS; i++){\n    let a = new Asteroid({pos: this.randomPosition()});\n    console.log(a);\n    this.asteroids.push(a);\n  }\n}\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("console.log(\"Webpack is working!\"); \n\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\n\ndocument.addEventListener(\"DOMContentLoaded\", function() {\n  const canvas = document.getElementById(\"asteroid_game\");\n  const ctx = canvas.getContext('2d');\n  window.MovingObject = MovingObject;\n  window.Util = Util;\n  window.Asteroid = Asteroid;\n  window.Game = Game;\n});\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/***/ ((module) => {

eval("function MovingObject(options) {\n    this.pos = options.pos; \n    this.vel = options.vel;\n    this.radius = options.radius;\n    this.color = options.color;\n}\n\n MovingObject.prototype.draw = function(ctx){\n    ctx.beginPath(); \n    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, Math.PI *2, false);\n    ctx.strokeStyle = this.color;\n    ctx.stroke(); \n    ctx.fillStyle = this.color; \n    ctx.fill();\n}\n\nMovingObject.prototype.move = function(){\n    this.pos[0] += this.vel[0];\n    this.pos[1] += this.vel[1];\n}\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/util.js":
/*!*********************!*\
  !*** ./src/util.js ***!
  \*********************/
/***/ ((module) => {

eval("const Util = {\n  randomVec(length) {\n    const deg = 2 * Math.PI * Math.random();\n    return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n  },\n\n  scale(vec, m) {\n    return [vec[0] * m, vec[1] * m];\n  }\n  \n  //inherits(parentClass, childClass) {\n  //   function Surrogate() {};\n  //   Surrogate.prototype = parentClass.prototype;\n  //   childClass.prototype = new Surrogate();\n  //   childClass.prototype.constructor = childClass;\n  // }\n};\n\nUtil.inherits = function(parentClass, childClass) {\n  function Surrogate() {};\n  Surrogate.prototype = parentClass.prototype;\n  childClass.prototype = new Surrogate();\n  childClass.prototype.constructor = childClass;\n}\n\n\n//export default{Util};\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/util.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;