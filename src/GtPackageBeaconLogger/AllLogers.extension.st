Extension { #name : #AllLogers }

{ #category : #'*GtPackageBeaconLogger' }
AllLogers class >> addLoger: logger [
	self loggers add: logger
]
