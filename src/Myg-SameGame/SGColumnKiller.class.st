Class {
	#name : 'SGColumnKiller',
	#superclass : 'SGSpecialState',
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'accessing' }
SGColumnKiller >> backgroundRepresentation [

	^ Color lightOrange 
]

{ #category : 'testing' }
SGColumnKiller >> literal [
	^ 'Cr'
]

{ #category : 'as yet unclassified' }
SGColumnKiller >> propagateFromABox: aSGBox [

	^ aSGBox propagateColumnKillerState
]
