# GtPackageBeaconLogger
Utility traits and extension method on Object to more easily log arbitrary objects to a package scoped beacon in Gt
## Installation```Smalltalk[ EpMonitor current	disableDuring: [ Metacello new			repository: 'github://botwhytho/GtPackageBeaconLogger:main/src';			baseline: 'GtPackageBeaconLogger';			load ] ] forkAt: 29 named: #GtPackageBeaconLogger```

To depend on this package add this to your baseline:

```Smalltalk
spec baseline: 'GtPackageBeaconLogger' with: [ spec repository: 'github://botwhytho/GtPackageBeaconLogger:main/src' ]
```### Usage

The easiest way to use is to send `logToPackageBeacon` to an object in your code and it will get logged to a memory logger in a class created in the package the code lives in.

You can also log the object to a class in a different package by sending it `logToBeaconInPackage:`, for exmple: `BlBasicExamples new circle logToBeaconInPackage: #MyPackage`