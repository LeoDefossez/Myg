Class {
	#name : 'SGStringToGridParserTest',
	#superclass : 'TestCase',
	#category : 'Myg-SameGame-Tests-Model',
	#package : 'Myg-SameGame-Tests',
	#tag : 'Model'
}

{ #category : 'tests' }
SGStringToGridParserTest >> testConvertAStringToABoard [
"Y: Yellow , B: Blue , G: Green , R: Red , Mu : Multicolor
 represents this grid:
 | R | Y | r |
 | B | bo | g |
 "
 |actualBoard|
 actualBoard:=SGStringToGridParser new parse: '| R | Y | R |
 | B | Bo | G |'.
 self assert: (actualBoard atColumn: 1 atRow: 1 ) state equals: SGRedState uniqueInstance .
 self assert: (actualBoard atColumn: 2 atRow: 1 ) state equals: SGYellowState uniqueInstance.
 self assert: (actualBoard atColumn: 3 atRow: 1 ) state equals: SGRedState uniqueInstance.
 self assert: (actualBoard atColumn: 1 atRow: 2 ) state equals: SGBlueState uniqueInstance.
 self assert: (actualBoard atColumn: 2 atRow: 2 ) state equals: SGBombState uniqueInstance.
 self assert: (actualBoard atColumn: 3 atRow: 2 ) state equals: SGGreenState uniqueInstance.

]

{ #category : 'tests' }
SGStringToGridParserTest >> testConvertAStringToABoardWorkWithTooMuchBar [
"Y: Yellow , B: Blue , G: Green , R: Red , Mu : Multicolor
 represents this grid:
 | R | Y | r |
 | B | bo | g |
 "
 | actualBoard|
 actualBoard:=SGStringToGridParser new parse: '| R|| | Y | R |
 | B | Bo||||| | G |'.
 self assert: (actualBoard atColumn: 1 atRow: 1 ) state equals: SGRedState uniqueInstance .
 self assert: (actualBoard atColumn: 2 atRow: 1 ) state equals: SGYellowState uniqueInstance.
 self assert: (actualBoard atColumn: 3 atRow: 1 ) state equals: SGRedState uniqueInstance.
 self assert: (actualBoard atColumn: 1 atRow: 2 ) state equals: SGBlueState uniqueInstance.
 self assert: (actualBoard atColumn: 2 atRow: 2 ) state equals: SGBombState uniqueInstance.
 self assert: (actualBoard atColumn: 3 atRow: 2 ) state equals: SGGreenState uniqueInstance.

]
