//
//  EZHttpClient.m
//
//  Created by Mike Brockey on 9/1/08.
//

/* 
	// Example Usage

	EZHttpClient *client = [[[EZHttpClient alloc]init]autorelease];

	//	<form method="post">
	//	<input type="hidden" name="projectName" value="CCNet" />
	//	<input type="hidden" name="serverName" value="local" />
	//	<font color="Black">
	//	<input type="submit" name="ForceBuild" value="Force"/>
	//	<input type="submit" name="StopBuild" value="Stop"/>
	//	</font>
	//	</form>

	NSArray *bodyKeys = [NSArray arrayWithObjects:@"projectName", @"serverName", @"ForceBuild", nil];
	NSArray *bodyValues = [NSArray arrayWithObjects:project.name, @"local", @"Force", nil];
	NSDictionary *bodyDictionary = [NSDictionary dictionaryWithObjects:bodyValues forKeys:bodyKeys];

	[client makeRequest:url HttpMethod:@"POST" 
	HTTPHeadersFromDictionary:headerDictionary 
	HttpBodyFromDictionary:bodyDictionary];
*/

#import "EZHttpClient.h"


@implementation EZHttpClient

-(NSString*)makeRequest:(NSURL*)url HttpMethod:(NSString*)httpMethod HTTPHeadersFromDictionary:(NSDictionary*) httpHeaders 
 HttpBodyFromDictionary:(NSDictionary*)bodyValues
{
	NSMutableURLRequest  *post = [[[NSMutableURLRequest  alloc] initWithURL:url] autorelease];
	[post setHTTPMethod: httpMethod];
	
	for (id key in httpHeaders)
	{
		[post addValue:[httpHeaders objectForKey:key] forHTTPHeaderField:key];
	}	

	NSString* bodyBuilder = @"";
	if(bodyValues != nil)
	{
		for (id key in bodyValues)
		{
			bodyBuilder = [bodyBuilder stringByAppendingFormat:@"&%@=%@", key, [bodyValues objectForKey:key]];
		}
		bodyBuilder = [bodyBuilder substringFromIndex:1];
	}
	[post setHTTPBody: [[[NSString alloc] initWithString:bodyBuilder] 
						dataUsingEncoding: NSASCIIStringEncoding]];
	
	NSURLResponse* response;
	NSError* error;
	NSData* result;
	
	result = [NSURLConnection sendSynchronousRequest:post returningResponse:&response error:&error];
	return [[[NSString alloc] initWithData:result encoding:NSASCIIStringEncoding] autorelease];
}

-(NSString*)makeRequest:(NSURL*)url HttpMethod:(NSString*)httpMethod HTTPHeadersFromDictionary:(NSDictionary*) httpHeaders 
	 HttpBodyFromString:(NSString*)body
{
	NSMutableURLRequest  *post = [[[NSMutableURLRequest  alloc] initWithURL:url] autorelease];
	[post setHTTPMethod: httpMethod];
	
	for (id key in httpHeaders)
	{
		[post addValue:[httpHeaders objectForKey:key] forHTTPHeaderField:key];
	}	

	[post setHTTPBody: [[[NSString alloc] initWithString:body] 
						dataUsingEncoding: NSASCIIStringEncoding]];
	
	NSURLResponse* response;
	NSError* error;
	NSData* result;
	
	result = [NSURLConnection sendSynchronousRequest:post returningResponse:&response error:&error];
	return [[[NSString alloc] initWithData:result encoding:NSASCIIStringEncoding] autorelease];
}

@end
