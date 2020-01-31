Class {
	#name : #DTDifferentialTestsRunner,
	#superclass : #DTTestsRunner,
	#instVars : [
		'previousResult'
	],
	#category : #'DrTests-DifferentialTestsRunner'
}

{ #category : #'api - accessing' }
DTDifferentialTestsRunner class >> pluginName [
	^ 'Differential Test Runner'
]

{ #category : #'api - accessing' }
DTDifferentialTestsRunner class >> pluginResultClass [
	^ DTDifferentialTestsRunnerResult
]

{ #category : #api }
DTDifferentialTestsRunner >> runForConfiguration: aDTpluginConfiguration [
	| results |
	results := self pluginResultClass new
		testResults: (self runTestSuites: { aDTpluginConfiguration asTestSuite });
		previousResults: previousResult;
		calculateDifference;
		yourself.
	previousResult := results.
	^ aDTpluginConfiguration handleResults: results for: self
]
