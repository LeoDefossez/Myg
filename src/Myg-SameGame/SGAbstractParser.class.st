Class {
	#name : 'SGAbstractParser',
	#superclass : 'Object',
	#category : 'Myg-SameGame-Objects',
	#package : 'Myg-SameGame',
	#tag : 'Objects'
}

{ #category : 'visiting' }
SGAbstractParser >> parseBlock:aBlock [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	self subclassResponsibility.
]

{ #category : 'visiting' }
SGAbstractParser >> parseBoard:aBoard [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	self subclassResponsibility.
]

{ #category : 'visiting' }
SGAbstractParser >> parseGame: aGame [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	self subclassResponsibility.
]

{ #category : 'visiting' }
SGAbstractParser >> parseState:aState [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	self subclassResponsibility.
]
