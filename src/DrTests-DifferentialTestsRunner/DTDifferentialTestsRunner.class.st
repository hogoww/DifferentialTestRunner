Class {
	#name : #DTDifferentialTestsRunner,
	#superclass : #DTTestsRunner,
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
