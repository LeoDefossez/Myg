"
A SGMulticolorStateTest is a test class for testing the behavior of SGMulticolorState
"
Class {
	#name : 'SGMulticolorStateTest',
	#superclass : 'TestCase',
	#instVars : [
		'muState'
	],
	#category : 'Myg-SameGame-Tests-Model',
	#package : 'Myg-SameGame-Tests',
	#tag : 'Model'
}

{ #category : 'running' }
SGMulticolorStateTest >> setUp [
	super setUp.

	"Put here a common initialization logic for tests"
	muState := SGMulticolorState uniqueInstance .
]

{ #category : 'tests' }
SGMulticolorStateTest >> testCompatibilityWithBasicStateWhenClickOnBasicState [
	"Y: Yellow , B: Blue , G: Green , R: Red, N : Null, Mu: Multicolor
	represents this grid:
	 | B | Y | G | 
	 | B | Mu | G | 
	 | R | Y | N | 

	"

	| board |
	
	board := SGBoard new.
	SGGame new board: board.
	
	board configureGrid: ((CTNewArray2D width: 3 height: 3)
			 at: 1 @ 1 put: SGBox blue;
			 at: 2 @ 1 put: SGBox yellow;
			 at: 3 @ 1 put: SGBox green;
			 at: 1 @ 2 put: SGBox blue;
			 at: 2 @ 2 put: SGBox multicolor;
			 at: 3 @ 2 put: SGBox green;
			 at: 1 @ 3 put: SGBox red;
			 at: 2 @ 3 put: SGBox yellow;
			 at: 3 @ 3 put: SGBox null;
			 yourself).

	board hitBoxOnx: 1 y: 1.
	"expect:
	 | R | N | N | 
	 | N | N | N | 
	 | N | N | N | 

	"

	self assert: (board boxAt: 1 @ 1) state class equals: SGRedState.
	self assert: (board boxAt: 2 @ 1) state class equals: SGNullState.
	self assert: (board boxAt: 3 @ 1) state class equals: SGNullState.

	self assert: (board boxAt: 1 @ 2) state class equals: SGNullState.
	self assert: (board boxAt: 2 @ 2) state class equals: SGNullState.
	self assert: (board boxAt: 3 @ 2) state class equals: SGNullState.

	self assert: (board boxAt: 1 @ 3) state class equals: SGNullState.
	self assert: (board boxAt: 2 @ 3) state class equals: SGNullState.
	self assert: (board boxAt: 3 @ 3) state class equals: SGNullState
]

{ #category : 'tests' }
SGMulticolorStateTest >> testCompatibilityWithBasicStateWhenClickOnMulticolorState [
	"Y: Yellow , B: Blue , G: Green , R: Red, N : Null, Mu: Multicolor
	represents this grid:
	 | B | Y | G | 
	 | B | Mu | G | 
	 | R | Y | N | 

	"

	| board |
	
	board := SGBoard new.
	SGGame new board: board.
	
	board configureGrid: ((CTNewArray2D width: 3 height: 3)
			 at: 1 @ 1 put: SGBox blue;
			 at: 2 @ 1 put: SGBox yellow;
			 at: 3 @ 1 put: SGBox green;
			 at: 1 @ 2 put: SGBox blue;
			 at: 2 @ 2 put: SGBox multicolor;
			 at: 3 @ 2 put: SGBox green;
			 at: 1 @ 3 put: SGBox red;
			 at: 2 @ 3 put: SGBox yellow;
			 at: 3 @ 3 put: SGBox null;
			 yourself).

	board hitBoxOnx: 2 y: 2.
	"expect:
	 | R | N | N | 
	 | N | N | N | 
	 | N | N | N | 

	"

	self assert: (board boxAt: 1 @ 1) state class equals: SGRedState.
	self assert: (board boxAt: 2 @ 1) state class equals: SGNullState.
	self assert: (board boxAt: 3 @ 1) state class equals: SGNullState.

	self assert: (board boxAt: 1 @ 2) state class equals: SGNullState.
	self assert: (board boxAt: 2 @ 2) state class equals: SGNullState.
	self assert: (board boxAt: 3 @ 2) state class equals: SGNullState.

	self assert: (board boxAt: 1 @ 3) state class equals: SGNullState.
	self assert: (board boxAt: 2 @ 3) state class equals: SGNullState.
	self assert: (board boxAt: 3 @ 3) state class equals: SGNullState
]

{ #category : 'tests' }
SGMulticolorStateTest >> testCompatibilityWithSpecialStateWhenClickOnMulticolorState [
	"Sp: Special, Mu: Mutlicolor 
	represents this grid:
	 | Sp | Mu | 
	"

	| board |
	board := SGBoard new.
	board configureGrid: ((CTNewArray2D width: 2 height: 1)
			 at: 1 @ 1 put: (SGBox new state: SGSpecialState new);
			 at: 2 @ 1 put: (SGBox new state: muState);
			 yourself).

	board hitBoxOnx: 2 y: 1.
	
	self assert: (board boxAt: 1 @ 1 ) state class equals: SGSpecialState.
	self assert: (board boxAt: 2 @ 1 ) state class equals: SGMulticolorState 
	
]

{ #category : 'tests' }
SGMulticolorStateTest >> testEveryBasicStateIsCompatible [

	SGBasicState subclasses do:[:each | self assert: ( each uniqueInstance compatibleWith: muState)  ]
	
]

{ #category : 'tests' }
SGMulticolorStateTest >> testHitOnOnlyMulticolor [
	"Mu: Multicolor
	represents this grid:
	| Mu |
	"

	| board |
	board := SGBoard new.
	SGGame new board: board.

	board configureGrid: ((CTNewArray2D width: 1 height: 1)
			 at: 1 @ 1 put: SGBox multicolor;
			 yourself).

	board hitBoxOnx: 1 y: 1.
	"expect:
	 | Mu | 
	"

	self assert: (board boxAt: 1 @ 1) state class equals: SGMulticolorState
]

{ #category : 'tests' }
SGMulticolorStateTest >> testIsCompatibleWithEveryBasicState [

	SGBasicState subclasses do:[:each | self assert: (muState compatibleWith: each uniqueInstance)  ]
	
]

{ #category : 'tests' }
SGMulticolorStateTest >> testIsCompatibleWithItself [

	self assert: (muState compatibleWith: muState )
	
]
