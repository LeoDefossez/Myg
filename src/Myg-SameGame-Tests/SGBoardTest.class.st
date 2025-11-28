"
A SGBoardTest is a test class for testing the behavior of SGBoard
"
Class {
	#name : 'SGBoardTest',
	#superclass : 'TestCase',
	#instVars : [
		'board'
	],
	#category : 'Myg-SameGame-Tests-Model',
	#package : 'Myg-SameGame-Tests',
	#tag : 'Model'
}

{ #category : 'running' }
SGBoardTest >> setUp [
	super setUp.

	board := SGBoard new.
	SGGame new board: board.
]

{ #category : 'tests' }
SGBoardTest >> testAddingBoardToGameAlsoAddGameToBoard [

	| board game |
	board := SGBoard new.
	game := SGGame new.

	game board: board.

	self assert: board game equals: game
]

{ #category : 'tests' }
SGBoardTest >> testAddingBoardToGameKnowingAnotherBoardDontWork [

	| game |
	game := SGGame new. 
	game board: SGBoard new.

	self should: [ SGBoard new game: game] raise: Error
	
]

{ #category : 'tests' }
SGBoardTest >> testClickAndCaseNothingAppend [

	"Y: Yellow , B: Blue , G: Green , R: Red
	represents this grid:
	 | B | Y | Y | 
	 | R | R | R | 
	 | B | G | G | 

	"
	board configureGrid: ((CTNewArray2D width: 3 height: 3)
			 at: 1 @ 1 put: SGBox blue;
			 at: 2 @ 1 put: SGBox yellow;
			 at: 3 @ 1 put: SGBox yellow;
			 at: 1 @ 2 put: SGBox red;
			 at: 2 @ 2 put: SGBox red;
			 at: 3 @ 2 put: SGBox red;
			 at: 1 @ 3 put: SGBox blue;
			 at: 2 @ 3 put: SGBox green;
			 at: 3 @ 3 put: SGBox green;
			 yourself).

	board hitBoxOnx: 1 y: 3.

	self assert: (board grid at: 1 @ 3) literal equals: 'B'
]

{ #category : 'tests' }
SGBoardTest >> testClickAndMultipleCaseDisappear [

	"Y: Yellow , B: Blue , G: Green , R: Red
	represents this grid:
	 | B | Y | Y | 
	 | R | R | R | 
	 | B | G | G | 

	"
	board configureGrid: ((CTNewArray2D width: 3 height: 3)
			 at: 1 @ 1 put: SGBox blue;
			 at: 2 @ 1 put: SGBox yellow;
			 at: 3 @ 1 put: SGBox yellow;
			 at: 1 @ 2 put: SGBox red;
			 at: 2 @ 2 put: SGBox red;
			 at: 3 @ 2 put: SGBox red;
			 at: 1 @ 3 put: SGBox blue;
			 at: 2 @ 3 put: SGBox green;
			 at: 3 @ 3 put: SGBox green;
			 yourself).

	board hitBoxOnx: 1 y: 2.

	self assert: (board grid at: 1 @ 1) literal equals: 'B'
]

{ #category : 'tests' }
SGBoardTest >> testClickAndOneColumnDisappear [

	"Y: Yellow , B: Blue , G: Green , R: Red
	represents this grid:
	 | R | Y | r | 
	 | B | y | b | 
	 | G | y | g | 
	"
	board configureGrid: ((CTNewArray2D width: 3 height: 3)
			 at: 1 @ 1 put: SGBox red;
			 at: 2 @ 1 put: SGBox yellow;
			 at: 3 @ 1 put: SGBox red;
			 at: 1 @ 2 put: SGBox blue;
			 at: 2 @ 2 put: SGBox yellow;
			 at: 3 @ 2 put: SGBox blue;
			 at: 1 @ 3 put: SGBox green;
			 at: 2 @ 3 put: SGBox yellow;
			 at: 3 @ 3 put: SGBox green;
			 yourself).

	board hitBoxOnx: 2 y: 2.

	self assert: (board grid at: 3 @ 1) literal equals: 'N'.
	self assert: (board grid at: 3 @ 2) literal equals: 'N'.
	self assert: (board grid at: 3 @ 3) literal equals: 'N'.

	self assert: (board grid at: 2 @ 1) literal equals: 'R'.
	self assert: (board grid at: 2 @ 2) literal equals: 'B'.
	self assert: (board grid at: 2 @ 3) literal equals: 'G'
]

{ #category : 'tests' }
SGBoardTest >> testClickOn2BlueBoxesColumnRearrange [
	"Y: Yellow , B: Blue , G: Green , R: Red, N : Null
	represents this grid:
	 | B | Y | G | 
	 | B | Y | G | 
	 | R | Y | N | 

	"

	board configureGrid: ((CTNewArray2D width: 3 height: 3)
			 at: 1 @ 1 put: SGBox blue;
			 at: 2 @ 1 put: SGBox yellow;
			 at: 3 @ 1 put: SGBox green;
			 at: 1 @ 2 put: SGBox blue;
			 at: 2 @ 2 put: SGBox yellow;
			 at: 3 @ 2 put: SGBox green;
			 at: 1 @ 3 put: SGBox red;
			 at: 2 @ 3 put: SGBox yellow;
			 at: 3 @ 3 put: SGBox null;
			 yourself).

	self assert: (board grid at: 1 @ 1) literal equals: 'B'.
	self assert: (board grid at: 1 @ 2) literal equals: 'B'.
	self assert: (board grid at: 1 @ 3) literal equals: 'R'.
	self assert: (board grid at: 2 @ 1) literal equals: 'Y'.
	self assert: (board grid at: 2 @ 2) literal equals: 'Y'.
	self assert: (board grid at: 2 @ 3) literal equals: 'Y'.
	self assert: (board grid at: 3 @ 1) literal equals: 'G'.
	self assert: (board grid at: 3 @ 2) literal equals: 'G'.
	self assert: (board grid at: 3 @ 3) literal equals: 'N'.

	board hitBoxOnx: 1 y: 1.

	self assert: (board grid at: 1 @ 1) literal equals: 'R'.
	self assert: (board grid at: 1 @ 2) literal equals: 'N'.
	self assert: (board grid at: 1 @ 3) literal equals: 'N'.
	self assert: (board grid at: 2 @ 1) literal equals: 'Y'.
	self assert: (board grid at: 2 @ 2) literal equals: 'Y'.
	self assert: (board grid at: 2 @ 3) literal equals: 'Y'.
	self assert: (board grid at: 3 @ 1) literal equals: 'G'.
	self assert: (board grid at: 3 @ 2) literal equals: 'G'.
	self assert: (board grid at: 3 @ 3) literal equals: 'N'
]

{ #category : 'tests' }
SGBoardTest >> testClickOn3YellowBoxesSwitchEmptyColumn [
	"Y: Yellow , B: Blue , G: Green , R: Red, N : Null
	represents this grid:
	 | B | Y | G | 
	 | B | Y | G | 
	 | R | Y | N | 

	"

	board configureGrid: ((CTNewArray2D width: 3 height: 3)
			 at: 1 @ 1 put: SGBox blue;
			 at: 2 @ 1 put: SGBox yellow;
			 at: 3 @ 1 put: SGBox green;
			 at: 1 @ 2 put: SGBox blue;
			 at: 2 @ 2 put: SGBox yellow;
			 at: 3 @ 2 put: SGBox green;
			 at: 1 @ 3 put: SGBox red;
			 at: 2 @ 3 put: SGBox yellow;
			 at: 3 @ 3 put: SGBox null;
			 yourself).

	self assert: (board grid at: 1 @ 1) literal equals: 'B'.
	self assert: (board grid at: 1 @ 2) literal equals: 'B'.
	self assert: (board grid at: 1 @ 3) literal equals: 'R'.
	self assert: (board grid at: 2 @ 1) literal equals: 'Y'.
	self assert: (board grid at: 2 @ 2) literal equals: 'Y'.
	self assert: (board grid at: 2 @ 3) literal equals: 'Y'.
	self assert: (board grid at: 3 @ 1) literal equals: 'G'.
	self assert: (board grid at: 3 @ 2) literal equals: 'G'.
	self assert: (board grid at: 3 @ 3) literal equals: 'N'.

	board hitBoxOnx: 2 y: 1.

	self assert: (board grid at: 1 @ 1) literal equals: 'B'.
	self assert: (board grid at: 1 @ 2) literal equals: 'B'.
	self assert: (board grid at: 1 @ 3) literal equals: 'R'.
	self assert: (board grid at: 2 @ 1) literal equals: 'G'.
	self assert: (board grid at: 2 @ 2) literal equals: 'G'.
	self assert: (board grid at: 2 @ 3) literal equals: 'N'.
	self assert: (board grid at: 3 @ 1) literal equals: 'N'.
	self assert: (board grid at: 3 @ 2) literal equals: 'N'.
	self assert: (board grid at: 3 @ 3) literal equals: 'N'
]

{ #category : 'tests' }
SGBoardTest >> testClickOnBlueCase [

	| resGrid |
	"| B B  |			   | G R | 
 | G R  |     =>  | N N |"
	board configureGrid: ((CTNewArray2D width: 2 height: 2)
			 at: 1 @ 1 put: SGBox blue;
			 at: 2 @ 1 put: SGBox blue;
			 at: 1 @ 2 put: SGBox green;
			 at: 2 @ 2 put: SGBox red;
			 yourself).

	resGrid := SGBoard new.
	resGrid configureGrid: ((CTNewArray2D width: 2 height: 2)
			 at: 1 @ 1 put: SGBox green;
			 at: 2 @ 1 put: SGBox red;
			 at: 1 @ 2 put: SGBox null;
			 at: 2 @ 2 put: SGBox null;
			 yourself).

	board hitBoxOnx: 1 y: 1.

	self assert: board grid size equals: resGrid grid size.
	self assert: (board grid at: 1 @ 1) state class equals: (resGrid grid at: 1 @ 1) state class. 
	self assert: (board grid at: 2 @ 1) state class equals: (resGrid grid at: 2 @ 1) state class
]

{ #category : 'tests' }
SGBoardTest >> testClickOnIsolatedBoxNothingChanges [
	"Y: Yellow , B: Blue , G: Green , R: Red, N : Null
	represents this grid:
	 | B | Y | G | 
	 | B | Y | G | 
	 | R | Y | N | 

	"

	board configureGrid: ((CTNewArray2D width: 3 height: 3)
			 at: 1 @ 1 put: SGBox blue;
			 at: 2 @ 1 put: SGBox yellow;
			 at: 3 @ 1 put: SGBox green;
			 at: 1 @ 2 put: SGBox blue;
			 at: 2 @ 2 put: SGBox yellow;
			 at: 3 @ 2 put: SGBox green;
			 at: 1 @ 3 put: SGBox red;
			 at: 2 @ 3 put: SGBox yellow;
			 at: 3 @ 3 put: SGBox null;
			 yourself).

	self assert: (board grid at: 1 @ 1) literal equals: 'B'.
	self assert: (board grid at: 1 @ 2) literal equals: 'B'.
	self assert: (board grid at: 1 @ 3) literal equals: 'R'.
	self assert: (board grid at: 2 @ 1) literal equals: 'Y'.
	self assert: (board grid at: 2 @ 2) literal equals: 'Y'.
	self assert: (board grid at: 2 @ 3) literal equals: 'Y'.
	self assert: (board grid at: 3 @ 1) literal equals: 'G'.
	self assert: (board grid at: 3 @ 2) literal equals: 'G'.
	self assert: (board grid at: 3 @ 3) literal equals: 'N'.

	board hitBoxOnx: 1 y: 3.

	self assert: (board grid at: 1 @ 1) literal equals: 'B'.
	self assert: (board grid at: 1 @ 2) literal equals: 'B'.
	self assert: (board grid at: 1 @ 3) literal equals: 'R'.
	self assert: (board grid at: 2 @ 1) literal equals: 'Y'.
	self assert: (board grid at: 2 @ 2) literal equals: 'Y'.
	self assert: (board grid at: 2 @ 3) literal equals: 'Y'.
	self assert: (board grid at: 3 @ 1) literal equals: 'G'.
	self assert: (board grid at: 3 @ 2) literal equals: 'G'.
	self assert: (board grid at: 3 @ 3) literal equals: 'N'
]

{ #category : 'tests' }
SGBoardTest >> testClickOnNullNothingChanges [
	"Y: Yellow , B: Blue , G: Green , R: Red, N : Null
	represents this grid:
	 | B | Y | G | 
	 | B | Y | G | 
	 | R | Y | N | 

	"

	board configureGrid: ((CTNewArray2D width: 3 height: 3)
			 at: 1 @ 1 put: SGBox blue;
			 at: 2 @ 1 put: SGBox yellow;
			 at: 3 @ 1 put: SGBox green;
			 at: 1 @ 2 put: SGBox blue;
			 at: 2 @ 2 put: SGBox yellow;
			 at: 3 @ 2 put: SGBox green;
			 at: 1 @ 3 put: SGBox red;
			 at: 2 @ 3 put: SGBox yellow;
			 at: 3 @ 3 put: SGBox null;
			 yourself).

	self assert: (board grid at: 1 @ 1) literal equals: 'B'.
	self assert: (board grid at: 1 @ 2) literal equals: 'B'.
	self assert: (board grid at: 1 @ 3) literal equals: 'R'.
	self assert: (board grid at: 2 @ 1) literal equals: 'Y'.
	self assert: (board grid at: 2 @ 2) literal equals: 'Y'.
	self assert: (board grid at: 2 @ 3) literal equals: 'Y'.
	self assert: (board grid at: 3 @ 1) literal equals: 'G'.
	self assert: (board grid at: 3 @ 2) literal equals: 'G'.
	self assert: (board grid at: 3 @ 3) literal equals: 'N'.

	board hitBoxOnx: 3 y: 3.

	self assert: (board grid at: 1 @ 1) literal equals: 'B'.
	self assert: (board grid at: 1 @ 2) literal equals: 'B'.
	self assert: (board grid at: 1 @ 3) literal equals: 'R'.
	self assert: (board grid at: 2 @ 1) literal equals: 'Y'.
	self assert: (board grid at: 2 @ 2) literal equals: 'Y'.
	self assert: (board grid at: 2 @ 3) literal equals: 'Y'.
	self assert: (board grid at: 3 @ 1) literal equals: 'G'.
	self assert: (board grid at: 3 @ 2) literal equals: 'G'.
	self assert: (board grid at: 3 @ 3) literal equals: 'N'
]

{ #category : 'tests' }
SGBoardTest >> testColonneIsEmpty [

	board configureGrid: ((CTNewArray2D width: 3 height: 3)
			 at: 1 @ 1 put: SGBox null;
			 at: 2 @ 1 put: SGBox yellow;
			 at: 3 @ 1 put: SGBox yellow;
			 at: 1 @ 2 put: SGBox null;
			 at: 2 @ 2 put: SGBox red;
			 at: 3 @ 2 put: SGBox red;
			 at: 1 @ 3 put: SGBox null;
			 at: 2 @ 3 put: SGBox green;
			 at: 3 @ 3 put: SGBox green;
			 yourself).

	self assert: (board isColumnEmpty: 1).
	self deny: (board isColumnEmpty: 2)
]

{ #category : 'tests' }
SGBoardTest >> testConvertABoardToStringWithNullState [
	"Y: Yellow , B: Blue , G: Green , R: Red , Mu : Multicolor
 represents this grid:
 | R | Y | r | r | r |
 | B | y | N | r | r |
 | N | y | Bo | r | r |
 | B | y | b | r | r |
 | B | g | y | b | N |
 "

	| board |
	board := SGBoard new.
	board configureGrid: ((CTNewArray2D width: 5 height: 5)
			 at: 1 @ 1 put: SGBox red;
			 at: 2 @ 1 put: SGBox yellow;
			 at: 3 @ 1 put: SGBox red;
			 at: 4 @ 1 put: SGBox red;
			 at: 5 @ 1 put: SGBox red;
			 at: 1 @ 2 put: SGBox blue;
			 at: 2 @ 2 put: SGBox yellow;
			 at: 3 @ 2 put: SGBox null;
			 at: 4 @ 2 put: SGBox red;
			 at: 5 @ 2 put: SGBox red;
			 at: 1 @ 3 put: SGBox null;
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
			 at: 5 @ 5 put: SGBox null;
			 yourself).
	self assert: board toString equals: ('| R | Y | R | R | R |
| B | Y | N | R | R |
| N | Y | Bo | R | R |
| B | Y | B | R | R |
| B | G | Y | B | N |' reject: [ :each | each = Character space ])
]

{ #category : 'tests' }
SGBoardTest >> testCreateBoardFromAStringReturnABoardWithEveryBoxContainingTheBoard [

	| board |
	board := SGBoard fromString: '| R|| | Y | R |
 | B | Bo||||| | G |'.

	self assert: (board boxAt: 1 @ 1) board equals: board.
	self assert: (board boxAt: 2 @ 1) board equals: board.
	self assert: (board boxAt: 3 @ 1) board equals: board.
	self assert: (board boxAt: 1 @ 2) board equals: board.
	self assert: (board boxAt: 2 @ 2) board equals: board.
	self assert: (board boxAt: 3 @ 2) board equals: board
]

{ #category : 'tests' }
SGBoardTest >> testExchangeCase [

	| case1 case2  |
	board configureGrid: ((CTNewArray2D width: 3 height: 3)
			 at: 1 @ 1 put: SGBox null;
			 at: 2 @ 1 put: SGBox yellow;
			 at: 3 @ 1 put: SGBox yellow;
			 at: 1 @ 2 put: SGBox null;
			 at: 2 @ 2 put: SGBox red;
			 at: 3 @ 2 put: SGBox red;
			 at: 1 @ 3 put: SGBox null;
			 at: 2 @ 3 put: SGBox green;
			 at: 3 @ 3 put: SGBox green;
			 yourself).


	case1 := board boxAt: 1 @ 1.
	case2 := board boxAt: 2 @ 1.
	self assert: case1 literal equals: 'N'.
	self assert: case2 literal equals: 'Y'.

	board switchBox: 1 @ 1 with: 2 @ 1.

	case1 := board boxAt: 1 @ 1.
	case2 := board boxAt: 2 @ 1.

	self assert: case1 literal equals: 'Y'.
	self assert: case2 literal equals: 'N'
]

{ #category : 'tests' }
SGBoardTest >> testExchangeColonne [

	board configureGrid: ((CTNewArray2D width: 3 height: 3)
			 at: 1 @ 1 put: SGBox null;
			 at: 2 @ 1 put: SGBox yellow;
			 at: 3 @ 1 put: SGBox yellow;
			 at: 1 @ 2 put: SGBox null;
			 at: 2 @ 2 put: SGBox red;
			 at: 3 @ 2 put: SGBox red;
			 at: 1 @ 3 put: SGBox null;
			 at: 2 @ 3 put: SGBox green;
			 at: 3 @ 3 put: SGBox green;
			 yourself).

	board switchColumn: 1 withColumn: 2.
	self assert: (board boxAt: 1 @ 1) literal equals: 'Y'.
	self assert: (board boxAt: 1 @ 2) literal equals: 'R'.
	self assert: (board boxAt: 1 @ 3) literal equals: 'G'.

	self assert: (board boxAt: 2 @ 1) literal equals: 'N'.
	self assert: (board boxAt: 2 @ 2) literal equals: 'N'.
	self assert: (board boxAt: 2 @ 3) literal equals: 'N'
]

{ #category : 'tests' }
SGBoardTest >> testHitBoxCallReactToActionOnBox [

	| stateBefore |
	SGGame new board: (board := SGBoard fromString: '|Cy-Y| Y |
| B | B |').
	stateBefore := (board boxAt: 1 @ 1) state state class.
	board hitBoxOnx: 2 y: 2.

	self deny: (board boxAt: 1 @ 1) state state class equals: stateBefore
]

{ #category : 'tests' }
SGBoardTest >> testHitBoxCallReactToActionOnBoxOnlyOnValidAction [

	| stateBefore |
	SGGame new board: (board := SGBoard fromString: '|Cy-Y| Y |
| B | R |').
	stateBefore := (board boxAt: 1 @ 1) state state class.
	board hitBoxOnx: 2 y: 2.

	self assert: (board boxAt: 1 @ 1) state state class equals: stateBefore
]

{ #category : 'tests' }
SGBoardTest >> testReorganiseBoard [
	"| B |            | B |
 | N |            | Y |
 | Y |         => | B |
 | N |            | N |
 | B |            | N | "

	board configureGrid: ((CTNewArray2D width: 1 height: 5)
			 at: 1 @ 1 put: SGBox blue;
			 at: 1 @ 2 put: SGBox null;
			 at: 1 @ 3 put: SGBox yellow;
			 at: 1 @ 4 put: SGBox null;
			 at: 1 @ 5 put: SGBox green;
			 yourself).
	board reorganizeColumn: 1.

	self assert: (board grid at: 1 @ 1) literal equals: 'B'.
	self assert: (board grid at: 1 @ 2) literal equals: 'Y'.
	self assert: (board grid at: 1 @ 3) literal equals: 'G'.
	self assert: (board grid at: 1 @ 4) literal equals: 'N'.
	self assert: (board grid at: 1 @ 5) literal equals: 'N'
]

{ #category : 'tests' }
SGBoardTest >> testReorganiseWhenEmptyColonne [
	"
| B Y Y |        | Y Y N |
| B R R |    =>  | R R N |
| B G G |        | G G N |                    "

	board configureGrid: ((CTNewArray2D width: 3 height: 3)
			 at: 1 @ 1 put: SGBox blue;
			 at: 2 @ 1 put: SGBox yellow;
			 at: 3 @ 1 put: SGBox yellow;
			 at: 1 @ 2 put: SGBox blue;
			 at: 2 @ 2 put: SGBox red;
			 at: 3 @ 2 put: SGBox red;
			 at: 1 @ 3 put: SGBox blue;
			 at: 2 @ 3 put: SGBox green;
			 at: 3 @ 3 put: SGBox green;
			 yourself).

	board hitBoxOnx: 1 y: 1.

	self assert: (board boxAt: 1 @ 1) literal equals: 'Y'.
	self assert: (board boxAt: 3 @ 1) literal equals: 'N'.
	self assert: (board boxAt: 1 @ 2) literal equals: 'R'.
	self assert: (board boxAt: 3 @ 2) literal equals: 'N'.
	self assert: (board boxAt: 1 @ 3) literal equals: 'G'.
	self assert: (board boxAt: 3 @ 3) literal equals: 'N'
]

{ #category : 'tests' }
SGBoardTest >> testSetGameWithGameKnowingTheBoard [

	| myboard game |
	myboard := SGBoard new.
	game := SGGame new.

	game board:  myboard.

	self shouldnt: [ myboard game: game ] raise: Error
]

{ #category : 'tests' }
SGBoardTest >> testSetGameWithoutGameKnowingTheBoard [

	self should: [ SGBoard new game: SGGame new] raise: Error
	
]
