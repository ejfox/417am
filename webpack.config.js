module.exports = {
    entry: './build/app.js',
    output: {
        path: '/build'
        ,filename: 'app.bundle.js'
        ,devtoolLineToLine: true
        ,sourceMapFilename: './build/app.bundle.js.map'
    },
    module: {
      loaders: [{
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'babel-loader'
      }]
    }
};
