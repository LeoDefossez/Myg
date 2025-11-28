Class {
	#name : 'SGAbstractState',
	#superclass : 'Object',
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'accessing' }
SGAbstractState >> backgroundRepresentation [

	^ self subclassResponsibility
]

{ #category : 'as yet unclassified' }
SGAbstractState >> compatibleWith: aSGState [
	"Help understand how the propagating works (Usefull for compatibilty between some special and basic states)"
	self subclassResponsibility 
]

{ #category : 'testing' }
SGAbstractState >> isNull [
	^ false
]

{ #category : 'testing' }
SGAbstractState >> literal [
	self subclassResponsibility 
]

{ #category : 'as yet unclassified' }
SGAbstractState >> propagateFromABox: aSGbox [

	self subclassResponsibility
]

{ #category : 'as yet unclassified' }
SGAbstractState >> reactToActionOn: aBox [
	"By default do nothing"
]
