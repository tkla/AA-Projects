import React from "react";
import ReactDOM from "react-dom";
import Root from './components/root'
import configureStore from './store/store'

import * as Session from './actions/session_actions'

document.addEventListener("DOMContentLoaded", () => {
	let preloadedState = {};

   if (window.currentUser){
		preloadedState = {
			entities: {
				users: {
					[window.currentUser.id]: window.currentUser,
				}
			},
			session: {id: window.currentUser.id}
		};
		delete window.currentUser;
	} 

	const store = configureStore(preloadedState);

	//Debug
	// window.getState = store.getState;
	// window.dispatch = store.dispatch;
	// window.login = Session.login;
	// window.signUp = Session.signUp;
	// window.logOut = Session.logout;
	//-----

	
	const root = document.getElementById("root");
   ReactDOM.render(<Root store={store}/>, root);
});