# redux-staythere

_Ask your store to stay there, in localStorage._

### Installation

First you need to install: `npm i -S redux-staythere` or `npm install --save redux-staythere`

Then, you need to compose:

~~~coffee
# In your project, where you init your store
store = stayThere()(createStore) reducer
# ~ or ~
store = compose(applyMiddleware(thunk), stayThere('debug42'))(reducer)
~~~

And you are all done :smile:


You can also check the [demo](http://xouabita.github.io/redux-staythere/example/). Don't forget to reload,
to see the magic. :tophat:
