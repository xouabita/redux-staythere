{ createStore }       = require 'redux'
{ Provider, connect } = require 'react-redux'
React                 = require 'react'

stayThere = require '../index'

counter = (state = 0, action) ->
  switch action.type
    when 'INCREMENT' then return state+1
    when 'DECREMENT' then return state-1
    else return state

store = stayThere()(createStore) counter

#### React classes
{ Component } = React

class App extends Component

  render: ->
    <div>
      <button id="minus" onClick={ => @props.dispatch type: 'DECREMENT' }>--</button>
      <button id="plus" onClick={ => @props.dispatch type: 'INCREMENT' }>++</button>
      <br/>
      <p>Counter: <span id="value">{@props.counter}</span></p>
    </div>

AppContainer = connect((state) -> counter: state) App

React.render(
  <Provider store={store}>
    { -> <AppContainer /> }
  </Provider>
, document.getElementById 'app')
