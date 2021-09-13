const path = require("path");

module.exports = {
    entry: "./index/react_minesweeper.jsx",
    output: {
        path: path.resolve(__dirname),
        filename: "bundle.js"
    },
    devtool: "source-map", //keeps track of our original code location),
    resolve: {
        extensions: [".js", ".jsx", "*"]//eliminates need to specify files as .js
    },
    module: {
        rules: [{
            test: /\.jsx?$/,
            exclude: /(node_modules)/,
            use: {
                loader: 'babel-loader',
                options: {
                    presets: ['@babel/env', '@babel/react']
                }
            },
        }]
    }
}
