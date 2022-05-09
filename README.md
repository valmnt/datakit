# DataKit

DataKit is a Swift Framework used to store data in the CoreData, only available for iOS 15.0 and later.

DataKit introduces Persistance concept.

# Documentation

Firstly, you've to declare your NSPersistanceContainer.

```swift
Persistence.shared.container = NSPersistentContainer(name: "name-of-your-xcdatamodel")
```

Then, you can use the stack.
