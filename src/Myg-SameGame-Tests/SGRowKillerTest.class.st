Class {
	#name : 'SGRowKillerTest',
	#superclass : 'TestCase',
	#instVars : [
		'board'
	],
	#category : 'Myg-SameGame-Tests-Model',
	#package : 'Myg-SameGame-Tests',
	#tag : 'Model'
}

{ #category : 'running' }
SGRowKillerTest >> setUp [
	super setUp.
	board := SGBoard new.
	SGGame new board: board.
]

{ #category : 'tests' }
SGRowKillerTest >> testClickOnRowKiller [

	"Y: Yellow , B: Blue , G: Green , R: Red , Lk : LineKiller
	represents this grid:
	 | R | R | Y  |
	 | B | Lk | Lk |
	 | Y | B | R |
	 
	"
	board fromString: '| R | R | Y  |
                      | B | Lk | Lk |
                      | Y | B | R |'.

	board hitBoxOnx: 2 y: 2.


	"Y: Yellow , B: Blue , G: Green , R: Red , Lk : LineKiller
	represents this grid:
	 | R | R | Y  |
	 | B | Lk | B |
	 | Y | B | R |
	 
	"

	self assert: (board grid at: 1 @ 1) literal equals: 'R'.
	self assert: (board grid at: 2 @ 1) literal equals: 'R'.
	self assert: (board grid at: 3 @ 1) literal equals: 'Y'.

	self assert: (board grid at: 1 @ 2) literal equals: 'Y'.
	self assert: (board grid at: 2 @ 2) literal equals: 'B'.
	self assert: (board grid at: 3 @ 2) literal equals: 'R'.

	self assert: (board grid at: 1 @ 3) literal equals: 'N'.
	self assert: (board grid at: 2 @ 3) literal equals: 'N'.
	self assert: (board grid at: 3 @ 3) literal equals: 'N'
]

{ #category : 'tests' }
SGRowKillerTest >> testClickOnRowKillerAndTheLineDisappear [

	"Y: Yellow , B: Blue , G: Green , R: Red , Lk : LineKiller
	represents this grid:
	 | R | R | Y  |
	 | B | Lk | B |
	 | Y | B | R |
	 
	"
	board fromString: '| R | R | Y  |
                      | B | Lk | B |
                      | Y | B | R |'.

	board hitBoxOnx: 2 y: 2.


	"Y: Yellow , B: Blue , G: Green , R: Red , Lk : LineKiller
	represents this grid:
	 | R | R | Y  |
	 | B | Lk | B |
	 | Y | B | R |
	 
	"

	self assert: (board grid at: 1 @ 1) literal equals: 'R'.
	self assert: (board grid at: 2 @ 1) literal equals: 'R'.
	self assert: (board grid at: 3 @ 1) literal equals: 'Y'.

	self assert: (board grid at: 1 @ 2) literal equals: 'Y'.
	self assert: (board grid at: 2 @ 2) literal equals: 'B'.
	self assert: (board grid at: 3 @ 2) literal equals: 'R'.

	self assert: (board grid at: 1 @ 3) literal equals: 'N'.
	self assert: (board grid at: 2 @ 3) literal equals: 'N'.
	self assert: (board grid at: 3 @ 3) literal equals: 'N'
]

{ #category : 'tests' }
SGRowKillerTest >> testClickOnRowKillerBesideOfanOtherLineKiller [

	"Y: Yellow , B: Blue , G: Green , R: Red , Lk : LineKiller
	represents this grid:
	 | R | R | Y  |
	 | B | Lk | Lk |
	 | Y | B | R |
	 
	"
	board fromString: '| R | R | Y  |
                      | B | Lk | Lk |
                      | Y | B | R |'.

	board hitBoxOnx: 2 y: 2.


	"Y: Yellow , B: Blue , G: Green , R: Red , Lk : LineKiller
	represents this grid:
	 | R | R | Y  |
	 | B | Lk | B |
	 | Y | B | R |
	 
	"

	self assert: (board grid at: 1 @ 1) literal equals: 'R'.
	self assert: (board grid at: 2 @ 1) literal equals: 'R'.
	self assert: (board grid at: 3 @ 1) literal equals: 'Y'.

	self assert: (board grid at: 1 @ 2) literal equals: 'Y'.
	self assert: (board grid at: 2 @ 2) literal equals: 'B'.
	self assert: (board grid at: 3 @ 2) literal equals: 'R'.

	self assert: (board grid at: 1 @ 3) literal equals: 'N'.
	self assert: (board grid at: 2 @ 3) literal equals: 'N'.
	self assert: (board grid at: 3 @ 3) literal equals: 'N'
]

{ #category : 'tests' }
SGRowKillerTest >> testClickOnRowKillerBetweenNull [
	"Y: Yellow , B: Blue , G: Green , R: Red , Lk : LineKiller
	represents this grid:
	 | R | R | Y  |
	 | B | Lk | Lk |
	 | Y | B | R |
	 
	"

	board fromString: '| R | R | Y  |
                      | B | Lk | Lk |
                      | Y | B | R |'.

	board hitBoxOnx: 2 y: 2.


	"Y: Yellow , B: Blue , G: Green , R: Red , Lk : LineKiller
	represents this grid:
	 | R | R | Y  |
	 | B | Lk | B |
	 | Y | B | R |
	 
	"

	self assert: (board grid at: 1 @ 1) literal equals: 'R'.
	self assert: (board grid at: 2 @ 1) literal equals: 'R'.
	self assert: (board grid at: 3 @ 1) literal equals: 'Y'.

	self assert: (board grid at: 1 @ 2) literal equals: 'Y'.
	self assert: (board grid at: 2 @ 2) literal equals: 'B'.
	self assert: (board grid at: 3 @ 2) literal equals: 'R'.

	self assert: (board grid at: 1 @ 3) literal equals: 'N'.
	self assert: (board grid at: 2 @ 3) literal equals: 'N'.
	self assert: (board grid at: 3 @ 3) literal equals: 'N'
]
