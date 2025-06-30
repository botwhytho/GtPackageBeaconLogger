Extension { #name : #Object }

{ #category : #'*GtPackageBeaconLogger' }
Object >> logToBeaconInPackage: aPackage [
	| aLogger aPackageName newClassName |
	aPackageName := aPackage asPackage name.
	newClassName := (aPackageName copyReplaceAll: '-' with: '') , 'BeaconLogger'.
	aLogger := [ newClassName asClass ]
			on: NotFound
			do: [ | message newClass |
				newClass := (Object << newClassName)
						traits: TPackageBeaconLogger;
						package: aPackageName;
						build;
						install.
				message := 'Class `' , newClassName
						, '` created. Class name has been added to clipboard'.
				self inform: message.
				NonInteractiveTranscript stdout crShow: message.
				GtClipboard clipboardText: newClassName.
				newClass ].
	aLogger announce: self.
	^ self
]

{ #category : #'*GtPackageBeaconLogger' }
Object >> logToNamed: aString [
	| logger |
	logger := AllLogers ensureLoggerNamed: aString.
	AllLogers logObject: self toLogger: logger.
	^ self
]

{ #category : #'*GtPackageBeaconLogger' }
Object >> logToPackageBeacon [
	^ self logToBeaconInPackage: thisContext sender receiver class package
]
