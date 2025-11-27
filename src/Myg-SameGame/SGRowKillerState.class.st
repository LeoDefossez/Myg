Class {
	#name : 'SGRowKillerState',
	#superclass : 'SGSpecialState',
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'accessing' }
SGRowKillerState >> backgroundRepresentation [

	^ Color purple
]

{ #category : 'testing' }
SGRowKillerState >> literal [

	^ 'Lk'
]

{ #category : 'as yet unclassified' }
SGRowKillerState >> propagateFromABox: aSGBox [

	^ aSGBox propagateRowKillerState
]
