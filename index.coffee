assign = require 'object-assign'

module.exports = stayThere = (sessionId) ->

  sessionId = '0' if sessionId is undefined

  return (next) -> (reducer, initialState) ->

    finalState =
      if initialState then initialState
      else JSON.parse localStorage.getItem(sessionId)

    nextStore = next reducer, initialState

    customDispatch = (action) ->
      nextStore.dispatch action
      state = nextStore.getState()
      localStorage.setItem sessionId, JSON.stringify(state)

    return assign {}, nextStore, dispatch: customDispatch
