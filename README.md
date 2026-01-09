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
if ([XMLKeychainUtility checkStringForKey:@"uniqueAppID"] == nil) {
```

Do keep in mind however for this keychain access library to work, you may need to add a few things into your application delegate file.

import
```
#import <Foundation/Foundation.h>
#import <Security/Security.h>
#import <CoreData/CoreData.h>
```
im not 100% sure if you need this, last time i touched this was in june, keychain works fine for me in ios simulator, data PERSISTS even after the app is being deleted and re-installed, which makes it easy to make the app itself trackable.

# Why use this?
Originally I opted to use my own library, and Keychain in general due to me being able to assign unique app ID's to apps installed on any device by giving the app a device unique UUID and app ID which would not change even if you re install the app, saving them in a database and thus making API access limited to only apps within that app uuid register. Applications with invalid app ID's can not access the API and are thus locked out.

