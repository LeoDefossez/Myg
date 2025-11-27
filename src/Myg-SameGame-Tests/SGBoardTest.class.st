"
A SGBoardTest is a test class for testing the behavior of SGBoard
"
Class {
	#name : 'SGBoardTest',
	#superclass : 'TestCase',
	#category : 'Myg-SameGame-Tests-Model',
	#package : 'Myg-SameGame-Tests',
	#tag : 'Model'
}

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
SGBoardTest >> testSetGameWithGameKnowingTheBoard [

	| board game |
	board := SGBoard new.
	game := SGGame new.

	game board:  board.

	self shouldnt: [ board game: game ] raise: Error
]

{ #category : 'tests' }
SGBoardTest >> testSetGameWithoutGameKnowingTheBoard [

	self should: [ SGBoard new game: SGGame new] raise: Error
	
]
