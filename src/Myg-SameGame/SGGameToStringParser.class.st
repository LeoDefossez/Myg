Class {
	#name : 'SGGameToStringParser',
	#superclass : 'SGAbstractParser',
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'converting' }
SGGameToStringParser >> parse: anElement [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"
	^ anElement  parse: self.

]

{ #category : 'visiting' }
SGGameToStringParser >> parseBoard: aBoard [
	|index stringBoard|
	index:=0.
	stringBoard :=''.
	aBoard grid width.
	
	aBoard grid do:[:val| 
		(index ~= 0 and:[index % aBoard grid width = 0]) ifTrue:[
			stringBoard := stringBoard , '|' , String cr
			].
		stringBoard := stringBoard ,'|',(val parse: self).
		index:=index+1
		].
	^stringBoard ,'|'

]

{ #category : 'visiting' }
SGGameToStringParser >> parseBox: aBox [
 "add box color" 
^ String space , (aBox state parse: self), String space.
	
]

{ #category : 'visiting' }
SGGameToStringParser >> parseState: aState [
	^ aState literal
]
