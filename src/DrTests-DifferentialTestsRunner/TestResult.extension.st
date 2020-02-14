Extension { #name : #TestResult }

{ #category : #'*DrTests-DifferentialTestsRunner' }
TestResult >> asDTDiffenretialTestResults [
	| res |
	res := DTDifferentialTestsResults new.
	res passNew: passed.
	res failNew: failures.
	res errorNew: failures.
	 
	^ res
]
