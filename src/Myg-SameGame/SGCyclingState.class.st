Class {
	#name : 'SGCyclingState',
	#superclass : 'SGSpecialState',
	#instVars : [
		'state',
		'registry',
		'states'
	],
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'nil' }
SGCyclingState >> backgroundRepresentation [

	^ state backgroundRepresentation
]

{ #category : 'accessing' }
SGCyclingState >> compatibleWith: aSGState [

	^ aSGState compatibleWith: state
]

{ #category : 'accessing' }
SGCyclingState >> compatibleWithBasicState: aSGBasicState [

	^ aSGBasicState compatibleWith: state
]

{ #category : 'initialization' }
SGCyclingState >> initialize [

	super initialize.

	states := SGStateRegistry new basics asOrderedCollection.
	state := states atRandom new
]

{ #category : 'accessing' }
SGCyclingState >> literal [

	^ 'Cy-' , state literal
]

{ #category : 'accessing' }
SGCyclingState >> propagateFromABox: aSGBox [

	^ state propagateFromABox: aSGBox
]

{ #category : 'as yet unclassified' }
SGCyclingState >> reactToActionOn: aBox [

	| index |
	index := states indexOf: state class.
	"
	Normal incrementation :
	3 % 4 + 1 >> 4
	Going back to the first index :
	4 % 4 + 1 >> 1
	"
	state := (states at: index % states size + 1) new.
	aBox announceStateChanged 
]

{ #category : 'accessing' }
SGCyclingState >> state [
	^ state
]

{ #category : 'accessing' }
SGCyclingState >> state: aSGStateMock [ 
	state := aSGStateMock
]

{ #category : 'accessing' }
SGCyclingState >> states [
	^ states
]
