module.exports = {
    resolve: {
        alias: {
            jquery: "jquery/src/jquery"
        }
    }
    module: {
    rules: [
      {
        test: /\.css$/,
        use: [ 'style-loader', 'css-loader' ]
      }
    ]
  }
};
