//
//  EZSoapMessageBuilder.h
//
//  Created by Mike Brockey on 10/24/08.
//

#import <UIKit/UIKit.h>


@interface EZSoapMessageBuilder : NSObject {

}

+(NSString*)messageWithAction:(NSString*)soapAction;
+(NSString*)messageWithAction:(NSString*)soapAction ParamsWithString:(NSString*)paramString;
+(NSString*)messageWithAction:(NSString*)soapAction ParamsWithDictionary:(NSDictionary*)paramDict;

@end
