//
//  EZSoapMessageBuilder.m
//
//  Created by Mike Brockey on 10/24/08.
//

#import "EZSoapMessageBuilder.h"


@implementation EZSoapMessageBuilder

+(NSString*)messageWithAction:(NSString*)soapAction
{
	NSString *envelope = @"<?xml version=\"1.0\" encoding=\"utf-8\"?>" 
	"<soap12:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap12=\"http://www.w3.org/2003/05/soap-envelope\">"
	"<soap12:Body>"
	"<%@ xmlns=\"http://tempuri.org/\" />"
	"</soap12:Body>"
	"</soap12:Envelope>";
	
	return [NSString stringWithFormat:envelope, soapAction];
}

+(NSString*)messageWithAction:(NSString*)soapAction ParamsWithString:(NSString*)paramString
{
	NSString *envelope = @"<?xml version=\"1.0\" encoding=\"utf-8\"?>" 
	"<soap12:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap12=\"http://www.w3.org/2003/05/soap-envelope\">"
	"<soap12:Body>"
	"<%@ xmlns=\"http://tempuri.org/\">"
		"%@"
	"</%@>"
	"</soap12:Body>"
	"</soap12:Envelope>";
	
	return [NSString stringWithFormat:envelope, soapAction, paramString, soapAction];
}

+(NSString*)messageWithAction:(NSString*)soapAction ParamsWithDictionary:(NSDictionary*)paramDict
{	
	NSString* builder = @"";
	if(paramDict != nil)
	{
		for (id key in paramDict)
		{
			builder = [builder stringByAppendingFormat:@"<%@>%@</%@>", key, [paramDict objectForKey:key], key];
		}
	}
	return [EZSoapMessageBuilder messageWithAction:soapAction ParamsWithString:builder];
}

@end
