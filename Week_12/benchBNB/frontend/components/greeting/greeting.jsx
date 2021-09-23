import React from 'react';
import { Link } from 'react-router-dom';

export default class Greeting extends React.Component {
   constructor(props){
      super(props);
      this.handleLogout = this.handleLogout.bind(this);
   }

   handleLogout(e){
      e.preventDefault();
      this.props.logout();
   }

   render(){
      let greeting = (
         <div>
            <Link to='/signup'>Sign Up</Link>
            <br/>
            <Link to='/login'>Login</Link>
         </div>
      );
      
      if (this.props.currentUser){
         greeting = (
            <div> 
               <span>Welcome {this.props.currentUser.username}!</span>
               <br/>
               <button onClick={this.handleLogout}>Logout</button>
            </div>
         )
      }
      
      return greeting
   }
}