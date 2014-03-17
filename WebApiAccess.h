//
//  WebApiAccess.h
//  jsonReceiver
//
//  Created by ohtake shingo on 2014/03/15.
//  Copyright (c) 2014年 ohtake shingo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WebAPIAccessDelegate
@optional
-(void)didFinishedGetJson:(NSArray*)data;
@end

@interface WebApiAccess : NSObject<NSURLConnectionDataDelegate>{
    NSMutableData *receivedData;;
}
@property id<WebAPIAccessDelegate> delegate;
-(void)getJson:(int)idnum;
@end
