Class {
	#name : 'SGSpecialState',
	#superclass : 'SGAbstractState',
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'as yet unclassified' }
SGSpecialState >> compatibleWith: aSGState [
	"By default we consider a special state uncompatible with every other state"
	
	^ false
]

{ #category : 'as yet unclassified' }
SGSpecialState >> compatibleWithBasicState: aSGBasicState [ 
	
	^ false
]

{ #category : 'as yet unclassified' }
SGSpecialState >> compatibleWithMulticolor: aSGMulticolorState [ 
	
	^ false
]
