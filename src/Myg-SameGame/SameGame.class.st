Class {
	#name : 'SameGame',
	#superclass : 'Object',
	#instVars : [
		'buildBoxStrategy',
		'calculeScoreStrategy',
		'height',
		'width'
	],
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'instance creation' }
SameGame class >> open [

	^ self openWithSize:20

]

{ #category : 'instance creation' }
SameGame class >> openLastGame [

	^ self new openLevel: 0
]

{ #category : 'instance creation' }
SameGame class >> openLevel: anInteger [

	^ self new openLevel: anInteger
]

{ #category : 'instance creation' }
SameGame class >> openWidth: aInteger height: anotherInteger [

	^ (self width: aInteger height: anotherInteger) open
]

{ #category : 'instance creation' }
SameGame class >> openWithSize: size [

	^ (self width: size height: size) open
]

{ #category : 'instance creation' }
SameGame class >> width: aInteger height: anotherInteger [

	^ self new
		  width: aInteger;
		  height: anotherInteger
]

{ #category : 'accessing' }
SameGame >> baseHeight [
	^ 20

]

{ #category : 'accessing' }
SameGame >> baseWidth [
	^ 20
]

{ #category : 'accessing' }
SameGame >> buildBoxStrategy [

	^ buildBoxStrategy 
]

{ #category : 'settings' }
SameGame >> buildBoxStrategy: aSGBuildBoxStrategy [

	buildBoxStrategy := aSGBuildBoxStrategy
]

{ #category : 'accessing' }
SameGame >> calculeScoreStrategy [

	^ calculeScoreStrategy 
]

{ #category : 'settings' }
SameGame >> calculeScoreStrategy: aSGCalculeScoreStrategy [

	calculeScoreStrategy := aSGCalculeScoreStrategy 
]

{ #category : 'opening' }
SameGame >> createGame [

	| game board |
	SGStateRegistry requestUpdate.
	
	game := SGGame new.
	board := SGBoard new.
	game board: board.
	self buildBoxStrategy ifNotNil: [ :strat | board buildBoxStrategy: buildBoxStrategy ].
	self calculeScoreStrategy ifNotNil: [ :strat | board scoreStrategyCalculator: buildBoxStrategy ].

	board generateGridWidth: self width height: self height.
	^ game
]

{ #category : 'opening' }
SameGame >> graphicGame: game [

	| graphicBoard graphicScore container |
	graphicBoard := SGBoardElement new.
	graphicBoard grid: game board grid.

	graphicScore := SGScoreElement new.
	graphicScore game: game.

	container := BlElement new
		             layout: BlLinearLayout vertical;
		             constraintsDo: [ :c |
				             c horizontal matchParent.
				             c vertical matchParent ].

	container addChildren: {
			graphicScore.
			graphicBoard }.
	^ container
]

{ #category : 'accessing' }
SameGame >> height [
	^ height ifNil:[self baseHeight]
]

{ #category : 'settings' }
SameGame >> height: anInteger [

	height := anInteger 
]

{ #category : 'opening' }
SameGame >> open [

	^ self open: self createGame 
]

{ #category : 'opening' }
SameGame >> open: aGame [

	| space |
	"Since this is the method that launch a new game, save the game in case we want to replay it"
	SGRessources lastGame: aGame board toString.
	
	space := BlSpace new.
	space title: 'SameGame'.
	space root addChild: (self graphicGame: aGame).
	space extent: 1000 @ 1000.
	space show.
	^ space
]

{ #category : 'opening' }
SameGame >> openLevel: anInteger [

	| game level |
	level := (Pragma allNamed: #SGLevel: )
		         detect: [ :prag | prag arguments first = anInteger ]
		         ifNone: [ self error: 'The level ' , anInteger asString , ' does not exist' ].

	game := self createGame.
	game board fromString: (level method valueWithReceiver: SGRessources).

	^ self open: game
]

{ #category : 'accessing' }
SameGame >> width [ 
	^ width ifNil:[ self baseWidth ]
]

{ #category : 'settings' }
SameGame >> width: anInteger [

	width := anInteger
]
