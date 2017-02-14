###
# Calculates digits of pi using the Borwein Algorithm
# https://en.wikipedia.org/wiki/Borwein%27s_algorithm
# 
# Each iteration of the formula adds 25 correct digits
# This function ensures that every digit returned is accurate
###

math = require('mathjs')

math.config({
	number: 'BigNumber',
	precision: 1000
})

borwein = (n) ->
	a = math.eval '212175710912 * sqrt(61) + 1657145277365'
	b = math.eval '13773980892672 * sqrt(61) + 107578229802750'
	c = math.eval '(5280(236674 + 30303 * sqrt(61)))^3'
	res = 0

	# Calculate pi. 25 digits added per iteration
	for i in [0...n]
		equation = "
			((-1)^#{i} * (6 * #{i})! * (#{a} + #{i} * #{b})) /
			((#{i}!)^3 * (3 * #{i})! * #{c}^(#{i} + .5))
		"
		res = math.add(res, math.eval equation)

	# Slice the result so we don't have any extra innacurate digits
	(math.eval('1 / (' + res + ' * 12)')+'').slice(0, n * 25)

# Export the function
if typeof module is 'object' and module.exports
	module.exports = borwein
else if window
	window.borwein = borwein
else if typeof define is 'function' and define.amd
	define [], -> borwein