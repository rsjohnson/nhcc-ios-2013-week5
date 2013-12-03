//
//  NHNetworkManager.m
//  networking
//
//  Created by Ryan Johnson on 11/25/13.
//  Copyright (c) 2013 NHCC. All rights reserved.
//

#import "NHNetworkManager.h"

@interface NHNetworkManager ()
< NSURLConnectionDelegate,
  NSURLConnectionDataDelegate >

@end


@implementation NHNetworkManager
{
    NSMutableData *_data;
    NSURLSession *_session;
    NSURLSessionDataTask *_task;
}

+ (instancetype)sharedManager {
    static NHNetworkManager *sharedManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}

#pragma mark - NSURLConnection

- (void) downloadApple {
    NSURL *url = [NSURL URLWithString:@"http://www.apple.com"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Request: %@ Failed: %@", connection.currentRequest.URL ,error);
}

- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    _data = [[NSMutableData alloc] init];
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [_data appendData:data];
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection {
    NSString *html = [[NSString alloc] initWithData:_data encoding:NSUTF8StringEncoding];
    NSLog(@"%@", html);
}

#pragma mark - Session

- (void) downloadGoogle {
    NSURL *url = [NSURL URLWithString:@"http://www.google.com"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    _task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSString *html = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@", html);
    }];
    [_task resume];
}

@end
