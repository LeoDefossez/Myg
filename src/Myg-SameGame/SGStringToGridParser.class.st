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
	rows := lines collect: [ :line | self parseLine: line ].

	lineSize := rows first size.
	rows allButFirst do: [ :row |
		lineSize = row size ifFalse: [ ^ self error: 'All lines must have the same number of columns.' ] ].

	^ CTNewArray2D fromArray: rows flattened width: lineSize
]

{ #category : 'visiting' }
SGStringToGridParser >> parseBox: aString [

	| registry possibilityList |
	registry := SGStateRegistry new.

	possibilityList := registry all
		                   collect: [ :class | class uniqueInstance ]
		                   thenSelect: [ :state | state literal = aString ].
	possibilityList size < 1 ifTrue: [
		^ self error: 'error: The value ' , aString , 'don"t match with box.' ].

	^ SGBox new
		  state: possibilityList first;
		  yourself
]

{ #category : 'visiting' }
SGStringToGridParser >> parseLine: aString [

	^ (((aString reject: [ :each | each = Character space ]) splitOn: '|') reject: #isEmpty) collect: [
		  :val | self parseBox: val ]
]
