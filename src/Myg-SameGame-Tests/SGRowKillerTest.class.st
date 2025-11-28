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

	| graphicBoard |
	"Y: Yellow , B: Blue , G: Green , R: Red , Lk : LineKiller
	represents this grid:
	 | R | R | Y  |
	 | B | Lk | Lk |
	 | Y | B | R |
	 
	"
	board configureGrid: ((CTNewArray2D width: 3 height: 3)
			 at: 1 @ 1 put: SGBox red;
			 at: 2 @ 1 put: SGBox red;
			 at: 3 @ 1 put: SGBox yellow;
			 at: 1 @ 2 put: SGBox blue;
			 at: 2 @ 2 put: SGBox lineKiller;
			 at: 3 @ 2 put: SGBox lineKiller;
			 at: 1 @ 3 put: SGBox yellow;
			 at: 2 @ 3 put: SGBox blue;
			 at: 3 @ 3 put: SGBox red;
			 yourself).

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

	| graphicBoard |
	"Y: Yellow , B: Blue , G: Green , R: Red , Lk : LineKiller
	represents this grid:
	 | R | R | Y  |
	 | B | Lk | B |
	 | Y | B | R |
	 
	"
	board configureGrid: ((CTNewArray2D width: 3 height: 3)
			 at: 1 @ 1 put: SGBox red;
			 at: 2 @ 1 put: SGBox red;
			 at: 3 @ 1 put: SGBox yellow;
			 at: 1 @ 2 put: SGBox blue;
			 at: 2 @ 2 put: SGBox lineKiller ;
			 at: 3 @ 2 put: SGBox blue;
			 at: 1 @ 3 put: SGBox yellow;
			 at: 2 @ 3 put: SGBox blue;
			 at: 3 @ 3 put: SGBox red;
			 yourself).

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

	| graphicBoard |
	"Y: Yellow , B: Blue , G: Green , R: Red , Lk : LineKiller
	represents this grid:
	 | R | R | Y  |
	 | B | Lk | Lk |
	 | Y | B | R |
	 
	"
	board configureGrid: ((CTNewArray2D width: 3 height: 3)
			 at: 1 @ 1 put: SGBox red;
			 at: 2 @ 1 put: SGBox red;
			 at: 3 @ 1 put: SGBox yellow;
			 at: 1 @ 2 put: SGBox blue;
			 at: 2 @ 2 put: SGBox lineKiller;
			 at: 3 @ 2 put: SGBox lineKiller;
			 at: 1 @ 3 put: SGBox yellow;
			 at: 2 @ 3 put: SGBox blue;
			 at: 3 @ 3 put: SGBox red;
			 yourself).


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

	| graphicBoard |
	"Y: Yellow , B: Blue , G: Green , R: Red , Lk : LineKiller
	represents this grid:
	 | R | R | Y  |
	 | B | Lk | Lk |
	 | Y | B | R |
	 
	"
	board configureGrid: ((CTNewArray2D width: 3 height: 3)
			 at: 1 @ 1 put: SGBox red;
			 at: 2 @ 1 put: SGBox red;
			 at: 3 @ 1 put: SGBox yellow;
			 at: 1 @ 2 put: SGBox null;
			 at: 2 @ 2 put: SGBox lineKiller;
			 at: 3 @ 2 put: SGBox null;
			 at: 1 @ 3 put: SGBox yellow;
			 at: 2 @ 3 put: SGBox blue;
			 at: 3 @ 3 put: SGBox red;
			 yourself).
			
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
