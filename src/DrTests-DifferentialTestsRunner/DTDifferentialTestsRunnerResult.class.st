Class {
	#name : #DTDifferentialTestsRunnerResult,
	#superclass : #DTTestsRunnerResult,
	#instVars : [
		'previousResults',
		'differentialResult'
	],
	#category : #'DrTests-DifferentialTestsRunner'
}

{ #category : #accessing }
DTDifferentialTestsRunnerResult >> calculateDifference [
	| previous |
	differentialResult := TestResult new.
	previousResults ifNil:[ ^ self ]."Nothing to compare, first execution"
	previous := previousResults currentTestResults.
	
	testsResult passed do:[:aPassingTest| 
		(self is: aPassingTest in: previous passed)
			ifFalse: [ differentialResult addPass: aPassingTest ]].
		
	testsResult failures do:[:aFailingTest|		
		(self is: aFailingTest in: previous failures)
			ifFalse: [ differentialResult addFailure: aFailingTest ]].
			
	testsResult errors do:[:anErroredTest|
		(self is: anErroredTest in: previous errors)
			ifFalse: [ differentialResult addError: anErroredTest ]].
]

{ #category : #accessing }
DTDifferentialTestsRunnerResult >> color [
	differentialResult errors ifNotEmpty: [ ^ self theme dangerBackgroundColor ].
	differentialResult failures ifNotEmpty: [ ^ self theme warningBackgroundColor ].
	^ self theme successBackgroundColor
]

{ #category : #accessing }
DTDifferentialTestsRunnerResult >> currentTestResults [
	^ testsResult
]

{ #category : #testing }
DTDifferentialTestsRunnerResult >> is: aTest in: aPreviousTestCollection [ 
	"tests are not compared as I thought, so I'm using a custom predicate"
	^ aPreviousTestCollection 
		anySatisfy: [:aPreviousTest | self is: aTest theSameAs: aPreviousTest ]
]

{ #category : #testing }
DTDifferentialTestsRunnerResult >> is: aTest theSameAs: anotherTest [
	"predicate to compare current and previous result.
	Can probably be improved"
	^ aTest selector = anotherTest selector 
		and: [ aTest class = anotherTest class ]
]

{ #category : #accessing }
DTDifferentialTestsRunnerResult >> previousResults [
	^ previousResults
]

{ #category : #accessing }
DTDifferentialTestsRunnerResult >> previousResults: aTestResult [
	previousResults := aTestResult
]

{ #category : #accessing }
DTDifferentialTestsRunnerResult >> summarizeInfo [
	"Text showed in miniDrTests with info of the result "
	^ String
		streamContents: [ :s | 
			
			differentialResult passed ifNotEmpty:[
				s
					print: self testResults passed size;
					<< ' new tests passed';
					cr
				].
			differentialResult failures ifNotEmpty:[
				s
					print: self testResults failures size;
					<< ' new tests failures';
					cr
				].
			differentialResult errors ifNotEmpty:[
				s
					print: self testResults errors size;
					<< ' new tests errors';
					cr
			].
			(differentialResult passed isEmpty 
				and: [ differentialResult failures isEmpty 
					and: [ differentialResult errors isEmpty ]])
				ifTrue:[
					s print: 'No tests have changed !'; cr ]
		]
]

{ #category : #accessing }
DTDifferentialTestsRunnerResult >> testResults [
	^ differentialResult
]
