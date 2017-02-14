###
# Main pi file
# Running this file will produce pi calculated using various algorithms
###

borwein = require('./borwein.js')
quartic = require('./quartic-convergence.js')
leibniz = require('./leibniz.js')

console.log (borwein 3)+''
console.log (quartic 8)+''
console.log (leibniz 50000)+''
