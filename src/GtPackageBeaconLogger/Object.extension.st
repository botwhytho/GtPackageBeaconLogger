Extension { #name : #Object }

{ #category : #'*GtPackageBeaconLogger' }
Object >> logToBeaconInPackage: aPackage [
	| aLogger aPackageName newClassName |
	aPackageName := aPackage asPackage name.
	newClassName := aPackageName , 'BeaconLogger'.
	aLogger := [ newClassName asClass ]
			on: NotFound
			do: [ | newClass |
				newClass := (Object << newClassName)
						traits: TPackageBeaconLogger;
						package: aPackageName;
						build;
						install.
				self
					inform: 'Class `' , newClassName , '` created. Class name has been added to clipboard'.
				GtClipboard default clipboardText: newClassName.
				newClass ].
	aLogger announce: self.
	^ aLogger
]

{ #category : #'*GtPackageBeaconLogger' }
Object >> logToPackageBeacon [
	^ self logToBeaconInPackage: thisContext sender receiver class package
]
