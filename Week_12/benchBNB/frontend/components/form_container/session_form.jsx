import React from 'react'

export default class SessionForm extends React.Component{
   constructor(props){
      super(props);

      this.state = {
         username: "",
         pasword: '',
         email: '',
      };
      this.handleSubmit = this.handleSubmit.bind(this);
   }

   handleSubmit(e){
      e.preventDefault();
      this.props.processForm(this.state);
   }

   render(){
      let formHeader = "";
      let type = 'hidden';

      if (this.props.formType === 'signUp'){
         formHeader = <h2>Sign Up</h2>
         type = 'text'
      }else {
         formHeader = <h2>Login</h2>
      }

      return (
         <div>
            <form> 
               {formHeader}
               <label> Username: 
                  <input type='text' value={this.state.username}/>
               </label>

               <label> Email: 
                  <input type={type} value={this.state.password}/>
               </label>

               <label> Password: 
                  <input type='text' value={this.state.password}/>
               </label>

               <input type='submit' value="Submit" onClick={this.handleSubmit}/>
            </form>
         </div>
      )
   }
}