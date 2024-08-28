Class {
	#name : #AllLogers,
	#superclass : #Object,
	#classInstVars : [
		'loggers',
		'announcer'
	],
	#category : #GtPackageBeaconLogger
}

{ #category : #accessing }
AllLogers class >> announcer [
	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #accessing }
AllLogers class >> ensureLoggerNamed: aString [
	^ AllLogers loggers
		detect: [ :each | each name = aString ]
		ifNone: [ AllLogers announcer announce: Announcement new.
			AllLogers loggers add: (CircularMemoryLogger named: aString) ]
]

{ #category : #accessing }
AllLogers class >> gtLoggersFor: aView [
	<gtClassView>
	| view |
	view := aView columnedList.
	^ view
		title: 'Loggers';
		priority: 1;
		items: [ self loggers ];
		column: 'Name' text: [ :each | each name ];
		column: 'Class' text: [ :each | each class ];
		column: 'Delete'
			stencil: [ :aLogger | 
				BrButton new
					aptitude: BrGlamorousButtonWithIconAptitude;
					icon: BrGlamorousVectorIcons remove;
					action: [ :aBrButton :aBrButtonModel :aBlClickEvent | 
						self loggers remove: aLogger.
						self announcer announce: Announcement new ] ];
		updateWhen: Announcement in: [ self announcer ];
		addAutoUpdate: GtPhlowUpdateViewOnAddedToScene
]

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

{ #category : #accessing }
AllLogers class >> loggers [
	^ loggers
		ifNil: [ loggers := SignalLogger allSubInstances asOrderedCollection ]
]
