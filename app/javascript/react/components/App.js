import React from 'react'
import { Router, Route, IndexRoute, browserHistory } from 'react-router'
import { Provider } from 'react-redux'

import LandingPage from '../containers/LandingPage'
import FormContainer from '../containers/FormContainer'
import PackRaterMain from '../containers/PackRaterMain'

export const App = (props) => {
  return (
    <Provider store={props.store}>
      <Router history={browserHistory}>
        <Route path = '/' component={LandingPage} />
        <Route path = '/drafts' component={PackRaterMain} />
      </Router>
    </Provider>
  )
}

export default App
