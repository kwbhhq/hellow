//
//  Nsarray+SafetyArray.h
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/12/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray(SafetyArray)

- (id)safetyObjectAtIndex:(NSUInteger)index;

@end

@interface NSMutableArray(SafetyNSMutableArray)

- (void)safetyAddObject:(id)anObject;

- (void)safetyInsertObject:(id)anObject atIndex:(NSUInteger)index;

- (void)safetyRemoveObjectAtIndex:(NSUInteger)index;

- (void)safetyReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;

@end

NS_ASSUME_NONNULL_END
