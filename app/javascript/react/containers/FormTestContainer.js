import React, { Component } from 'react'
import { Link } from 'react-router'

class FormTestContainer extends Component {  
  constructor(props) {
    super(props)
    this.state = {
      
    }
    this.handleSubmit = this.handleSubmit.bind(this)
  }
  
  handleSubmit(event) {
    debugger
    event.preventDefault()
  }
  
  render() {
    let handleSubmitForm = () => {
      this.submitForm();
    }
    
    return(  
      <div>
         <form id="my_form" onSubmit={this.handleSubmit}>
          <input type="file" 
                 name="image" 
                 id="image_upload" 
                 accept="image/*" 
          />
          <input type="submit" value="Submit" />
        </form>
        
        <div id="results" />
      </div>
    )
  }
}

export default FormTestContainer;
