###
# This file contains the quadratically converging version of the Borwein algorithm
# 
# Each iteration quadrupels the number of correct digits
# This function returns more digits than it should. To ensure a perfectly accurate
# number, use a high amount of iterations.
###

math = require('mathjs')

math.config({
	number: 'BigNumber',
	precision: 1000
})

# n is how many iterations you want
quadraticPi = (n) ->
	a = math.eval '2(sqrt(2) - 1)^2'
	y = math.eval 'sqrt(2) - 1'

	for i in [0...n]
		y = math.eval "(1 - (1 - (#{y})^4)^.25) / (1 + (1 - (#{y})^4)^.25)"

		a = math.eval "#{a}(1 + #{y})^4 - 2^(2 * #{i} + 3) * #{y}(1 + #{y} + (#{y})^2)"
	math.eval "1 / #{a}"

# Export the function
if typeof module is 'object' and module.exports
	module.exports = quadraticPi
else if window
	window.quadraticPi = quadraticPi
else if typeof define is 'function' and define.amd
	define [], -> quadraticPi