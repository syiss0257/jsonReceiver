//
//  WebApiAccess.m
//  jsonReceiver
//
//  Created by ohtake shingo on 2014/03/15.
//  Copyright (c) 2014年 ohtake shingo. All rights reserved.
//

#import "WebApiAccess.h"

@implementation WebApiAccess

-(void)getJson{

    NSString *urlStr = [NSString stringWithFormat:@"http://essred.com/service/dbtest/json2.php"];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (conn == nil) NSLog(@"request failed.");
    
    
}


-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    receivedData = [[NSMutableData alloc]init];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [receivedData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSString* retValue = [[NSString alloc]initWithBytes:receivedData.bytes length:receivedData.length encoding:NSUTF8StringEncoding];
    NSLog(@"server res:%@", retValue);
    NSData *jsonData = [retValue dataUsingEncoding:NSUnicodeStringEncoding];
    NSError *error;
    NSArray *jsonDics = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
    [self.delegate didFinishedGetJson:[self parseGetJson:jsonDics]];
}


-(NSArray* )parseGetJson:(NSArray* )jsonDics{
    NSDictionary *rootDic = [jsonDics objectAtIndex:0];
    NSMutableArray *saveDatas = [NSMutableArray arrayWithObjects:[rootDic objectForKey:@"maker_id"],[rootDic objectForKey:@"item_name"], [rootDic objectForKey:@"price"], [rootDic objectForKey:@"keyword"],nil];

    return saveDatas;
    
}


@end
