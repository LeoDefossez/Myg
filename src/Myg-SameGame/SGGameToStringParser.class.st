Class {
	#name : 'SGGameToStringParser',
	#superclass : 'SGAbstractParser',
	#instVars : [
		'hasConvertOneBoxOrMore',
		'gameVisualisation',
		'firstBoxRow'
	],
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'initialization' }
SGGameToStringParser >> initialize [ 
	gameVisualisation := ''.
	hasConvertOneBoxOrMore := false.
	firstBoxRow :=0.
]

{ #category : 'converting' }
SGGameToStringParser >> parse: anElement [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	gameVisualisation := ''.
	anElement  parse: self.
	^ gameVisualisation.
]

{ #category : 'visiting' }
SGGameToStringParser >> parseBoard: aBoard [
	|index|
	index:=0.
	aBoard grid width.

	aBoard grid do:[:val| 
		(index ~= 0 and:[index % aBoard grid width = 0]) ifTrue:[
			gameVisualisation := gameVisualisation , '|' , String cr
			].
		gameVisualisation := gameVisualisation ,'|'.
		val parse: self.
		index:=index+1
		].
	gameVisualisation := gameVisualisation ,'|'
]

{ #category : 'visiting' }
SGGameToStringParser >> parseBox: aBox [
 "add box color" 
 gameVisualisation:= gameVisualisation , String space.
 aBox state parse: self.
 "add a new box separator"	
 gameVisualisation:= gameVisualisation , ' '
	
]

{ #category : 'visiting' }
SGGameToStringParser >> parseState: aState [
	gameVisualisation := gameVisualisation , aState literal.
]
