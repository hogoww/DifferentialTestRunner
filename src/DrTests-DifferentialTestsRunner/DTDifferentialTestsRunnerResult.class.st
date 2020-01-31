Class {
	#name : #DTDifferentialTestsRunnerResult,
	#superclass : #DTTestsRunnerResult,
	#instVars : [
		'previousTestsResult'
	],
	#category : #'DrTests-DifferentialTestsRunner'
}

{ #category : #accessing }
DTDifferentialTestsRunnerResult >> previousTestsResult [
	^ previousTestsResult
]

{ #category : #accessing }
DTDifferentialTestsRunnerResult >> previousTestsResult: aTestResult [
	previousTestsResult := aTestResult
]

{ #category : #accessing }
DTDifferentialTestsRunnerResult >> testResults: aTestResult [
	previousTestsResult ifNil:[ 
		previousTestsResult := aTestResult.
		testsResult := aTestResult. ^ self ].
	self halt.
	
]
