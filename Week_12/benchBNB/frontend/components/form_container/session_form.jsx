import React from 'react'
import { Link } from 'react-router-dom';

export default class SessionForm extends React.Component{
   constructor(props){
      super(props);

      this.state = {
         username: '',
         pasword: '',
         email: '',
      };

      this.handleSubmit = this.handleSubmit.bind(this);
      this.handleInput = this.handleInput.bind(this);
   }

   handleSubmit(e){
      e.preventDefault();
      const user = Object.assign({}, this.state)
      this.props.processForm(user);
   }
   
   handleInput(e){
      e.preventDefault();
      //let nextState = Object.assign({}, this.state);

      switch (e.target.id) {
         case 'username' : 
            this.setState({username: e.target.value}) ;
         case 'password':
            this.setState({password: e.target.value}) ;
         case 'email':
            this.setState({email: e.target.value}) ;
         default: 
            
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
            <form> 
               {formHeader}
               <label> Username: 
                  <input id='username' type='text' value={this.state.username} onChange={this.handleInput}/>
               </label>

               <label> Email: 
                  <input id='email' type={type} value={this.state.password} onChange={this.handleInput}/>
               </label>

               <label> Password: 
                  <input id='text' type='text' value={this.state.password} onChange={this.handleInput}/>
               </label>

               <input type='submit' value="Submit" onSubmit={this.handleSubmit}/>
            </form>

            {/* <p>{this.props.errors}</p> */}

            {/* {link} */}
         </div>
      )
   }
}