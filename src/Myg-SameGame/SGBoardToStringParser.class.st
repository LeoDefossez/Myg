Class {
	#name : 'SGBoardToStringParser',
	#superclass : 'Object',
	#category : 'Myg-SameGame-Model',
	#package : 'Myg-SameGame',
	#tag : 'Model'
}

{ #category : 'converting' }
SGBoardToStringParser >> parse: aBoard [

	| stream |
	stream := WriteStream on: ''.
	aBoard grid rows
		do: [ :row |
				stream nextPutAll: '|'.
				row do: [ :box |
						stream
							nextPutAll: (self parseBox: box);
							nextPutAll: '|' ] ]
		separatedBy: [ stream cr ].
	^ stream contents
]

{ #category : 'visiting' }
SGBoardToStringParser >> parseBox: aBox [

	^ aBox state literal
]
