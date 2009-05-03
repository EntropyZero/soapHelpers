//
//  EZXmlDataParser.m
//
//  Created by Mike Brockey and me on 10/13/08.
//

#import "EZXmlDataParser.h"

@implementation EZXmlDataParser

@synthesize ResultArray, CurrentElement, ShouldCaptureString, CurrentStringValue;

NSString *_element;
NSArray *_elementData;

- (NSArray*)parseXMLData:(NSData*)data AtElementName:(NSString*)element WithElementData:(NSArray*)elementData
{	
	_element = element;
	_elementData = elementData;
	
	[_element retain];
	[_elementData retain];
	
	NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
	
    // Set self as the delegate of the parser so that it will receive the parser delegate methods callbacks.
    [parser setDelegate:self];
	
    // Depending on the XML document you're parsing, you may want to enable these features of NSXMLParser.
    [parser setShouldProcessNamespaces:NO];
    [parser setShouldReportNamespacePrefixes:NO];
    [parser setShouldResolveExternalEntities:NO];
    
    [parser parse];
    
    [parser release];
	[_element release];
	[_elementData release];
	
	return [NSArray arrayWithArray: self.ResultArray];
}

- (void)parserDidStartDocument:(NSXMLParser *)parser
{
	self.CurrentElement = nil;
	self.ShouldCaptureString = false;
	self.ResultArray = [[[NSMutableArray alloc] init] autorelease];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:_element])
	{
		self.CurrentElement = [[[NSMutableDictionary alloc] init] autorelease];
	}
	if([_elementData containsObject:elementName])
	{
		self.ShouldCaptureString = true;
	}
	return;
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string 
{
	if(self.ShouldCaptureString == false)
	{
		return;
	}
    if (self.CurrentStringValue == nil) 
	{
        self.CurrentStringValue = [[NSMutableString alloc] initWithCapacity:5];
    }
    [self.CurrentStringValue appendString:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName 
{
	if(self.CurrentElement == nil)
	{
		self.CurrentElement = [[[NSMutableDictionary alloc] init] autorelease];
	}

	if(self.ShouldCaptureString == true)
	{
		if(self.CurrentStringValue != nil)
		{
			[self.CurrentElement setObject: self.CurrentStringValue forKey:elementName];  
		}
	}
	
	self.ShouldCaptureString = false;
	self.CurrentStringValue = nil;

	if ([elementName isEqualToString:_element])
	{
		[self.ResultArray addObject:self.CurrentElement];
	}
}


@end
