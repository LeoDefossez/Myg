Class {
	#name : 'SGStringToGridParserTest',
	#superclass : 'TestCase',
	#category : 'Myg-SameGame-Tests-Model',
	#package : 'Myg-SameGame-Tests',
	#tag : 'Model'
}

{ #category : 'tests' }
SGStringToGridParserTest >> testConvertAStringGridWithLessElementInTheFirstRow [
"Y: Yellow , B: Blue , G: Green , R: Red , Mu : Multicolor
 represents this grid:
 | R | Y | r |
 | B | bo | g |
 "
 |actualBoard iRow iCol|
self
    should: [ SGStringToGridParser new parse: '| R | Y | R |
 | B | Bo | G | N | O |' ]
    raise: Error.

 
 

]

{ #category : 'tests' }
SGStringToGridParserTest >> testConvertAStringGridWithMoreElementInTheFirstRow [
"Y: Yellow , B: Blue , G: Green , R: Red , Mu : Multicolor
 represents this grid:
 | R | Y | r |
 | B | bo | g |
 "
 |actualBoard iRow iCol|
self
    should: [ SGStringToGridParser new parse: '| R | Y | R | N | N | N |
	| B | Bo | G | N |' ]
    raise: Error.

 
 

]

{ #category : 'tests' }
SGStringToGridParserTest >> testConvertAStringToABoard [
"Y: Yellow , B: Blue , G: Green , R: Red , Mu : Multicolor
 represents this grid:
 | R | Y | r |
 | B | bo | g |
 "
 |grid|
 
 grid:=SGStringToGridParser new parse: '| R | Y | R |
 | B | Bo | G |'.
 self assert: (grid at: 1 @ 1 ) state equals: SGRedState uniqueInstance .
 self assert: (grid at:  2 @ 1 ) state equals: SGYellowState uniqueInstance.
 self assert: (grid at:  3 @ 1 ) state equals: SGRedState uniqueInstance.
 self assert: (grid at:  1 @ 2 ) state equals: SGBlueState uniqueInstance.
 self assert: (grid at:  2 @ 2 ) state equals: SGBombState uniqueInstance.
 self assert: (grid at:  3 @ 2 ) state equals: SGGreenState uniqueInstance.

]

{ #category : 'tests' }
SGStringToGridParserTest >> testConvertAStringToABoardAllBoxHasGoodPosition [
"Y: Yellow , B: Blue , G: Green , R: Red , Mu : Multicolor
 represents this grid:
 | R | Y | r |
 | B | bo | g |
 "
 |grid iRow iCol|
 grid:=SGStringToGridParser new parse: '| R | Y | R |
 | B | Bo | G |'.
 iRow := 0.
 2 timesRepeat: [iCol := 0.
	iRow:=iRow +1.
	3 timesRepeat: [ 
		iCol:=iCol +1.
		self assert: (grid at: iCol @ iRow ) position equals: iCol@iRow .
		 ]
	].

]

{ #category : 'tests' }
SGStringToGridParserTest >> testConvertAStringToABoardWorkWithTooMuchBar [
"Y: Yellow , B: Blue , G: Green , R: Red , Mu : Multicolor
 represents this grid:
 | R | Y | r |
 | B | bo | g |
 "
 | grid|
 grid:=SGStringToGridParser new parse: '| R|| | Y | R |
 | B | Bo||||| | G |'.
 self assert: (grid at: 1 @ 1 ) state equals: SGRedState uniqueInstance .
 self assert: (grid at: 2 @ 1 ) state equals: SGYellowState uniqueInstance.
 self assert: (grid at: 3 @ 1 ) state equals: SGRedState uniqueInstance.
 self assert: (grid at: 1 @ 2 ) state equals: SGBlueState uniqueInstance.
 self assert: (grid at: 2 @ 2 ) state equals: SGBombState uniqueInstance.
 self assert: (grid at: 3 @ 2 ) state equals: SGGreenState uniqueInstance.

]

{ #category : 'tests' }
SGStringToGridParserTest >> testConvertAnEmptyStringThrowError [
"Y: Yellow , B: Blue , G: Green , R: Red , Mu : Multicolor
 represents this grid:
 | R | Y | r |
 | B | bo | g |
 "
 |actualBoard iRow iCol|
self
    should: [ SGStringToGridParser new parse: '' ]
    raise: Error.

 
 

]
