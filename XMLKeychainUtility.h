//
//  XMLKeychainUtility.h
//  bag.xml
//
//  Created by XML on 17/04/25.
//  Copyright (c) 2025 D, Mali Coemen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Security/Security.h>

#import "XMLUtility.h"

@interface XMLKeychainUtility : NSObject

+ (BOOL)saveString:(NSString *)string forKey:(NSString *)key;
+ (NSString *)loadStringForKey:(NSString *)key;
+ (NSString *)checkStringForKey:(NSString *)key;

+ (BOOL)deleteStringForKey:(NSString *)key;

@end
