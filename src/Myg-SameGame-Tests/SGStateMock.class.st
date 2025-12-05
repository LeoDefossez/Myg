Class {
	#name : 'SGStateMock',
	#superclass : 'Object',
	#instVars : [
		'count',
		'backgroundCount',
		'propagateCount',
		'action'
	],
	#category : 'Myg-SameGame-Tests-Mocks',
	#package : 'Myg-SameGame-Tests',
	#tag : 'Mocks'
}

{ #category : 'accessing' }
SGStateMock >> backgroundCount [

	^ backgroundCount
]

{ #category : 'accessing' }
SGStateMock >> backgroundRepresentation [

	backgroundCount := backgroundCount + 1
]

{ #category : 'initialization' }
SGStateMock >> initialize [

	super initialize.

	backgroundCount := 0.
	propagateCount := 0.
	action := 0
]

{ #category : 'accessing' }
SGStateMock >> literal [

	^ 'mock'
]

{ #category : 'accessing' }
SGStateMock >> propagateCount [
	^ propagateCount
]

{ #category : 'as yet unclassified' }
SGStateMock >> propagateFromABox: aSGbox [

	propagateCount := propagateCount + 1
]

{ #category : 'accessing' }
SGStateMock >> reactToAction [

	action := action + 1
]
