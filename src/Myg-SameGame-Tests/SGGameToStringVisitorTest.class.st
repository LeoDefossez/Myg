Class {
	#name : 'SGGameToStringVisitorTest',
	#superclass : 'TestCase',
	#category : 'Myg-SameGame-Tests-Model',
	#package : 'Myg-SameGame-Tests',
	#tag : 'Model'
}

{ #category : 'tests' }
SGGameToStringVisitorTest >> testConvertABoardToString [
"Y: Yellow , B: Blue , G: Green , R: Red , Mu : Multicolor
 represents this grid:
 | R | Y | r | r | r |
 | B | y | b | r | r |
 | G | y | Bo | r | r |
 | B | y | b | r | r |
 | B | g | y | b | r |
 "
 |board visitor|
 board := SGBoard new.
 board configureGrid: ((CTNewArray2D width: 5 height: 5)
 at: 1 @ 1 put: SGBox red;
 at: 2 @ 1 put: SGBox yellow;
 at: 3 @ 1 put: SGBox red;
 at: 4 @ 1 put: SGBox red;
 at: 5 @ 1 put: SGBox red;
 at: 1 @ 2 put: SGBox blue;
 at: 2 @ 2 put: SGBox yellow;
 at: 3 @ 2 put: SGBox blue;
 at: 4 @ 2 put: SGBox red;
 at: 5 @ 2 put: SGBox red;
 at: 1 @ 3 put: SGBox green;
 at: 2 @ 3 put: SGBox yellow;
 at: 3 @ 3 put: SGBox bomb;
 at: 4 @ 3 put: SGBox red;
 at: 5 @ 3 put: SGBox red;
 at: 1 @ 4 put: SGBox blue;
 at: 2 @ 4 put: SGBox yellow;
 at: 3 @ 4 put: SGBox blue;
 at: 4 @ 4 put: SGBox red;
 at: 5 @ 4 put: SGBox red;
 at: 1 @ 5 put: SGBox blue;
 at: 2 @ 5 put: SGBox green;
 at: 3 @ 5 put: SGBox yellow;
 at: 4 @ 5 put: SGBox blue;
 at: 5 @ 5 put: SGBox red;
 yourself).
 self assert: (SGGameToStringVisitor new convert: board) equals:
 '
| R | Y | R | R | R |
| B | Y | B | R | R |
| G | Y | Bo | R | R |
| B | Y | B | R | R |
| B | G | Y | B | R |'
]
