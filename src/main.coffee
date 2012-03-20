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
		ranges = [x-1..x+1]

		for xx in ranges
			for yy in ranges
				total+=@matrix[xx][yy]

		total

	topScores: ->
		#go through each possible value for x y (does this suck?)
		#sort them
		9000

			
questionOne = new SunspotsMatrix("1 5 5 3 1 2 0 4 1 1 3 2 2 3 2 4 3 0 2 3 3 2 1 0 2 4 3")
console.log("Question one should be 26 - actual = ", questionOne.getHotSpotScore(3,3))

questionTwo = new SunspotsMatrix("3 4 2 3 2 1 4 4 2 0 3 4 1 1 2 3 4 4")
console.log("Question two (i) should be 27 - actual = ", questionTwo.getHotSpotScore(1,2))
console.log("Question two (ii) should be 25 - actual = ", questionTwo.getHotSpotScore(1,1))
console.log("Question two (iii) should be 23 - actual = ", questionTwo.getHotSpotScore(2,2))