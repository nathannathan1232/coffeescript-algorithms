###
# Here is the Leibniz formula for pi
# https://en.wikipedia.org/wiki/Leibniz_formula_for_%CF%80
# 
# This formula is very simple, but takes a long time to come up with
# an accurate number. It also occasionally includes wrong numbers after the point
# where it should have them right.
###

math = require('mathjs')

math.config({
	number: 'BigNumber',
	precision: 1000
})

leibniz = (n) ->
	res = math.eval '0'

	for i in [0...n]
		res = math.add res, math.eval "(-1)^(#{i}) / (2 * #{i} + 1)"

	math.eval "4 * #{res}"

# Export the function
if typeof module is 'object' and module.exports
	module.exports = leibniz
else if window
	window.leibniz = leibniz
else if typeof define is 'function' and define.amd
	define [], -> leibniz
