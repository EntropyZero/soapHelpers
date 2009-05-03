//
//  EZXmlDataParser.h
//
//  Created by Mike Brockey on 10/13/08.
//

#import <UIKit/UIKit.h>


@interface EZXmlDataParser : NSObject {
	NSMutableArray *ResultArray;
	NSMutableDictionary *CurrentElement;
	BOOL ShouldCaptureString;
	NSMutableString *CurrentStringValue;
}

@property (nonatomic, retain) NSMutableArray *ResultArray;
@property (nonatomic, retain) NSMutableDictionary *CurrentElement;
@property (nonatomic) BOOL ShouldCaptureString;
@property (nonatomic, retain) NSMutableString *CurrentStringValue;
	
- (NSArray*)parseXMLData:(NSData*)data AtElementName:(NSString*)element WithElementData:(NSArray*)elementData;

@end
