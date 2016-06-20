//
//  SquareManager.m
//  SquareRegister
//
//  Created by Jed Tiotuico on 20/06/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "SquareManager.h"
#import "SquareRegisterSDK.h"

@implementation SquareManager

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(createSquarePayment:(NSString *)myAmount
										withCurrency:(NSString *)currency
										withNotes:(NSString *) myNotes)
{
	// Always set the client ID before creating your first API request.
	[SCCAPIRequest setClientID:@"sq0idp-YPihN_0v1U_xQQXdF2UQKQ"];
	
	// Replace with your app's callback URL.
	NSURL *const callbackURL = [NSURL URLWithString:@"my-square-register://payment-complete"];
	
	// Specify the amount of money to charge.
	SCCMoney *const amount = [SCCMoney moneyWithAmountCents:10000 currencyCode:@"USD" error:NULL];
	
	// Specify which forms of tender the merchant can accept
	SCCAPIRequestTenderTypes const supportedTenderTypes = SCCAPIRequestTenderTypeAll;
	
	// Specify whether default fees in Square Register are cleared from this transaction
	// (Default is NO, they are not cleared)
	BOOL const clearsDefaultFees = YES;
	
	// Replace with any string you want returned from Square Register.
	NSString *const userInfoString = @"Useful information";
	
	// Replace with notes to associate with the transaction.
	NSString *const notes = @"Notes";
	
	// Initialize the request.
	NSError *error = nil;
	SCCAPIRequest *const request = [SCCAPIRequest requestWithCallbackURL:callbackURL
																																amount:amount
																												userInfoString:userInfoString
																														merchantID:nil
																																 notes:notes
																									supportedTenderTypes:supportedTenderTypes
																										 clearsDefaultFees:clearsDefaultFees
																			 returnAutomaticallyAfterPayment:NO
																																 error:&error];
	
	// Perform the request.
	BOOL const success = [SCCAPIConnection performRequest:request error:&error];
	
	NSLog(error);
}
@end
