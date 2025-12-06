Class {
	#name : 'SameGameTest',
	#superclass : 'TestCase',
	#instVars : [
		'space'
	],
	#category : 'Myg-SameGame-Tests-Model',
	#package : 'Myg-SameGame-Tests',
	#tag : 'Model'
}

{ #category : 'tests' }
SameGameTest >> ensureClose: aSpace [

	self assert: (BlSpace pulseUntilEmptyTaskQueue: aSpace timeout: 500 milliSeconds).

	aSpace close.

	self assert: (BlSpace pulseUntilEmptyTaskQueue: aSpace timeout: 500 milliSeconds).
]

{ #category : 'tests' }
SameGameTest >> tearDown [

	space ifNotNil: [ self ensureClose: space ].
	super tearDown
]

{ #category : 'tests' }
SameGameTest >> testBasicSize [
	"comment stating purpose of instance-side method"

	"scope: class-variables  &  instance-variables"

	| board |
	board := SameGame new createGame board.
	self assert: board grid width equals: 20.
	self assert: board grid height equals: 20
]

{ #category : 'tests' }
SameGameTest >> testCreateGameRequestUpdateOnRegistry [

	| before |
	before := SGStateRegistry uniqueInstance.
	(SameGame width: 1 height: 1) createGame.
	self deny: before equals: SGStateRegistry uniqueInstance
]

{ #category : 'tests' }
SameGameTest >> testCreateGraphicGameWithoutDefiningHeight [

	| sameGame  board |
	sameGame := SameGame new.
	board := (sameGame width: 10) createGame board.
	
	self assert: board grid height equals: sameGame baseHeight.
	self assert: board grid width equals: 10
]

{ #category : 'tests' }
SameGameTest >> testCreateGraphicGameWithoutDefiningWidth [

	| sameGame  board |
	sameGame := SameGame new.
	board := (sameGame height: 10) createGame board.
	
	self assert: board grid width equals: sameGame baseWidth.
	self assert: board grid height equals: 10

]

{ #category : 'tests' }
SameGameTest >> testGraphicGameUseOurHeight [
	"comment stating purpose of instance-side method"

	"scope: class-variables  &  instance-variables"

	| sameGame  board |
	sameGame := SameGame new.
	sameGame width: sameGame baseHeight - 1.
	board := sameGame createGame board.
	
	self assert: board grid width equals: sameGame baseHeight - 1
]

{ #category : 'tests' }
SameGameTest >> testGraphicGameUseOurWidth [

	| sameGame  board |
	sameGame := SameGame new.
	sameGame width: sameGame baseWidth - 1.
	board := sameGame createGame board .
	
	self assert: board grid width equals: sameGame baseWidth - 1
]

{ #category : 'tests' }
SameGameTest >> testOpenRegisterLastGame [

	| sggame game |
	SGRessources lastGame: nil.
	sggame := SameGame new.
	game := sggame createGame.
	space := sggame open: game.

	self assert: SGRessources lastGame equals: game board toString
]
