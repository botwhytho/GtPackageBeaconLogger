Extension { #name : #Object }

{ #category : #'*GtPackageBeaconLogger' }
Object >> logToBeaconInPackage: aPackage [
	| aLogger aPackageName newClassName |
	aPackageName := aPackage asPackage name.
	newClassName := (aPackageName copyReplaceAll: '-' with: '') , 'BeaconLogger'.
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
Object >> logToNamed: aString [
	| logger loggers |
	loggers := AllLogers loggers.
	logger := loggers
			detect: [ :each | each name = aString ]
			ifNone: [ | newLogger |
				newLogger := AllLogers loggers add: (CircularMemoryLogger named: aString).
				AllLogers announcer announce: Announcement new.
				newLogger ].
	logger nextPut: self asBeaconSignal.
	^ self
]

{ #category : #'*GtPackageBeaconLogger' }
Object >> logToPackageBeacon [
	^ self logToBeaconInPackage: thisContext sender receiver class package
]
