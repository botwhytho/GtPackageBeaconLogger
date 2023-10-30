Extension { #name : #Object }

{ #category : #'*GtPackageBeaconLogger' }
Object >> logToBeaconInPackage: aPackage [
	| aLogger className |
	className := aPackage asPackage name.
	aLogger := [ className asClass ]
			on: NotFound
			do: [ (Object << (className , 'BeaconLogger' asSymbol))
					traits: TPackageBeaconLogger;
					package: className;
					build;
					install ].
	aLogger announce: self.
	^ aLogger
]
