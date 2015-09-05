module.exports =

  entry:
    app: [
      "webpack/hot/dev-server"
      "./app.coffee"
    ]
  output:
    path: __dirname
    filename: "app.js"
  resolve:
    moduleDirectories: ['node_modules']
    extensions: ['', '.webpack.js', '.web.js', '.js', '.coffee']
  module:
    loaders: [
      test: /\.coffee$/
      loaders: ["react-hot", "coffee", "cjsx"]
      exclude: "node_modules"
    ]
  devtool: "eval-source-map"
