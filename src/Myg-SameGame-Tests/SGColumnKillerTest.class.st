Class {
	#name : 'SGColumnKillerTest',
	#superclass : 'TestCase',
	#instVars : [
		'board'
	],
	#category : 'Myg-SameGame-Tests',
	#package : 'Myg-SameGame-Tests'
}

{ #category : 'running' }
SGColumnKillerTest >> setUp [
	super setUp.
	board := SGBoard new.
	SGGame new board: board.
]

{ #category : 'tests' }
SGColumnKillerTest >> testClickOnColumnKiller [

	| graphicBoard |
	"Y: Yellow , B: Blue , G: Green , R: Red , Cr: ColumnKiller
	resents this grid:
	 | R | R | Y  |
	 | B | Cr | B|
	 | Y | B | R |
	 
	"
	board configureGrid: ((CTNewArray2D width: 3 height: 3)
			 at: 1 @ 1 put: SGBox red;
			 at: 2 @ 1 put: SGBox red;
			 at: 3 @ 1 put: SGBox yellow;
			 at: 1 @ 2 put: SGBox blue;
			 at: 2 @ 2 put: SGBox columnKiller;
			 at: 3 @ 2 put: SGBox blue;
			 at: 1 @ 3 put: SGBox red;
			 at: 2 @ 3 put: SGBox blue ;
			 at: 3 @ 3 put: SGBox yellow;
			 yourself).

	board hitBoxOnx: 2 y: 2.


	"Y: Yellow , B: Blue , G: Green , R: Red , Cr: ColumnKiller
	resents this grid:
	 | R | R | Y  |
	 | B | Cr | B|
	 | Y | B | R |
	"

	self assert: (board grid at: 1 @ 1) literal equals: 'R'.
	self assert: (board grid at: 2 @ 1) literal equals: 'Y'.
	self assert: (board grid at: 3 @ 1) literal equals: 'N'.

	self assert: (board grid at: 1 @ 2) literal equals: 'B'.
	self assert: (board grid at: 2 @ 2) literal equals: 'B'.
	self assert: (board grid at: 3 @ 2) literal equals: 'N'.

	self assert: (board grid at: 1 @ 3) literal equals: 'R'.
	self assert: (board grid at: 2 @ 3) literal equals: 'Y'.
	self assert: (board grid at: 3 @ 3) literal equals: 'N'
]

{ #category : 'tests' }
SGColumnKillerTest >> testClickOnColumnKillerWithNullState [

	| graphicBoard |
	"Y: Yellow , B: Blue , G: Green , R: Red , Cr: ColumnKiller
	resents this grid:
	 | R | N | Y  |
	 | B | Cr | B|
	 | Y | N | R |
	 
	"
	board configureGrid: ((CTNewArray2D width: 3 height: 3)
			 at: 1 @ 1 put: SGBox red;
			 at: 2 @ 1 put: SGBox null;
			 at: 3 @ 1 put: SGBox yellow;
			 at: 1 @ 2 put: SGBox blue;
			 at: 2 @ 2 put: SGBox columnKiller;
			 at: 3 @ 2 put: SGBox blue;
			 at: 1 @ 3 put: SGBox red;
			 at: 2 @ 3 put: SGBox null;
			 at: 3 @ 3 put: SGBox yellow;
			 yourself).

	board hitBoxOnx: 2 y: 2.


	"Y: Yellow , B: Blue , G: Green , R: Red , Cr: ColumnKiller
	resents this grid:
	 | R | R | Y  |
	 | B | Cr | B|
	 | Y | B | R |
	"

	self assert: (board grid at: 1 @ 1) literal equals: 'R'.
	self assert: (board grid at: 2 @ 1) literal equals: 'Y'.
	self assert: (board grid at: 3 @ 1) literal equals: 'N'.

	self assert: (board grid at: 1 @ 2) literal equals: 'B'.
	self assert: (board grid at: 2 @ 2) literal equals: 'B'.
	self assert: (board grid at: 3 @ 2) literal equals: 'N'.

	self assert: (board grid at: 1 @ 3) literal equals: 'R'.
	self assert: (board grid at: 2 @ 3) literal equals: 'Y'.
	self assert: (board grid at: 3 @ 3) literal equals: 'N'
]

{ #category : 'tests' }
SGColumnKillerTest >> testClickOnColumnKillerWithOtherColumnKillerOnTheSameColumn [

	| graphicBoard |
	"Y: Yellow , B: Blue , G: Green , R: Red , Cr: ColumnKiller
	resents this grid:
	 | R | Cr | Y  |
	 | B | Cr | B|
	 | Y | Cr | R |
	 
	"
	board configureGrid: ((CTNewArray2D width: 3 height: 3)
			 at: 1 @ 1 put: SGBox red;
			 at: 2 @ 1 put: SGBox columnKiller;
			 at: 3 @ 1 put: SGBox yellow;
			 at: 1 @ 2 put: SGBox blue;
			 at: 2 @ 2 put: SGBox columnKiller;
			 at: 3 @ 2 put: SGBox blue;
			 at: 1 @ 3 put: SGBox red;
			 at: 2 @ 3 put: SGBox columnKiller;
			 at: 3 @ 3 put: SGBox yellow;
			 yourself).
			
	board hitBoxOnx: 2 y: 2.


	"Y: Yellow , B: Blue , G: Green , R: Red , Cr: ColumnKiller
	resents this grid:
	 | R | Cr | Y  |
	 | B | Cr | B|
	 | Y | Cr | R |
	"

	self assert: (board grid at: 1 @ 1) literal equals: 'R'.
	self assert: (board grid at: 2 @ 1) literal equals: 'Y'.
	self assert: (board grid at: 3 @ 1) literal equals: 'N'.

	self assert: (board grid at: 1 @ 2) literal equals: 'B'.
	self assert: (board grid at: 2 @ 2) literal equals: 'B'.
	self assert: (board grid at: 3 @ 2) literal equals: 'N'.

	self assert: (board grid at: 1 @ 3) literal equals: 'R'.
	self assert: (board grid at: 2 @ 3) literal equals: 'Y'.
	self assert: (board grid at: 3 @ 3) literal equals: 'N'
]
