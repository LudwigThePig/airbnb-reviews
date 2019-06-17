const path = require('path');

const inputPath = path.join(__dirname, 'client', 'index.jsx');
const serverInputPath = path.join(__dirname, 'server', 'server.js')
const outputPath = path.join(__dirname, 'public');

const clientConfig = {
  entry: inputPath,
  output: {
    path: outputPath,
    filename: 'bundle.js'
  },
  resolve: {
    extensions: ['*', '.js', '.jsx']
  },
  mode: 'development',
  module: {
    rules: [
      {
        test: /.jsx?$/,
        loader: 'babel-loader'
      }, {
        test: /\.s?css$/,
        use: ['style-loader', 'css-loader', 'sass-loader']
      }
    ]
  },
  devServer: {
    port: 3004
  },
};

const serverConfig = {
  entry: serverInputPath,
  target: 'node',
  output: {
    path: __dirname,
    filename: 'server.js',
    libraryTarget: 'commonjs2'
  },
  devtool: 'cheap-module-source-map',
  module: {
    rules: [
      {
        test: /\.s?css$/,
        use: ['style-loader', 'css-loader', 'sass-loader']
      },
      {
        test: /js$/,
        exclude: /(node_modules)/,
        loader: "babel-loader",
        query: { presets: ["react-app"] }
      }
    ]
  }
}

module.exports = clientConfig//, serverConfig];