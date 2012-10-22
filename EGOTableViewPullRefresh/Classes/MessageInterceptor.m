//
//  MessageInterceptor.m
//
//  Proposed from e.James on 10/05/10.
//  Link: http://stackoverflow.com/a/3862591
//

#import "MessageInterceptor.h"


@implementation MessageInterceptor

@synthesize receiver;
@synthesize middleMan;


#pragma mark - Initialization

MessageInterceptor* InterceptMessages(id middleMan, id receiver) {
    return [MessageInterceptor messageInterceptorOver:middleMan to:receiver];
}

+ (MessageInterceptor *)messageInterceptorOver:(id)middleMan to:(id)receiver {
    MessageInterceptor* messageInterceptor = [[MessageInterceptor alloc] init];
    messageInterceptor.receiver  = receiver;
    messageInterceptor.middleMan = middleMan;
    return messageInterceptor;
}


#pragma mark - NSObject overrides

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if ([middleMan respondsToSelector:aSelector]) { return middleMan; }
    if ([receiver respondsToSelector:aSelector])  { return receiver;  }
    return [super forwardingTargetForSelector:aSelector];
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    if ([middleMan respondsToSelector:aSelector]) { return YES; }
    if ([receiver respondsToSelector:aSelector])  { return YES; }
    return [super respondsToSelector:aSelector];
}

- (BOOL)conformsToProtocol:(Protocol *)aProtocol {
    if ([middleMan conformsToProtocol:aProtocol]) { return YES; }
    if ([receiver conformsToProtocol:aProtocol])  { return YES; }
    return [super conformsToProtocol:aProtocol];
}

@end
