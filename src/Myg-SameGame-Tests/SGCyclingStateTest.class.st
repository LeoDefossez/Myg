"
A SGCyclingStateTest is a test class for testing the behavior of SGCyclingState
"
Class {
	#name : 'SGCyclingStateTest',
	#superclass : 'TestCase',
	#category : 'Myg-SameGame-Tests-Model',
	#package : 'Myg-SameGame-Tests',
	#tag : 'Model'
}

{ #category : 'tests' }
SGCyclingStateTest >> testAddItsStateLiteral [

	| cycling mock |
	cycling := SGCyclingState new.
	mock := SGStateMock new.
	cycling state: mock.

	cycling backgroundRepresentation.
	self assert: (cycling literal splitOn: '-') second equals: mock literal
]

{ #category : 'tests' }
SGCyclingStateTest >> testCompatibilityWithBasicState [

	| cycling |
	cycling := SGCyclingState new.

	self assert: (cycling compatibleWith: cycling state).
	self assert: (cycling state compatibleWith: cycling)
]

{ #category : 'tests' }
SGCyclingStateTest >> testDoCyclingMidIndex [

	| cycling |
	cycling := SGCyclingState new.
	cycling state: cycling states first new.

	cycling reactToActionOn: SGBox new.

	self assert: cycling state class equals: cycling states second
]

{ #category : 'tests' }
SGCyclingStateTest >> testUseBackgroundRepresentationOfItsState [

	| cycling mock |
	cycling := SGCyclingState new.
	mock := SGStateMock new.
	cycling state: mock.

	cycling backgroundRepresentation.
	self assert: mock backgroundCount equals: 1
]

{ #category : 'tests' }
SGCyclingStateTest >> testUsePropagationOfItsState [

	| cycling mock |
	cycling := SGCyclingState new.
	mock := SGStateMock new.
	cycling state: mock.

	cycling propagateFromABox: nil.
	self assert: mock propagateCount equals: 1
]
