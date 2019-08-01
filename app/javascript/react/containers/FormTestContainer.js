import React, { Component } from 'react'
import { Link } from 'react-router'

class FormTestContainer extends Component {  
  constructor(props) {
    super(props)
    this.state = {
      returned_text: null
    }
    this.handleSubmit = this.handleSubmit.bind(this)
  }
  
  handleSubmit(event) {
    event.preventDefault()
    const form = document.querySelector("#my_form");
    const formData = new FormData(form);
    
    fetch('/api/v1/screenshots', {
      method: "POST",
      body: formData,
      credentials: 'same-origin'
    })
    .then(response => {
      if (response.ok) {
        return response
      } else {
        let errorMessage = `${response.status} (${response.statusText})`,
        error = new Error(errorMessage)
        throw error
      }
    })
    .then(response => response.json())
    .then(response => {
      this.setState({
        returned_text: response.returned_text
      })
    })
  }
  
  render() {
    let handleSubmitForm = () => {
      this.submitForm();
    }
    
    let outputText = ""
    if (this.state.returned_text != null) {
      outputText = this.state.returned_text.map((card_name) => {
        return <p>{card_name}</p>
      })
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
          {outputText}
        </form>
        
        <div id="results" />
      </div>
    )
  }
}

export default FormTestContainer;
