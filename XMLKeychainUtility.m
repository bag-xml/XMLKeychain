//
//  XMLKeychainUtility.m
//  bag.xml
//
//  Created by XML on 17/04/25.
//  Copyright (c) 2025 D, Mali Coemen. All rights reserved.
//

#import "XMLKeychainUtility.h"

@implementation XMLKeychainUtility

#pragma mark Query function
+ (NSMutableDictionary *)keychainQueryForKey:(NSString *)key {
    return [@{
              (__bridge id)kSecClass: (__bridge id)kSecClassGenericPassword,
              (__bridge id)kSecAttrService: key,
              (__bridge id)kSecAttrAccessible: (__bridge id)kSecAttrAccessibleAfterFirstUnlock
              } mutableCopy];
}


#pragma mark Addition and removal

+ (BOOL)deleteStringForKey:(NSString *)key {
    NSMutableDictionary *query = [self keychainQueryForKey:key];
    OSStatus status = SecItemDelete((__bridge CFDictionaryRef)query);
    return (status == errSecSuccess || status == errSecItemNotFound);
}


+ (BOOL)saveString:(NSString *)string forKey:(NSString *)key {
    [self deleteStringForKey:key]; // ensure no duplicate
    
    NSMutableDictionary *query = [self keychainQueryForKey:key];
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    query[(__bridge id)kSecValueData] = data;
    
    OSStatus status = SecItemAdd((__bridge CFDictionaryRef)query, NULL);
    return (status == errSecSuccess);
}


#pragma mark Retrieval
+ (NSString *)loadStringForKey:(NSString *)key {
    NSMutableDictionary *query = [self keychainQueryForKey:key];
    query[(__bridge id)kSecReturnData] = @YES;
    query[(__bridge id)kSecMatchLimit] = (__bridge id)kSecMatchLimitOne;
    
    CFDataRef result = NULL;
    OSStatus status = SecItemCopyMatching((__bridge CFDictionaryRef)query, (CFTypeRef *)&result);
    if (status == errSecSuccess && result) {
        NSData *data = (__bridge_transfer NSData *)result;
        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return nil;
}

+ (NSString *)checkStringForKey:(NSString *)key {
    return [self loadStringForKey:key];
}

@end
