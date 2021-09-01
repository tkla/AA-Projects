/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./frontend/api_util.js":
/*!******************************!*\
  !*** ./frontend/api_util.js ***!
  \******************************/
/***/ ((module) => {

const APIUtil = {
    followUser: id => {
        return $.ajax({
            url: `/users/${id}/follow`,
            method: 'post',
            
            success: function() {
                
            },
            error: function () {

            },

            dataType: 'JSON',
        })
    },
  
    unfollowUser: id => {
        return $.ajax({
            url: `/users/${id}/follow`,
            method: 'delete',
            
            success: function() {

            },
            error: function () {

            },

            dataType: 'JSON',
        })
    
    }
  };
  
  module.exports = APIUtil;

/***/ }),

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

const HandleFollow = __webpack_require__(/*! ./api_util */ "./frontend/api_util.js");

class FollowToggle {
    constructor(el) {
        this.userId = el.getAttribute("data-user-id");
        this.followState = el.getAttribute("data-initial-follow-state");

        this.el = el;
        this.render();
        this.handleClick();
    }

    render() {
        let text = "";

        if (this.followState === "followed") {
            text = "Unfollow!";
            $(".follow-toggle").removeAttr("disabled");
        } else if (this.followState === "unfollowed") {
            text = "Follow!";
            $(".follow-toggle").removeAttr("disabled");
        } else {
            $(".follow-toggle").prop("disabled", "true");
            text = "Processing";
        }
        this.el.innerHTML = text;
    }

    handleClick() {
        let that = this;
        this.el.addEventListener("click", function(event) {
            event.preventDefault();
            
            if (that.followState === "unfollowed"){
                that.followState = "following";
                that.render();

                HandleFollow.followUser(that.userId).then( response =>{
                    that.followState = "followed";
                    that.render();
                });
            }else{
                that.followState = "unfollowing";
                that.render();
                HandleFollow.unfollowUser(that.userId).then(response =>{ 
                    that.followState = "unfollowed";
                    that.render();
                });
            }
        })
    }
}

module.exports = FollowToggle;

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
var __webpack_exports__ = {};
// This entry need to be wrapped in an IIFE because it need to be isolated against other modules in the chunk.
(() => {
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
const FollowToggle = __webpack_require__(/*! ./follow_toggle */ "./frontend/follow_toggle.js");

document.addEventListener("DOMContentLoaded", function() {
    $(".follow-toggle").each(function(i, el){
        const toggle = new FollowToggle(el);
        
    })
});
})();

/******/ })()
;
//# sourceMappingURL=bundle.js.map