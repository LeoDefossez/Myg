Class {
	#name : 'SGBombTest',
	#superclass : 'TestCase',
	#instVars : [
		'board'
	],
	#category : 'Myg-SameGame-Tests',
	#package : 'Myg-SameGame-Tests'
}

{ #category : 'running' }
SGBombTest >> setUp [
	super setUp.
	board := SGBoard new.
	SGGame new board: board.
]

{ #category : 'tests' }
SGBombTest >> testClickOnBombAndAllAroundDisappear [

	| graphicBoard |
	"Y: Yellow , B: Blue , G: Green , R: Red , Bo : Bombe
	represents this grid:
	 | R | Y | r  | r | r |
	 | B | y | b  | r | r |
	 | G | y | Bo | r | r |
	 | B | y | b  | r | r |
	 | B | g | y  | b | r |
	"
	board configureGrid: ((CTNewArray2D width: 5 height: 5)
			 at: 1 @ 1 put: SGBox red;
			 at: 2 @ 1 put: SGBox yellow;
			 at: 3 @ 1 put: SGBox red;
			 at: 4 @ 1 put: SGBox red;
			 at: 5 @ 1 put: SGBox red;
			 at: 1 @ 2 put: SGBox blue;
			 at: 2 @ 2 put: SGBox yellow;
			 at: 3 @ 2 put: SGBox blue;
			 at: 4 @ 2 put: SGBox red;
			 at: 5 @ 2 put: SGBox red;
			 at: 1 @ 3 put: SGBox green;
			 at: 2 @ 3 put: SGBox yellow;
			 at: 3 @ 3 put: SGBox bomb;
			 at: 4 @ 3 put: SGBox red;
			 at: 5 @ 3 put: SGBox red;
			 at: 1 @ 4 put: SGBox blue;
			 at: 2 @ 4 put: SGBox yellow;
			 at: 3 @ 4 put: SGBox blue;
			 at: 4 @ 4 put: SGBox red;
			 at: 5 @ 4 put: SGBox red;
			 at: 1 @ 5 put: SGBox blue;
			 at: 2 @ 5 put: SGBox green;
			 at: 3 @ 5 put: SGBox yellow;
			 at: 4 @ 5 put: SGBox blue;
			 at: 5 @ 5 put: SGBox red;
			 yourself).
			
	board hitBoxOnx: 3 y: 3.


	"Y: Yellow , B: Blue , G: Green , R: Red , Bo : Bombe
	represents this grid:
	 | R | Y | r  | r | r |
	 | B | y | b  | r | r |
	 | G | y | Bo | r | r |
	 | B | y | b  | r | r |
	 | B | g | y  | b | r |
	"

	self assert: (board grid at: 3 @ 1) literal equals: 'R'.
	self assert: (board grid at: 3 @ 2) literal equals: 'Y'.
	self assert: (board grid at: 3 @ 3) literal equals: 'N'.

	self assert: (board grid at: 2 @ 1) literal equals: 'Y'.
	self assert: (board grid at: 2 @ 2) literal equals: 'G'.
	self assert: (board grid at: 2 @ 3) literal equals: 'N'.

	self assert: (board grid at: 4 @ 1) literal equals: 'R'.
	self assert: (board grid at: 4 @ 2) literal equals: 'B'.
	self assert: (board grid at: 4 @ 3) literal equals: 'N'
]

{ #category : 'tests' }
SGBombTest >> testClickOnBombWithNullAroundDoesNotThrowAnyThing [

	| graphicBoard |
	"Y: Yellow , B: Blue , G: Green , R: Red , Bo : Bomb
	represents this grid:

	 | Bo |

	"
	board configureGrid: ((CTNewArray2D width: 1 height: 1)
			 at: 1 @ 1 put: SGBox bomb;
			 yourself).

	board hitBoxOnx: 1 y: 1
]
