# XMLKeychain
 A keychain access library for legacy iOS I ended up not using in my app.
 I coded this with the iOS 6.1 SDK, i dont know if it works on anything different, try it however.

# How to Call
These functions are declared in the header of the keychain utility, you can call them normally. Make sure you imported the header of the keychain utility into the header file of choice or implementation file, don't forget the app delegate.
```
+ (BOOL)saveString:(NSString *)string forKey:(NSString *)key;
+ (NSString *)loadStringForKey:(NSString *)key;
+ (NSString *)checkStringForKey:(NSString *)key;

+ (BOOL)deleteStringForKey:(NSString *)key;
```

for example:

```
[XMLKeychainUtility saveString:dataDict[@"ursprung"] forKey:@"devUUID"];
```
or
```
if([XMLObjectRetriever checkForAuth] == YES) {
        NSLog(@"Auth Check Success");
```

Do keep in mind however for this keychain access library to work, you need to add a few things into your application delegate file.

import
```
#import <Foundation/Foundation.h>
#import <Security/Security.h>
#import <CoreData/CoreData.h>
```

also assign these properties into the interface of the header
```
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
```


