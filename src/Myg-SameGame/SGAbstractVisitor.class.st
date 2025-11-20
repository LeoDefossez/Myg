Class {
	#name : 'SGAbstractVisitor',
	#superclass : 'Object',
	#category : 'Myg-SameGame-Objects',
	#package : 'Myg-SameGame',
	#tag : 'Objects'
}

{ #category : 'visiting' }
SGAbstractVisitor >> visitBlock:aBlock [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	self subclassResponsibility.
]

{ #category : 'visiting' }
SGAbstractVisitor >> visitBoard:aBoard [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	self subclassResponsibility.
]

{ #category : 'visiting' }
SGAbstractVisitor >> visitGame: aGame [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	self subclassResponsibility.
]

{ #category : 'visiting' }
SGAbstractVisitor >> visitState:aState [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	self subclassResponsibility.
]
