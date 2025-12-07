Class {
	#name : 'SGBasicState',
	#superclass : 'SGAbstractState',
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'accessing' }
SGBasicState >> compatibleWith: aSGState [

	^ aSGState compatibleWithBasicState: self
]

{ #category : 'accessing' }
SGBasicState >> compatibleWithBasicState: aSGBasicState [ 
	^ self class = aSGBasicState class
]

{ #category : 'accessing' }
SGBasicState >> compatibleWithMulticolor: aSGMulticolorState [ 
	
	^ true
]

{ #category : 'as yet unclassified' }
SGBasicState >> propagateFromABox: aSquare [

	^ aSquare propagateBasicState
]
