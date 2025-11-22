Class {
	#name : 'LineVertical',
	#superclass : 'Line',
	#category : 'Myg-SameGame-Util',
	#package : 'Myg-SameGame',
	#tag : 'Util'
}

{ #category : 'as yet unclassified' }
LineVertical class >> x: x ymin: ymin ymax: ymax [

	^ self
		  new;
		  x: x;
		  ymin: ymin;
		  ymax: ymax;
		  yourself
]

{ #category : 'enumerating' }
LineVertical >> eachPointDo: aBlock [

	
]
