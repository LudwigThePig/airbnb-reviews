const path = require('path');
const webpack = require('webpack');
const nodeExternals = require('webpack-node-externals');

module.exports = {
    mode: 'development',
    target: 'node',
    externals: [nodeExternals()],
    entry: ['./server/app.js'],
    resolve: {
        extensions: ['*', '.js', '.jsx']
    },
    output: {
        path: path.resolve(__dirname),
        filename: 'coolerServer.js',
        publicPath: '/'
    },
    module: {
        rules: [
            {
                test: /.js$/,
                exclude: /node_modules/,
                loader: 'babel-loader',
                include: path.resolve(__dirname, 'client'),
                options: {
                    presets: [['env', { modules: false }], 'react'],
                    plugins: [
                        ['transform-object-rest-spread', { useBuiltIns: true }],
                        'transform-class-properties'
                    ]
                }
            },
            {
              test: /\.jsx?$/,
              loader: 'babel-loader',
              exclude: /node_modules/,
            },
            {
                test: /\.scss$/,
                loader: 'ignore-loader'
            },
            {
                test: /\.css$/,
                loader: 'ignore-loader'
            },
            {
                test: /\.(jpg|png|svg|gif|pdf)$/,
                loader: 'file-loader',
                options: {
                    name: '[path][name].[ext]'
                }
            }
        ]
    }
};