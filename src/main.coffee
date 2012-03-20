class SunspotsMatrix
	constructor: (input) ->
		[@numberOfResults, @matrixSize, @values...] = (parseInt(n) for n in input.split(' '))
		@buildMatrix()

	buildMatrix: ->
		@matrix = []
		rows = [0..@matrixSize-1]
		for row in rows
			sliceIndex = row*@matrixSize
			cut = @values.slice(sliceIndex, sliceIndex+@matrixSize)
			@matrix.push(cut)
		
			
foo = new SunspotsMatrix("1 5 5 3 1 2 0 4 1 1 3 2 2 3 2 4 3 0 2 3 3 2 1 0 2 4 3")