import React, { Component } from 'react'
import { Link } from 'react-router'

import { connect } from 'react-redux'

class PackResultContainer extends Component {
  constructor(props) {
    super(props)
  }
  
  render() {
    
    let outputText = ""
    if (this.props.returnedCards != null) {
      let card_keys = Object.keys(this.props.returnedCards)
      outputText = card_keys.map((card_id) => {
        let current_card = this.props.returnedCards[card_id]
        let rating_keys = Object.keys(current_card.ratings)
        
        let ratings = rating_keys.map((rating_id) => {
          return <li>{current_card.ratings[rating_id].rating_system_name}: {current_card.ratings[rating_id].rating}</li>
        })
        
        return <div>
                  <ul>
                    <li><img src={current_card.card.small_image_url} /></li>
                    <li>{current_card.card.name}</li>
                    <li>Mana Cost: 4</li>
                    <li>Ratings: <ul>
                                    {ratings}
                                  </ul>
                                  </li>
                  </ul>
                </div>
      })
    }
    
    return(
      <div className="container">
        <div className="row">
          <div className="col-md2-1">
          </div>
          <div className="col-m2-10">
            <h1>Pack Result Container</h1>
            {outputText}
          </div>
          <div className="col-md-1">
          </div>
        </div>
      </div>
    )
  }
}

const mapStateToProps = (state) => {
  return {
    returnedCards: state.packs.returnedCards
  }
}

export default connect(
  mapStateToProps,
  null
)(PackResultContainer)
