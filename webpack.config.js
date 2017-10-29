module.exports = {
    entry: './build/app.js',
    output: {
        path: '/build',
        filename: 'app.bundle.js'
    },
    module: {
      loaders: [{
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'babel-loader'
      }]
    }
};
