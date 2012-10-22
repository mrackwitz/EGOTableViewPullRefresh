//
//  MessageInterceptor.h
//
//  Proposed from e.James on 10/05/10.
//  Link: http://stackoverflow.com/a/3862591
//

#import <Foundation/Foundation.h>


@interface MessageInterceptor : NSObject {
    id receiver;
    id middleMan;
}

@property (nonatomic, assign) id receiver;
@property (nonatomic, assign) id middleMan;

+ (MessageInterceptor *)messageInterceptorOver:(id)middleMan to:(id)receiver;

@end


MessageInterceptor* InterceptMessages(id middleMan, id receiver);
