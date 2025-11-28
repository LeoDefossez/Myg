Class {
	#name : 'CalculePointStrategyTest',
	#superclass : 'TestCase',
	#category : 'Myg-SameGame-Tests-Model',
	#package : 'Myg-SameGame-Tests',
	#tag : 'Model'
}

{ #category : 'tests' }
CalculePointStrategyTest >> testRedDoublePointStrat [

	| hitlist score strat |
	strat := SGCalculeScoreRedDouble new.
	hitlist := OrderedCollection new.
	hitlist
		add: SGBox red;
		add: SGBox red;
		add: SGBox green.
	score := strat calculePoint: hitlist.
	self assert: score equals: 25
]
