Class {
	#name : 'SGColumnKillerTest',
	#superclass : 'TestCase',
	#instVars : [
		'board'
	],
	#category : 'Myg-SameGame-Tests-Model',
	#package : 'Myg-SameGame-Tests',
	#tag : 'Model'
}

{ #category : 'running' }
SGColumnKillerTest >> setUp [
	super setUp.
	board := SGBoard new.
	SGGame new board: board.
]

{ #category : 'tests' }
SGColumnKillerTest >> testClickOnColumnKiller [

	"Y: Yellow , B: Blue , G: Green , R: Red , Cr: ColumnKiller
	resents this grid:
	 | R | R | Y  |
	 | B | Cr | B|
	 | Y | B | R |
	 
	"
	board fromString: '| R | R | Y  |
                      | B | Cr | B|
                      | Y | B | R |'.

	board hitBoxOnx: 2 y: 2.


	"Y: Yellow , B: Blue , G: Green , R: Red , Cr: ColumnKiller
	resents this grid:
	 | R | Y | N |
	 | B | B | N |
	 | Y | R | N |
	"

	self assert: (board grid at: 1 @ 1) literal equals: 'R'.
	self assert: (board grid at: 2 @ 1) literal equals: 'Y'.
	self assert: (board grid at: 3 @ 1) literal equals: 'N'.

	self assert: (board grid at: 1 @ 2) literal equals: 'B'.
	self assert: (board grid at: 2 @ 2) literal equals: 'B'.
	self assert: (board grid at: 3 @ 2) literal equals: 'N'.

	self assert: (board grid at: 1 @ 3) literal equals: 'Y'.
	self assert: (board grid at: 2 @ 3) literal equals: 'R'.
	self assert: (board grid at: 3 @ 3) literal equals: 'N'
]

{ #category : 'tests' }
SGColumnKillerTest >> testClickOnColumnKillerWithOtherColumnKillerOnTheSameColumn [

	"Y: Yellow , B: Blue , G: Green , R: Red , Cr: ColumnKiller
	resents this grid:
	 | R | Cr | Y  |
	 | B | Cr | B|
	 | Y | Cr | R |
	 
	"
	board fromString: '| R | Cr | Y  |
                      | B | Cr | B|
                      | Y | Cr | R |'.

	board hitBoxOnx: 2 y: 2.


	
	"Y: Yellow , B: Blue , G: Green , R: Red , Cr: ColumnKiller
	resents this grid:
	 | R | Y | N |
	 | B | B | N |
	 | Y | R | N |
	"

	self assert: (board grid at: 1 @ 1) literal equals: 'R'.
	self assert: (board grid at: 2 @ 1) literal equals: 'Y'.
	self assert: (board grid at: 3 @ 1) literal equals: 'N'.

	self assert: (board grid at: 1 @ 2) literal equals: 'B'.
	self assert: (board grid at: 2 @ 2) literal equals: 'B'.
	self assert: (board grid at: 3 @ 2) literal equals: 'N'.

	self assert: (board grid at: 1 @ 3) literal equals: 'Y'.
	self assert: (board grid at: 2 @ 3) literal equals: 'R'.
	self assert: (board grid at: 3 @ 3) literal equals: 'N'
]
