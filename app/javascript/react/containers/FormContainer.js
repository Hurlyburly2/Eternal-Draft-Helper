import React, { Component } from 'react'
import { Link } from 'react-router'

import { connect } from 'react-redux'
import { postImage } from '../modules/packs'

class FormContainer extends Component {  
  constructor(props) {
    super(props)
    this.handleSubmit = this.handleSubmit.bind(this)
  }
  
  handleSubmit(event) {
    event.preventDefault()
    const form = document.querySelector("#my_form");
    const formData = new FormData(form);
    
    this.props.postImage(formData)
  }
  
  render() {
    let handleSubmitForm = () => {
      this.submitForm();
    }
    
    let outputText = ""
    if (this.props.returnedText != null) {
      outputText = this.props.returnedText.map((card_name) => {
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

const mapStateToProps = (state) => {
  return {
    returnedText: state.packs.returnedText
  }
}

const mapDispatchToProps = (dispatch) => {
  return {
    postImage: (image) => dispatch(postImage(image))
  }
}

export default connect(
    mapStateToProps,
    mapDispatchToProps
)(FormContainer)
