import React, { Component } from 'react'
import { Link } from 'react-router'

class FormTestContainer extends Component {  
  constructor(props) {
    super(props)
    this.state = {}
  }
  
  render() {
    return(  
      <div>
         <form id="my_form">
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
