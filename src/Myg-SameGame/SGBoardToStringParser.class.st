Class {
	#name : 'SGBoardToStringParser',
	#superclass : 'Object',
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'converting' }
SGBoardToStringParser >> parse: anElement [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"
	^ anElement  parse: self.

]

{ #category : 'visiting' }
SGBoardToStringParser >> parseBoard: aBoard [

	| stringBoard |
	stringBoard := ''.
	aBoard grid rowsDo: [ :row |
			stringBoard := stringBoard , '|'.
			row do: [ :col |
				stringBoard := stringBoard , (col parse: self) , '|' ].
			stringBoard := stringBoard , String cr ].
	^ stringBoard withoutSuffix: String cr
]

{ #category : 'visiting' }
SGBoardToStringParser >> parseBox: aBox [
 "add box color" 
^ aBox state literal
	
]
