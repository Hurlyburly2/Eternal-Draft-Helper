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
    // if (this.props.returnedCards != null) {
    //   let card_keys = Object.keys(this.props.returnedCards)
    //   outputText = card_keys.map((card_id) => {
    //     let current_card = this.props.returnedCards[card_id]
    //     let rating_keys = Object.keys(current_card.ratings)
    // 
    //     let ratings = rating_keys.map((rating_id) => {
    //       return <li>{current_card.ratings[rating_id].rating_system_name}: {current_card.ratings[rating_id].rating}</li>
    //     })
    // 
    //     return <div>
    //               <ul>
    //                 <li><img src={current_card.card.small_image_url} /></li>
    //                 <li>{current_card.card.name}</li>
    //                 <li>Mana Cost: 4</li>
    //                 <li>Ratings: <ul>
    //                                 {ratings}
    //                               </ul>
    //                               </li>
    //               </ul>
    //             </div>
    //   })
    // }
    
    return(  
      <div>
        <h3>Upload a Screenshot of a Draft Image Below:</h3>
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
    returnedCards: state.packs.returnedCards
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
