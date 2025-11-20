Class {
	#name : 'SGGameToStringVisitor',
	#superclass : 'SGAbstractVisitor',
	#instVars : [
		'hasConvertOneBoxOrMore',
		'gameVisualisation',
		'firstBoxRow'
	],
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'converting' }
SGGameToStringVisitor >> convert: anElement [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	gameVisualisation := ''.
	anElement  canVisit: self.
	^ gameVisualisation.
]

{ #category : 'initialization' }
SGGameToStringVisitor >> initialize [ 
	gameVisualisation := ''.
	hasConvertOneBoxOrMore := false.
	firstBoxRow :=0.
]

{ #category : 'visiting' }
SGGameToStringVisitor >> visitBoard: aBoard [
	|index|
	index:=0.
	aBoard grid width.

	aBoard grid do:[:val| 
		(index ~= 0 and:[index % aBoard grid width = 0]) ifTrue:[
			gameVisualisation := gameVisualisation , '|' , String cr
			].
		gameVisualisation := gameVisualisation ,'|'.
		val canVisit: self.
		index:=index+1
		].
	gameVisualisation := gameVisualisation ,'|'
]

{ #category : 'visiting' }
SGGameToStringVisitor >> visitBox: aBox [
 "add box color" 
 gameVisualisation:= gameVisualisation , String space.
 aBox state canVisit: self.
 "add a new box separator"	
 gameVisualisation:= gameVisualisation , ' '
	
]

{ #category : 'visiting' }
SGGameToStringVisitor >> visitState: aState [
	gameVisualisation := gameVisualisation , aState literal.
]
