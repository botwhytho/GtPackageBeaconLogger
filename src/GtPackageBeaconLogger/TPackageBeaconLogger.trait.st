Trait {
	#name : #TPackageBeaconLogger,
	#classInstVars : [
		'MyAnnouncer',
		'Logger'
	],
	#category : #GtPackageBeaconLogger
}

{ #category : #accessing }
TPackageBeaconLogger classSide >> announce: anObject [
	self logger.
	(anObject isKindOf: String)
		ifTrue: [ self announcer announce: (StringSignal new message: anObject) ]
		ifFalse: [ self announcer
				announce: (anObject
						in: [ :object | (object isKindOf: Context) ifTrue: [ object copyStack ] ifFalse: [ object ] ])
						asBeaconSignal ].
	^ self logger
]

{ #category : #accessing }
TPackageBeaconLogger classSide >> announcer [
	^ MyAnnouncer ifNil: [ MyAnnouncer := Announcer new ]
]

{ #category : #view }
TPackageBeaconLogger classSide >> gtInspectLoggerFor: anAction [
	<gtClassAction>
	^ anAction button
		tooltip: 'Inspect Logger';
		priority: 1;
		icon: BrGlamorousVectorIcons inspect;
		action: [ :aButton | aButton phlow spawnObject: self logger ]
]

{ #category : #accessing }
TPackageBeaconLogger classSide >> gtLoggerFor: aView [
<gtClassView>
^ aView forward
	title: 'Logger';
	priority: 1;
	object: self logger;
	view: #gtRecordingsFor:
]

{ #category : #accessing }
TPackageBeaconLogger classSide >> logger [
	^ Logger
		ifNil: [ Logger := MemoryLogger new
					beacon: (Beacon new announcer: self announcer);
					start;
					yourself ]
]

{ #category : #accessing }
TPackageBeaconLogger classSide >> reset [
	self logger reset
]

{ #category : #accessing }
TPackageBeaconLogger classSide >> stop [
	self logger stop.
	Logger := nil
]
