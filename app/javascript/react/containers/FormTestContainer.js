import React, { Component } from 'react'
import { Link } from 'react-router'

class FormTestContainer extends Component {  
  constructor(props) {
    super(props)
    this.state = {
      
    }
    this.handleSubmit = this.handleSubmit.bind(this)
  }
  
  
  
  // const results = document.querySelector("#results");
  
  handleSubmit(event) {
    event.preventDefault()
    const form = document.querySelector("#my_form");
    const formData = new FormData(form);
    
    fetch('/api/v1/screenshots', {
      method: "POST",
      body: formData,
      credentials: 'same-origin'
    });
    
    
      // Select your input type file and store it in a variable
      // const input = document.getElementById('image_upload');
      // 
      // debugger
      // 
      // // This will upload the file after having read it
      // const upload = (file) => {
      //   fetch('/api/v1/screenshots', { // Your POST endpoint
      //     method: 'POST',
      //     // headers: {
      //     //   // Content-Type may need to be completely **omitted**
      //     //   // or you may need something
      //     // },
      //     body: file // This is your file object
      //   }).then(
      //     response => response.json() // if the response is a JSON object
      //   ).then(
      //     success => console.log(success) // Handle the success response object
      //   ).catch(
      //     error => console.log(error) // Handle the error response object
      //   );
      // };
      // 
      // // Event handler executed when a file is selected
      // const onSelectFile = () => upload(input.files[0]);
      // 
      // // Add a listener on your input
      // // It will be triggered when a file will be selected
      // input.addEventListener('change', onSelectFile, false);
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
