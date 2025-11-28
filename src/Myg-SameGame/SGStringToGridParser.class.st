Class {
	#name : 'SGStringToGridParser',
	#superclass : 'Object',
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'as yet unclassified' }
SGStringToGridParser >> findStateFor: aString [ 

	| possibilityList registry |
	registry := SGStateRegistry new.
	possibilityList := registry all collect: [ :class | class new ] thenSelect: [ :state | state literal = aString ].
	possibilityList size < 1 ifTrue: [ ^ self error: 'error: The value ' , aString , ' does not match with box.' ].
	
	^ possibilityList first
]

{ #category : 'converting' }
SGStringToGridParser >> parse: aString [

	| lines rows lineSize |
	lines := aString splitOn: Character cr.
	lines size < 1 ifTrue: [ ^ self error: 'Error lines is empty.' ].
	rows := lines collect: [ :line | self parseLine: line ].

	lineSize := rows first size.
	rows allButFirst do: [ :row |
		lineSize = row size ifFalse: [ ^ self error: 'All lines must have the same number of columns.' ] ].

	^ CTNewArray2D fromArray: rows flattened width: lineSize
]

{ #category : 'visiting' }
SGStringToGridParser >> parseBox: aString [

	| state |
	"Checks if the string correspond to a cycling state"
	state := (aString includes: $-)
		         ifTrue: [ SGCyclingState new state: (self findStateFor: (aString splitOn: '-') second) ]
		         ifFalse: [ self findStateFor: aString ].

	^ SGBox new
		  state: state;
		  yourself
]

{ #category : 'visiting' }
SGStringToGridParser >> parseLine: aString [

	^ (((aString reject: [ :each | each = Character space ]) splitOn: '|') reject: #isEmpty) collect: [
		  :val | self parseBox: val ]
]
