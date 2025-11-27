Class {
	#name : 'SGStringToGridParser',
	#superclass : 'Object',
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'converting' }
SGStringToGridParser >> parse: aString [

	| lines rows lineSize |
	lines := aString splitOn: Character cr.
	lines size < 1 ifTrue: [ ^ self error: 'Error lines is empty.' ].
	rows := OrderedCollection new.

	lines withIndexDo: [ :line :i |
		rows add: (self parseLine: line position: i) ].

	lineSize := rows first size.
	rows allButFirst do: [ :row |
			lineSize = row size ifFalse: [
				^ self error: 'All lines must have the same number of columns.' ] ].
		
	^ CTNewArray2D fromArray: rows flattened width: lineSize 
]

{ #category : 'visiting' }
SGStringToGridParser >> parseBox: aString atLine: y atColumn: x [

	| registry possibilityList |
	registry := SGStateRegistry new.
	"formatStr := aString reject: [ :car | car = Character space ]."
	possibilityList := registry all
		                   collect: [ :class | class uniqueInstance ]
		                   thenSelect: [ :state | state literal = aString ].
	possibilityList size < 1 ifTrue: [
		^ self error:
			  'error: The value ' , aString , 'don"t match with box.' ].
	^ SGBox new
		  state: possibilityList first;
		  position: x @ y;
		  yourself
]

{ #category : 'visiting' }
SGStringToGridParser >> parseLine: aString position: anInteger [

	^ (((aString reject: [ :each | each = Character space ]) splitOn: '|')
		   reject: #isEmpty)
		  withIndexCollect: [ :val :i |
		  self parseBox: val atLine: anInteger atColumn: i ]
]
