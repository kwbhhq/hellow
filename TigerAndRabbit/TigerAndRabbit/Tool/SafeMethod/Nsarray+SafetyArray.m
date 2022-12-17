//
//  Nsarray+SafetyArray.m
//  TigerAndRabbit
//
//  Created by 康文波 on 2022/12/10.
//

#import "Nsarray+SafetyArray.h"

@implementation NSArray(SafetyArray)

- (id)safetyObjectAtIndex:(NSUInteger)index {
    if(index < self.count && index >= 0) {
        return [self objectAtIndex:index];
    }
    return nil;
}

@end

@implementation NSMutableArray(SafetyNSMutableArray)

- (void)safetyAddObject:(id)anObject {
    if(anObject) {
        [self addObject:anObject];
    }
}

- (void)safetyInsertObject:(id)anObject atIndex:(NSUInteger)index {
    if(anObject && index < self.count && index >= 0) {
        [self insertObject:anObject atIndex:index];
    }
}

- (void)safetyRemoveObjectAtIndex:(NSUInteger)index {
    if(index >= 0 && index < self.count) {
        [self removeObjectAtIndex:index];
    }
}

- (void)safetyReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    if(anObject && index < self.count && index >= 0) {
        [self replaceObjectAtIndex:index withObject:anObject];
    }
}

@end
