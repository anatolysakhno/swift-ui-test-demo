//
//  ParametrizedTestCase.m
//  TestExperimentsUITests
//
//  Created by Marian Shkurda on 12.09.2025.
//

#import "ParametrizedTestCase.h"

@interface TestMethodSelectorWrapper ()
@property(nonatomic, assign) SEL selector;
@end

@implementation TestMethodSelectorWrapper

- (instancetype)initWithSelector:(SEL)selector {
    self = [super init];
    _selector = selector;
    return self;
}

@end

@implementation ParametrizedTestCase
+ (NSArray<NSInvocation *> *)testInvocations {
    NSArray<TestMethodSelectorWrapper *> *wrappers = [self testMethodSelectors];
    NSMutableArray<NSInvocation *> *invocations = [NSMutableArray arrayWithCapacity:wrappers.count];

    for (TestMethodSelectorWrapper *wrapper in wrappers) {
        SEL selector = wrapper.selector;
        NSMethodSignature *signature = [self instanceMethodSignatureForSelector:selector];
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        invocation.selector = selector;

        [invocations addObject:invocation];
    }

    return invocations;
}

+ (NSArray<TestMethodSelectorWrapper *> *)testMethodSelectors {
    return @[];
}
@end
