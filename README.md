# GtPackageBeaconLogger
Utility traits and extension method on Object to more easily log arbitrary objects to a package scoped beacon in Gt
## Installation```Smalltalk[ EpMonitor current	disableDuring: [ Metacello new			repository: 'github://botwhytho/GtPackageBeaconLogger:main/src';			baseline: 'GtPackageBeaconLogger';			load ] ] forkAt: 29 named: #GtPackageBeaconLogger```

To depend on this package add this to your baseline:

```Smalltalk
spec baseline: 'GtPackageBeaconLogger' with: [ spec repository: 'github://botwhytho/GtPackageBeaconLogger:main/src' ]
```