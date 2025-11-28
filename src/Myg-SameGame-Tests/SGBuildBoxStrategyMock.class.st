Class {
	#name : 'SGBuildBoxStrategyMock',
	#superclass : 'Object',
	#instVars : [
		'count'
	],
	#category : 'Myg-SameGame-Tests-Mocks',
	#package : 'Myg-SameGame-Tests',
	#tag : 'Mocks'
}

{ #category : 'as yet unclassified' }
SGBuildBoxStrategyMock >> buildBox [ 

	count := count + 1.
	^ SGBox new
]

{ #category : 'as yet unclassified' }
SGBuildBoxStrategyMock >> count [ 

	^ count
]

{ #category : 'as yet unclassified' }
SGBuildBoxStrategyMock >> count: aValue [

	count := aValue
]

{ #category : 'as yet unclassified' }
SGBuildBoxStrategyMock >> initialize [ 

	count := 0
]
