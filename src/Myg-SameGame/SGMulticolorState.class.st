"
I'm a multicolor state
I match all the surrounding colors
"
Class {
	#name : 'SGMulticolorState',
	#superclass : 'SGSpecialState',
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'accessing' }
SGMulticolorState >> backgroundRepresentation [

	^ Color white
]

{ #category : 'accessing' }
SGMulticolorState >> compatibleWith: aSGState [
	
	^ aSGState compatibleWithMulticolor: self
]

{ #category : 'accessing' }
SGMulticolorState >> compatibleWithBasicState: aSGBasicState [ 
	
	^ true
]

{ #category : 'accessing' }
SGMulticolorState >> compatibleWithMulticolor: aSGMulticolorState [ 
	
	^ true
]

{ #category : 'accessing' }
SGMulticolorState >> propagateFromABox: aSGBox [

	^ aSGBox propagateMulticolorState
]
