Class {
	#name : 'SGStringToGridParser',
	#superclass : 'Object',
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'converting' }
SGStringToGridParser >> parse: anElement [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	^ self  parse:anElement withBoard: nil

]

{ #category : 'converting' }
SGStringToGridParser >> parse: aString withBoard: aSGBoard [ 

	|height lines rows columns|
	
	lines := aString splitOn: Character cr.
	height := lines size.
	height <1 ifTrue: [ ^ self error: 'Error this is an empty string.' ].
	rows := OrderedCollection new.
	
	lines withIndexDo: [ :line :i| rows add:(self parseLine: line position:i)].
	 
	rows do:[:row| rows first size = row size ifFalse: [^ self error: 'All lines must have the same number of columns.'  ].
		row do:[:col| col board: aSGBoard ]
		].
	columns:= rows flatCollect: [:col|col ].
	^ CTNewArray2D fromArray: columns width: (rows first size).
]

{ #category : 'visiting' }
SGStringToGridParser >> parseColumn: aString [
	
	^ self parseColumn: aString atLine: 1 atColumn: 1
]

{ #category : 'visiting' }
SGStringToGridParser >> parseColumn: aString atLine: anInteger atColumn: anOtherInteger [
	
	|registry formatStr possibilityList|
	registry:= SGStateRegistry new.
	formatStr := (aString select:[ :car| car ~= Character space.]).
	possibilityList := ((registry basics ,registry specials ) collect:[:class|class uniqueInstance])
		select: [ :state| state literal = formatStr ].
	possibilityList size < 1 ifTrue: [possibilityList:={SGNullState}].
	^ SGBox new state: possibilityList first; position: anOtherInteger@anInteger; yourself .
]

{ #category : 'visiting' }
SGStringToGridParser >> parseLine: aString [
	^ self parseLine: aString position: 1
]

{ #category : 'visiting' }
SGStringToGridParser >> parseLine: aString position: anInteger [
	
	^ ((aString splitOn: '|') 
	select: [:val| val ~= '' and:[ val~= String space ]]) 
	withIndexCollect: [ :val :i|
		self parseColumn: val atLine: anInteger atColumn: i.
		].
	
	
]
