Class {
	#name : 'SGBombTest',
	#superclass : 'TestCase',
	#instVars : [
		'board'
	],
	#category : 'Myg-SameGame-Tests-Model',
	#package : 'Myg-SameGame-Tests',
	#tag : 'Model'
}

{ #category : 'running' }
SGBombTest >> setUp [
	super setUp.
	board := SGBoard new.
	SGGame new board: board.
]

{ #category : 'tests' }
SGBombTest >> testClickOnBombAndAllAroundDisappear [

	"Y: Yellow , B: Blue , G: Green , R: Red , Bo : Bomb
	represents this grid:
	 | R | Y | R  | R | R |
	 | B | Y | B  | R | R |
	 | G | Y | Bo | R | R |
	 | B | Y | B  | R | R |
	 | B | G | Y  | B | R |
	"
	board fromString: '| R | Y | R  | R | R |
                      | B | Y | B  | R | R |
                      | G | Y | Bo | R | R |
                      | B | Y | B  | R | R |
                      | B | G | Y  | B | R |'.
			
	board hitBoxOnx: 3 y: 3.


	"Y: Yellow , B: Blue , G: Green , R: Red , Bo : Bomb, N: Null
	represents this grid:
	 | R | Y | R  | R | R |
	 | B | Y | Y  | B | R |
	 | G | N | N  | N | R |
	 | B | N | N  | N | R |
	 | B | N | N  | N | R |
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
	"Y: Yellow , B: Blue , G: Green , R: Red , Bo : Bomb
	represents this grid:

	 | Bo |

	"

	board fromString: '|Bo|'.

	board hitBoxOnx: 1 y: 1
]
