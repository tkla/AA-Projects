import React from 'react';

/*
Export a `ReportForm` presentational component that creates a form to either
create or edit a report (it will be used by two separate containers). The form
should indicate whether it is a create or edit form based on the `formType`
prop. The form should initialize state to the `report` passed in from props. Use
controlled inputs and trigger the `action` passed in from the container upon
submission. Use a text input for the understanding field and a textarea for the
improvement field.
*/

export default class ReportForm extends React.Component{
   constructor(props){
      super(props)
      this.state = this.props.report;
      this.handleChange = this.handleChange.bind(this);
      this.handleSubmit = this.handleSubmit.bind(this);
   }

   handleSubmit(){
      this.props.action(this.state)
   }

   handleChange(type){
      return (e) => {
         this.setState({
            [type] : e.currentTarget.value,
         })
      }
   }

   render(){
      return(
         <div>
            <h1>{this.props.formType}</h1>

            <form onSubmit={this.handleSubmit}> 
               <input 
                  type='text' 
                  value={this.state.understanding} 
                  onChange={this.handleChange('understanding')}>
               </input>

               <textarea 
                  value={this.state.improvement} 
                  onChange={this.handleChange('improvement')}>
               </textarea>

               <input type='submit' value="Submit"></input>
            </form>
         </div>
      )
   }
}