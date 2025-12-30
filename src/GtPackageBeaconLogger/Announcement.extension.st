Extension { #name : 'Announcement' }

{ #category : '*GtPackageBeaconLogger' }
Announcement >> emitToNamed: aString [
	^ self logToNamed: aString
]
