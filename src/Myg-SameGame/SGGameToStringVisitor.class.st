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
	aBoard grid do:[:val| val canVisit: self]
]

{ #category : 'visiting' }
SGGameToStringVisitor >> visitBox: aBox [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"
 |currentLine|
 currentLine := (gameVisualisation splitOn: Character cr) size.

 "add a new line if this is the first box"
 hasConvertOneBoxOrMore ifFalse: [ hasConvertOneBoxOrMore := true. 
	 gameVisualisation := gameVisualisation , String cr,'|'.
 	currentLine := (gameVisualisation splitOn: Character cr) size.
 	firstBoxRow := currentLine . 
 	].
 
 "add new line if this is a new game row"
 aBox y - 1 ~= (currentLine - firstBoxRow) ifTrue: [gameVisualisation:= gameVisualisation , String cr ,'|'. ].

 "add box color" 
 gameVisualisation:= gameVisualisation , String space.
 aBox state canVisit: self.
 "add a new box separator"	
 gameVisualisation:= gameVisualisation , ' |'
	
]

{ #category : 'visiting' }
SGGameToStringVisitor >> visitState: aState [
	gameVisualisation := gameVisualisation , aState literal.
]
