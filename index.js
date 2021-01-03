const http = require('http')

const server = http.createServer((req, res) => {
  res.write('OK', 'utf-8')
  res.end()
})

const port = 8080

server.listen(port, () => {
  console.log(`Server listening on port ${port}`)
})
