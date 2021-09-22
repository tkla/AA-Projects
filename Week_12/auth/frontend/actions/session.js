import * as Session  from '../utils/session'

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER'
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER'

const receiveCurrentUser = user => ({
    type: RECEIVE_CURRENT_USER,
    user
});

const logoutCurrentUser = () => ({
    type: LOGOUT_CURRENT_USER
});

export const createNewUser = formUser => dispatch => Session.postUser(formUser)
    .then(user => dispatch(receiveCurrentUser(user)));

export const login = formUser => dispatch => Session.postSession(formUser)
    .then(user => dispatch(receiveCurrentUser(user)));

export const logout = () => dispatch => deleteSession.Session()
    .then(() => dispatch(logoutCurrentUser));