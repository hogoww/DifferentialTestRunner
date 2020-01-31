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
		(previous passed anySatisfy: [:aTest| aTest selector = aPassingTest selector]) 
			ifFalse: [ differentialResult addPass: aPassingTest ]].
		
	previous failures do:[:aFailingTest|	
			(previous failures anySatisfy: [:aTest| aTest selector = aFailingTest selector]) 
				ifFalse: [ differentialResult addFailure: aFailingTest ]].
			
	previous errors do:[:anErroredTest|	
			(previous error anySatisfy: [:aTest| aTest selector = anErroredTest selector]) 
				ifFalse: [ differentialResult addError: anErroredTest ]].
	
	self halt.
	^ differentialResult
]

{ #category : #accessing }
DTDifferentialTestsRunnerResult >> previousResults [
	^ previousResults
]

{ #category : #accessing }
DTDifferentialTestsRunnerResult >> previousResults: aTestResult [
	previousResults := aTestResult
]
