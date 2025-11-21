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

	|width height allLines allColumn|
	allLines := anElement splitOn: Character cr.
	height := allLines size.
	height <1 ifTrue: [ ^ self error: 'Error this is an empty string.' ].
	allColumn := OrderedCollection new.
	allLines do: [ :line| allColumn addAll:(self parseLine: line) ; yourself ].
	
	
	^ CTNewArray2D fromArray: allColumn width: (allColumn size/height ).

]

{ #category : 'visiting' }
SGStringToGridParser >> parseColumn: aString [
	
	|registry formatStr possibilityList|
	registry:= SGStateRegistry new.
	formatStr := (aString select:[ :car| car ~= Character space.]).
	possibilityList := ((registry basics ,registry specials ) collect:[:class|class uniqueInstance])
		select: [ :state| state literal = formatStr ].
	possibilityList size < 1 ifTrue: [^SGNullState ].
	^ SGBox new state: possibilityList first.
]

{ #category : 'visiting' }
SGStringToGridParser >> parseLine: aString [
	^((aString splitOn: '|') select: [:val| val ~= '' and:[ val~= String space ]]) collect: [ :val|self parseColumn:val ]
]
