const HandleFollow = require("./api_util");

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