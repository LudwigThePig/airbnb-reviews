const app = require('./app.js');
const port = 3004;

// Server Setup
app.listen(port, () => {
  console.log(`Listening on localhost:${port}`);
})