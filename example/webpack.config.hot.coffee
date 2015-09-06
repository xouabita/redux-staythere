config = require "./webpack.config.coffee"
config.entry.app.push "webpack/hot/dev-server"
module.exports = config
