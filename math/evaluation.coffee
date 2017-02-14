###
# Converts infix notation to postfix notation and solves.
#
# No lexer is used so each token must be seperated by a space.
###

operate = (a, b, op) ->
	a = Number a
	b = Number b
	switch op
		when '+'
			Number a + Number b
		when '-'
			a - b
		when '*'
			a * b
		when '/'
			a / b
		when '**'
			a ** b
		when '%'
			a % b

operation_order = 
	'**': 5
	'*': 4, '/': 4, '%': 4
	'+': 3, '-': 3

find_order = (o) ->
	operation_order.indexOf o

parse = (input) ->
	input = input.split ' '

	res = ''
	stack = []
	for i in [0...input.length]
		ch = input[i]
		if ch.match /-{0,1}[0-9\.][0-9\.]*/
			res += ch + ' '
		else if ch is '('
			stack.push ch
		else if ch is ')'
			top = stack.pop()
			while top != '('
				res += top + ' '
				top = stack.pop()
		else
			while stack.length > 0 and operation_order[stack[stack.length - 1]] >= operation_order[ch]
				res += stack.pop() + ' '
			stack.push ch

	while stack.length > 0
		res += stack.pop() + ' '

	res = res.replace(///\ *$///, '')


post = (input) ->
	input = input.split ' '
	stack = []

	for i in input
		if i.match /[0-9]/
			stack.push Number i
		else
			values = []
			values.push stack.pop() for j in [0...2]
			stack.push operate values[1], values[0], i
	
	stack[stack.length - 1]
	
# Examples

console.log post parse '5 * ( 3 - 1)' # = 10
console.log post parse '1 + ( 3 + ( 5 - 1 ) ) * 2' # = 15
console.log post parse '3 + 22 - ( 1 + 1 )' # = 23
