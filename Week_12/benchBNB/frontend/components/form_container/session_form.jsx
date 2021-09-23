import React from 'react'
import { Link } from 'react-router-dom';
import { Redirect } from 'react-router'

export default class SessionForm extends React.Component{
   constructor(props){
      super(props);

      this.state = {
         username: '',
         password: '',
         email: '',
      };

      this.handleSubmit = this.handleSubmit.bind(this);
      this.handleInput = this.handleInput.bind(this);
   }

   handleSubmit(e){
      this.props.processForm(this.state);
      this.setState({
         username: '',
         password: '',
         email: '',
      })
   }
   
   handleInput(type){
      return e => {
         this.setState({ [type]: e.currentTarget.value })
      }
   }

   render(){
      if (this.props.currentUser) {
         return (
            <Redirect to='/'/>
         )
      }

      let formHeader = <h2>Log in</h2>;
      let type = 'hidden';
      let link = <Link to='/signup'>Sign Up</Link>;

      if (this.props.formType === 'signUp'){
         formHeader = <h2>Sign Up</h2>
         type = 'text'
         link = <Link to='/login'>Login</Link>
      }

      return (
         <div>
            <form onSubmit={this.handleSubmit}> 
               {formHeader}
               <label> Username: 
                  <input type='text' value={this.state.username} onChange={this.handleInput('username')}/>
               </label>

               <label> Email: 
                  <input type={type} value={this.state.email} onChange={this.handleInput('email')}/>
               </label>

               <label> Password: 
                  <input type='text' value={this.state.password} onChange={this.handleInput('password')}/>
               </label>

               <input type='submit' value="Submit" />
            </form>

            <ul>
               {
                  this.props.errors.forEach( (error) =>(
                     <li>{error}</li>
                  ))
               }
            </ul>
            {link}
         </div>
      )
   }
}