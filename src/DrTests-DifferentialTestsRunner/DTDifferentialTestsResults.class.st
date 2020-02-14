Class {
	#name : #DTDifferentialTestsResults,
	#superclass : #Object,
	#instVars : [
		'passWasFailure',
		'passWasError',
		'passNew',
		'failWasPass',
		'failWasError',
		'failNew',
		'errorWasPass',
		'errorWasFailure',
		'errorNew'
	],
	#category : #'DrTests-DifferentialTestsRunner'
}

{ #category : #adding }
DTDifferentialTestsResults >> addErrorNew: anError [
	errorNew add: anError
]

{ #category : #adding }
DTDifferentialTestsResults >> addErrorWasFailure: anError [
	errorWasFailure add: anError
]

{ #category : #adding }
DTDifferentialTestsResults >> addErrorWasPass: anError [
	errorWasPass add: anError
]

{ #category : #adding }
DTDifferentialTestsResults >> addFailWasError: aFailure [
	failWasError add: aFailure
]

{ #category : #adding }
DTDifferentialTestsResults >> addFailWasPass: aFailure [
	failWasPass add: aFailure
]

{ #category : #adding }
DTDifferentialTestsResults >> addFailureNew: aFailure [
	errorNew add: aFailure
]

{ #category : #adding }
DTDifferentialTestsResults >> addPassNew: aPass [
	passNew add: aPass
]

{ #category : #adding }
DTDifferentialTestsResults >> addPassWasError: aPass [ 
	passWasError add: aPass
]

{ #category : #adding }
DTDifferentialTestsResults >> addPassWasFailure: aPass [
	passWasFailure add: aPass
]

{ #category : #accessing }
DTDifferentialTestsResults >> errorNew [
	^ errorNew
]

{ #category : #accessing }
DTDifferentialTestsResults >> errorNew: anObject [
	errorNew := anObject
]

{ #category : #accessing }
DTDifferentialTestsResults >> errorWasFailure [
	^ errorWasFailure
]

{ #category : #accessing }
DTDifferentialTestsResults >> errorWasFailure: anObject [
	errorWasFailure := anObject
]

{ #category : #accessing }
DTDifferentialTestsResults >> errorWasPass [
	^ errorWasPass
]

{ #category : #accessing }
DTDifferentialTestsResults >> errorWasPass: anObject [
	errorWasPass := anObject
]

{ #category : #accessing }
DTDifferentialTestsResults >> failNew [
	^ failNew
]

{ #category : #accessing }
DTDifferentialTestsResults >> failNew: anObject [
	failNew := anObject
]

{ #category : #accessing }
DTDifferentialTestsResults >> failWasError [
	^ failWasError
]

{ #category : #accessing }
DTDifferentialTestsResults >> failWasError: anObject [
	failWasError := anObject
]

{ #category : #accessing }
DTDifferentialTestsResults >> failWasPass [
	^ failWasPass
]

{ #category : #accessing }
DTDifferentialTestsResults >> failWasPass: anObject [
	failWasPass := anObject
]

{ #category : #initialization }
DTDifferentialTestsResults >> initialize [
	passWasFailure := OrderedCollection new.
	passWasError := OrderedCollection new.
	passNew := OrderedCollection new.
	failWasPass := OrderedCollection new.
	failWasError := OrderedCollection new.
	failNew := OrderedCollection new. 
	errorWasPass := OrderedCollection new.
	errorWasFailure := OrderedCollection new. 
	errorNew := OrderedCollection new.
]

{ #category : #accessing }
DTDifferentialTestsResults >> passNew [
	^ passNew
]

{ #category : #accessing }
DTDifferentialTestsResults >> passNew: anObject [
	passNew := anObject
]

{ #category : #accessing }
DTDifferentialTestsResults >> passWasError [
	^ passWasError
]

{ #category : #accessing }
DTDifferentialTestsResults >> passWasError: anObject [
	passWasError := anObject
]

{ #category : #accessing }
DTDifferentialTestsResults >> passWasFailure [
	^ passWasFailure
]

{ #category : #accessing }
DTDifferentialTestsResults >> passWasFailure: anObject [
	passWasFailure := anObject
]
