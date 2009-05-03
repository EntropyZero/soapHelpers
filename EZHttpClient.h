//
//  EZHttpClient.h
//
//  Created by Mike Brockey on 9/1/08.
//

#import <UIKit/UIKit.h>

@interface EZHttpClient : NSObject {

}

-(NSString*)makeRequest:(NSURL*)url HttpMethod:(NSString*)httpMethod HTTPHeadersFromDictionary:(NSDictionary*) httpHeaders 
 HttpBodyFromDictionary:(NSDictionary*)bodyValues;

-(NSString*)makeRequest:(NSURL*)url HttpMethod:(NSString*)httpMethod HTTPHeadersFromDictionary:(NSDictionary*) httpHeaders 
	 HttpBodyFromString:(NSString*)body;

@end
