module.exports =

  entry:
    app: [
      "./app.coffee"
    ]
  output:
    path: __dirname
    filename: "app.js"
  resolve:
    moduleDirectories: ['node_modules']
    extensions: ['', '.coffee', '.webpack.js', '.web.js', '.js']
  module:
    loaders: [
      test: /app\.coffee$/
      loaders: ["react-hot", "coffee", "cjsx"]
      exclude: "node_modules"
    ,
      test: /index\.coffee$/
      loaders: ["coffee"]
      exclude: "node_modules"
    ]
  devtool: "eval-source-map"
