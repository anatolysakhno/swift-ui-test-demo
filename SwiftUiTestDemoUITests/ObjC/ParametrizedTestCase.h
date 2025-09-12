//
//  ParametrizedTestCase.h
//  TestExperimentsUITests
//
//  Created by Marian Shkurda on 12.09.2025.
//

#import <XCTest/XCTest.h>

NS_ASSUME_NONNULL_BEGIN
@interface TestMethodSelectorWrapper : NSObject
- (instancetype)initWithSelector:(SEL)selector;
@end

@interface ParametrizedTestCase : XCTestCase
+ (NSArray<TestMethodSelectorWrapper *> *)testMethodSelectors;
@end

@interface PlainTestCase : XCTestCase
@end

NS_ASSUME_NONNULL_END
