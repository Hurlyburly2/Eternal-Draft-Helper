import React from 'react'
import { Router, Route, IndexRoute, browserHistory } from 'react-router'

import FormTestComponent from '../containers/FormTestContainer'

export const App = (props) => {
  return (
    <Router history={browserHistory}>
      <Route path = '/' component={FormTestComponent} />
    </Router>
  )
}

export default App
