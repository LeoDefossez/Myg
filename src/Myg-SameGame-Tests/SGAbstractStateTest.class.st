"
A SGAbstractStateTest is a test class for testing the behavior of SGAbstractState
"
Class {
	#name : 'SGAbstractStateTest',
	#superclass : 'TestCase',
	#category : 'Myg-SameGame-Tests-Model',
	#package : 'Myg-SameGame-Tests',
	#tag : 'Model'
}

{ #category : 'tests' }
SGAbstractStateTest >> testAllStateLiteralAreUnique [

	| states literals |
	states := SGBasicState subclasses , SGSpecialState subclasses , { SGNullState } collect: #new.
	literals := (states collect: #literal) asSet .
	
	self assert: literals size equals: states size
]
