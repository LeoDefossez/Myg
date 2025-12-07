Class {
	#name : 'SGStateRegistry',
	#superclass : 'Object',
	#instVars : [
		'null',
		'basics',
		'specials'
	],
	#classInstVars : [
		'instance'
	],
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'instance creation' }
SGStateRegistry class >> new [

	self shouldNotImplement
]

{ #category : 'as yet unclassified' }
SGStateRegistry class >> requestUpdate [

	instance := super new
]

{ #category : 'accessing' }
SGStateRegistry class >> uniqueInstance [

	^ instance ifNil: [
			  self requestUpdate.
			  instance ]
]

{ #category : 'initialization' }
SGStateRegistry >> all [
	^ specials , basics , { null }
]

{ #category : 'initialization' }
SGStateRegistry >> basics [
	^ basics
]

{ #category : 'initialization' }
SGStateRegistry >> initialize [

	null := SGNullState.
	basics := SGBasicState subclasses.
	specials := SGSpecialState subclasses
]

{ #category : 'initialization' }
SGStateRegistry >> specials [
	^ specials
]
