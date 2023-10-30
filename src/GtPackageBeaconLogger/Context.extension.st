Extension { #name : #Context }

{ #category : #'*GtPackageBeaconLogger' }
Context >> gtDebugFor: anAction [
	<gtAction>
	^ anAction button
		tooltip: 'Debug Context';
		priority: 1;
		icon: BrGlamorousVectorIcons debug;
		action: [ :aButton | 
			UIManager default
				requestDebuggerOpeningNamed: 'Debugging Suspended Context: ' , self asString
				inContext: self ]
]
