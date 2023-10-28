Class {
	#name : #BaselineOfGtPackageBeaconLogger,
	#superclass : #BaselineOf,
	#category : #BaselineOfGtPackageBeaconLogger
}

{ #category : #baseline }
BaselineOfGtPackageBeaconLogger >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'GtPackageBeaconLogger'
		]
]
