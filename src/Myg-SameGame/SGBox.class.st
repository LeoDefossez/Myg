Class {
	#name : 'SGBox',
	#superclass : 'MygAbstractBox',
	#instVars : [
		'state',
		'announcer'
	],
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'constants' }
SGBox class >> blue [ 

	^ self withState: SGBlueState new 
]

{ #category : 'as yet unclassified' }
SGBox class >> bomb [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"

	^ self withState: SGBombState new
]

{ #category : 'as yet unclassified' }
SGBox class >> columnKiller [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"

	^ self withState: SGColumnKiller new
]

{ #category : 'constants' }
SGBox class >> green [

	^ self withState: SGGreenState new
]

{ #category : 'as yet unclassified' }
SGBox class >> lineKiller [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"

	^ self withState: SGRowKillerState new
]

{ #category : 'as yet unclassified' }
SGBox class >> multicolor [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"

	^ self withState: SGMulticolorState new
]

{ #category : 'factory' }
SGBox class >> null [

	^ self withState: SGNullState new 
]

{ #category : 'constants' }
SGBox class >> red [

	^ self withState: SGRedState new
]

{ #category : 'as yet unclassified' }
SGBox class >> withState: aState [ 

	^ self new state: aState
]

{ #category : 'constants' }
SGBox class >> yellow [

	^ self withState: SGYellowState new
]

{ #category : 'accessing' }
SGBox >> announcer [

	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : 'accessing' }
SGBox >> backgroundRepresentation [

	^ self state backgroundRepresentation 
]

{ #category : 'public' }
SGBox >> click [

	self board hitBox: self
]

{ #category : 'propagating' }
SGBox >> defaultCheckAndPropagateOnX: x y: y [

	| case |
	case := self board boxAt: x @ y.
	(case state compatibleWith: self state) ifTrue: [ case propagateClick ]
]

{ #category : 'propagating' }
SGBox >> defaultPropagate [

	| x y |
	x := self x.
	y := self y.
	(self board hitList includes: self) ifTrue: [ ^ self ].
	self board hitList add: self.
	x - 1 > 0 ifTrue: [ self defaultCheckAndPropagateOnX: x - 1 y: y ].
	x + 1 <= self board grid width ifTrue: [
		self defaultCheckAndPropagateOnX: x + 1 y: y ].
	y - 1 > 0 ifTrue: [ self defaultCheckAndPropagateOnX: x y: y - 1 ].
	y + 1 <= self board grid height ifTrue: [
		self defaultCheckAndPropagateOnX: x y: y + 1 ]
]

{ #category : 'drawing - general' }
SGBox >> draw: drawer [

	(drawer grid at: self x @ self y) background:
		self backgroundRepresentation
]

{ #category : 'testing' }
SGBox >> hasNullState [ 

	^ self state isNull
]

{ #category : 'propagating' }
SGBox >> killAllInRectangle: aRectangle [

	| boardRectangle targetIntersection |
	boardRectangle := Rectangle
		                  point: 1 @ 1
		                  point: board grid width @ board grid height.

	targetIntersection := boardRectangle intersect: aRectangle.

	(self board hitList includes: self) ifTrue: [ ^ self ].
	self board hitList add: self.
	
	targetIntersection origin x to: targetIntersection corner x do: [
			:x |
			targetIntersection origin y to: targetIntersection corner y do: [
			:y | self removeBox: (board boxAt: x @ y) ] ]
]

{ #category : 'accessing' }
SGBox >> literal [ 

	^ state literal
]

{ #category : 'propagating' }
SGBox >> propagateBombState [

	| targetRectangle |
	targetRectangle := Rectangle point: self x - 1 @ (self y - 1) point: self x + 1 @ (self y + 1).
	self killAllInRectangle: targetRectangle
]

{ #category : 'propagating' }
SGBox >> propagateClick [
	self state propagateFromABox: self.
]

{ #category : 'as yet unclassified' }
SGBox >> propagateColumnKillerState [

	| targetRectangle |
	targetRectangle := Rectangle point: self x @ 1 point: self x @ board grid height.
	self killAllInRectangle: targetRectangle
]

{ #category : 'accessing' }
SGBox >> propagateMulticolorState [
	^ self defaultPropagate.
]

{ #category : 'propagating' }
SGBox >> propagateNormalState [
	^ self defaultPropagate.
	
]

{ #category : 'accessing' }
SGBox >> propagateNullState [

	^ self
]

{ #category : 'as yet unclassified' }
SGBox >> propagateRowKillerState [

	| targetRectangle |
	targetRectangle := Rectangle point: 1 @ self y point: board grid width @ self y.
	self killAllInRectangle: targetRectangle
]

{ #category : 'removing' }
SGBox >> removeBox: aBox [
	self board hitList add: aBox.
	
]

{ #category : 'accessing' }
SGBox >> state [

	^ state 
]

{ #category : 'accessing' }
SGBox >> state: aState [
	"(aState class inheritsFrom: SGNullState) ifFalse: [ self halt ]."

	state = aState ifTrue: [ ^ self ].
	state := aState.
	self announcer announce: SGStateChangedAnnouncement new.
]

{ #category : 'accessing - structure variables' }
SGBox >> x [

	^ position x
]

{ #category : 'accessing - structure variables' }
SGBox >> y [

	^ position y
]
