Class {
	#name : #AllLogers,
	#superclass : #Object,
	#classInstVars : [
		'loggers',
		'announcer'
	],
	#category : #GtPackageBeaconLogger
}

{ #category : #'*GtPackageBeaconLogger' }
AllLogers class >> addLoger: logger [
	self loggers add: logger
]

{ #category : #accessing }
AllLogers class >> announcer [
	announcer ifNil: [ announcer := Announcer new ]
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
		updateWhen: Announcement in: [ self announcer ]
]

{ #category : #accessing }
AllLogers class >> loggers [
	^ loggers
		ifNil: [ loggers := SignalLogger allSubInstances asOrderedCollection ]
]
