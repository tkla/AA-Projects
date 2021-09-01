export default class FollowToggle {
    constructor(el) {
        this.userId = el.getAttribute("data-user-id");
        this.followState = el.getAttribute("data-initial-follow-state");
    }
}