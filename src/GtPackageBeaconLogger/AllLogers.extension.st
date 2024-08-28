Extension { #name : #AllLogers }

{ #category : #'*GtPackageBeaconLogger' }
AllLogers class >> logObject: anObject toLogger: aLogger [
	| wrappedObject |
	wrappedObject := (anObject isKindOf: String)
			ifTrue: [ StringSignal new message: anObject ]
			ifFalse: [ ((anObject isKindOf: Context)
					ifTrue: [ anObject copyStack ]
					ifFalse: [ anObject ]) asBeaconSignal ].
	aLogger nextPut: wrappedObject
]
