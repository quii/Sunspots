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

		for yy in @area(y) when @inMatrixRange(yy)
			for xx in @area(x) when @inMatrixRange(xx)
				total+=@matrix[xx][yy]

		total

	topScores: ->
		totals = []
		fullRange = [0..@matrixSize-1]

		for y in fullRange
			for x in fullRange
				totals.push([x, y, @getHotSpotScore(x,y)])

		@formatResult(t) for t in totals.sort(@sortFunc).slice(0, @numberOfResults)
	
	inMatrixRange: (point) -> point>=0 and point<@matrixSize

	area: (point) -> [point-1, point, point+1]

	sortFunc: (a,b) -> b[2]-a[2]

	formatResult: (r) -> "(#{r[0]}, #{r[1]} score:#{r[2]})"


questionOne = new SunspotsMatrix("1 5 5 3 1 2 0 4 1 1 3 2 2 3 2 4 3 0 2 3 3 2 1 0 2 4 3")
console.log("Question one should be (3,3) 26 - actual = ", questionOne.topScores())

questionTwo = new SunspotsMatrix("3 4 2 3 2 1 4 4 2 0 3 4 1 1 2 3 4 4")
console.log("Question two should be (1,2) 27 , (1,1) 25 , (2,2) 23  - actual = ", questionTwo.topScores())