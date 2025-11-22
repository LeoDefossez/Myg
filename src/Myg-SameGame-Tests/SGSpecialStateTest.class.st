"
A SGSpecialStateTest is a test class for testing the behavior of SGSpecialState
"
Class {
	#name : 'SGSpecialStateTest',
	#superclass : 'TestCase',
	#instVars : [
		'specialState'
	],
	#category : 'Myg-SameGame-Tests-Model',
	#package : 'Myg-SameGame-Tests',
	#tag : 'Model'
}

{ #category : 'running' }
SGSpecialStateTest >> setUp [
	super setUp.

	"Put here a common initialization logic for tests"
	specialState := SGSpecialState uniqueInstance.
]

{ #category : 'tests' }
SGSpecialStateTest >> testSGSpecialStateIsByDefaultIncompatibleWithBasicStates [

	self deny: (specialState compatibleWithBasicState: SGBasicState uniqueInstance)
]

{ #category : 'tests' }
SGSpecialStateTest >> testSGSpecialStateIsByDefaultIncompatibleWithMulticolorTiles [

	self deny: (specialState compatibleWithMulticolor: SGMulticolorState uniqueInstance)
]
