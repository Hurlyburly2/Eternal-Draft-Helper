import React from 'react'
import { Router, Route, IndexRoute, browserHistory } from 'react-router'

import Main from '../containers/Main'
import FormContainer from '../containers/FormContainer'
import PackRaterMain from '../containers/PackRaterMain'

export const App = (props) => {
  return (
    <Router history={browserHistory}>
      <Route path = '/' component={Main} />
      <Route path = '/drafts' component={PackRaterMain} />
    </Router>
  )
}

export default App
