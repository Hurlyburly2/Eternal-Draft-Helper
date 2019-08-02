import React, { Component } from 'react'
import { Link } from 'react-router'

import FormContainer from './FormContainer'

class PackRaterMain extends Component {
  constructor(props) {
    super(props)
  }
  
  render() {
    return(
      <div className="container">
        <div className="row">
          <div className="col-md2-1">
          </div>
          <div className="col-m2-10">
            <h3>Upload a Screenshot of a Draft Image Below:</h3>
            <FormContainer />
          </div>
          <div className="col-md-1">
          </div>
        </div>
      </div>
    )
  }
}

export default PackRaterMain
