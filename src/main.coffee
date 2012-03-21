class SunspotsMatrix
	constructor: (input) ->
		[@numberOfResults, @matrixSize, @values...] = (parseInt(n) for n in input.split(' '))
		@buildMatrix()

	buildMatrix: ->
		@matrix = []
		rows = [0..@matrixSize-1]
		for row in rows
			sliceIndex = row*@matrixSize
			@matrix.push(@values.slice(sliceIndex, sliceIndex+@matrixSize))

	getHotSpotScore: (x, y) ->
		total = 0
		xRanges = [x-1..x+1]
		yRanges = [y-1..y+1]

		for yy in xRanges when @inMatrixRange(yy)
			for xx in yRanges when @inMatrixRange(xx)
				total+=@matrix[xx][yy]

		total

	inMatrixRange: (point) -> point>=0 and point<@matrixSize

	topScores: ->
		totals = []
		fullRange = [0..@matrixSize-1]

		for y in fullRange
			for x in fullRange
				totals.push([x, y, @getHotSpotScore(x,y)])

		"(#{t[0]}, #{t[1]} score:#{t[2]})" for t in totals.sort(@sortFunc).slice(0, @numberOfResults)

	sortFunc: (a,b) ->
		b[2]-a[2]


questionOne = new SunspotsMatrix("1 5 5 3 1 2 0 4 1 1 3 2 2 3 2 4 3 0 2 3 3 2 1 0 2 4 3")
console.log("Question one should be 26 (3,3) - actual = ", questionOne.topScores())

questionTwo = new SunspotsMatrix("3 4 2 3 2 1 4 4 2 0 3 4 1 1 2 3 4 4")
console.log("Question two should be 27 (1,2), 25 (1,1), 23 (2,2) - actual = ", questionTwo.topScores())