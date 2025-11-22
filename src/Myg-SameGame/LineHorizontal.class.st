Class {
	#name : 'LineHorizontal',
	#superclass : 'Line',
	#instVars : [
		'xmin',
		'xmax',
		'y'
	],
	#category : 'Myg-SameGame-Util',
	#package : 'Myg-SameGame',
	#tag : 'Util'
}

{ #category : 'as yet unclassified' }
LineHorizontal class >> xmin: xmin xmax: xmax y: y [

	^ self new
		  xmin: xmin;
		  xmax: xmax;
		  y: y;
		  yourself
]

{ #category : 'enumerating' }
LineHorizontal >> eachPointDo: aBlock [

	xmin to: xmax do: [ :x | aBlock value: x @ y ]
]

{ #category : 'enumerating' }
LineHorizontal >> xmax: anInteger [ 
	xmax := anInteger 
]

{ #category : 'enumerating' }
LineHorizontal >> xmin: anInteger [ 
	xmin := anInteger 
]

{ #category : 'enumerating' }
LineHorizontal >> y: anInteger [ 
	y := anInteger 
]
