###
# Bubble sort function.
# This is one of the easiest sorting algorithms to implement.
###

swap = (arr, a, b) ->
	tmp = arr[a]
	arr[a] = arr[b]
	arr[b] = tmp

compare = (a, b) ->
	a - b

# Optionally, a custom compare function can be used. By default, the
# above function is used.
bubbleSort = (arr, cmp = compare) ->
	for i in [0...arr.length]
		for j in [i...0]
			if cmp(arr[j], arr[j - 1]) < 0
				swap arr, j, j - 1

	arr

# Export the function
if typeof module is 'object' and module.exports
	module.exports = bubbleSort
else if window
	window.bubbleSort = bubbleSort
else if typeof define is 'function' and define.amd
	define [], -> bubbleSort
