###
# Sorting algorithms
###

bubbleSort = require('./bubblesort.js')

array = Array(100)

array[i] = Math.random() for i in [0...array.length]
bubbleSort array
console.log array[0...5]