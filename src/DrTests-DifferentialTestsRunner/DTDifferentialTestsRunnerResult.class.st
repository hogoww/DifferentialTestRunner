Class {
	#name : #DTDifferentialTestsRunnerResult,
	#superclass : #DTTestsRunnerResult,
	#instVars : [
		'previousResults'
	],
	#category : #'DrTests-DifferentialTestsRunner'
}

{ #category : #accessing }
DTDifferentialTestsRunnerResult >> calculateDifference [
	| previous differentialResult |
	differentialResult := TestResult new.
	previous := previousResults testResults.
	previous ifNil:[ ^ self ]."Nothing to compare, first execution"
	
	testsResult passed do:[:aPassingTest| 
		(self is: aPassingTest in: previous passed)
			ifFalse: [ differentialResult addPass: aPassingTest ]].
		
	testsResult failures do:[:aFailingTest|		
		(self is: aFailingTest in: previous failure)
			ifFalse: [ differentialResult addFailure: aFailingTest ]].
			
	testsResult errors do:[:anErroredTest|
		(self is: anErroredTest in: previous errors)
			ifFalse: [ differentialResult addError: anErroredTest ]].
	
	^ differentialResult
]

{ #category : #testing }
DTDifferentialTestsRunnerResult >> is: aTest in: aPreviousTestCollection [ 
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
