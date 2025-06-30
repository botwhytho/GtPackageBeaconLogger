# GtPackageBeaconLogger
Utility traits and extension method on Object to more easily log arbitrary objects to a package scoped beacon in Gt
## Installation

```Smalltalk
[ EpMonitor current
	disableDuring: [ Metacello new
			repository: 'github://botwhytho/GtPackageBeaconLogger:main/src';
			baseline: 'GtPackageBeaconLogger';
			load ] ] forkAt: 29 named: #GtPackageBeaconLogger
```

To depend on this package add this to your baseline:

```Smalltalk
spec baseline: 'GtPackageBeaconLogger' with: [ spec repository: 'github://botwhytho/GtPackageBeaconLogger:main/src' ]
```

### Usage

The easiest way to use is to send `logToNamed:` to an object to create a named ad-hoc logger. There is an `AllLogers` class with a class view that shows all instances of loggers for navigation and/or deletion.

If you want a more permanent logger for your code, you can send `logToPackageBeacon` to an object in your code and it will get logged to a memory logger in a class created in the package the code lives in.

Finally, you can also log the object to a class in a different package by sending it `logToBeaconInPackage:`, for exmple: `BlBasicExamples new circle logToBeaconInPackage: #MyPackage`.

All the above methods are defined on `Object` and return the object they are sent to, simplifying logging of objects without much code change.