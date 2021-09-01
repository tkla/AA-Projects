const FollowToggle = require("./follow_toggle");

document.addEventListener("DOMContentLoaded", function() {
    $(".follow-toggle").each(function(i, el){
        const toggle = new FollowToggle(el);
        console.log("Hey");
    })
});