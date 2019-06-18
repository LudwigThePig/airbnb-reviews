const path = require('path');
const webpack = require('webpack');
const MiniCSS = require('mini-css-extract-plugin');
const BundleAnalyzerPlugin = require('webpack-bundle-analyzer').BundleAnalyzerPlugin;

module.exports = {
    mode: 'development',
    resolve: { extensions: [".jsx", ".js", ".json"] },
    entry: ['./client/ssrIndex.jsx'],
    output: {
        path: path.resolve(__dirname, 'public'),
        filename: 'bundle.js',
        publicPath: '/'
    },
    module: {
        rules: [
            {
                test: /\.js$/,
                loader: 'babel-loader',
                include: path.resolve(__dirname, 'client'),
                exclude: /node_modules/,
                options: {
                    presets: [['env', { modules: false }], 'react'],
                    plugins: [
                        ['transform-object-rest-spread', { useBuiltIns: true }],
                        'transform-class-properties'
                    ]
                }
            },
            {
              test: /\.jsx$/,
              loader: 'babel-loader',
              exclude: /node_modules/,
          },
            {
                test: /\.scss$/,
                use: [
                  {loader: MiniCSS.loader},
                  'css-loader',
                  'sass-loader'
                ]
                // use: ExtractTextPlugin.extract(['css-loader', 'sass-loader'])
            },
            {
                test: /\.css$/,
                use: [
                  {loader: MiniCSS.loader},
                  'css-loader',
                  'sass-loader'
                ]
                // use: ExtractTextPlugin.extract(['css-loader'])
            },
            {
                test: /\.(jpg|png|svg|gif|pdf)$/,
                loader: 'file-loader',
                options: {
                    name: '[path][name].[ext]'
                }
            }
        ]
    },
    plugins: [
        new webpack.IgnorePlugin(/^\.\/locale$/, /moment$/),
        new MiniCSS({
          filename: '[name].css',
          chunkFilename: '[id].css'
        }),
        new BundleAnalyzerPlugin(),
        new webpack.DefinePlugin({
            'process.env': {
              'NODE_ENV': JSON.stringify('production')
            }
          }),
    ]
};