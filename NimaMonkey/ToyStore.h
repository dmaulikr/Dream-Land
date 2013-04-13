//
//  ToyStore.h
//  NimaMonkey
//
//  Created by Ricky on 2/15/13.
//  Copyright 2013 meetgame. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"



#import <StoreKit/StoreKit.h>

enum{
    IAPAllProduct = 10,
    IAPToyDrum,
    
}toysTag;


@interface ToyStore : CCLayer<SKProductsRequestDelegate,SKPaymentTransactionObserver,SKRequestDelegate> {
    
//    NSArray *_products;
    
    int purchaseType;
    
}
+(CCScene *) scene;

//IAP
//SKPaymentTransactionObserver 方法

-(void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions;
-(void)paymentQueue:(SKPaymentQueue *)queue removedTransactions:(NSArray *)transactions;


-(void)paymentQueue:(SKPaymentQueue *)queue restoreCompletedTransactionsFailedWithError:(NSError *)error;
-(void)paymentQueueRestoreCompletedTransactionsFinished:(SKPaymentQueue *)queue;

//SKProductsRequestDelegate 方法

-(void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response;

//SKRequestDelegate 方法

-(void)request:(SKRequest *)request didFailWithError:(NSError *)error;

-(void)requestDidFinish:(SKRequest *)request;


//自定义方法

-(void)requestProUpgradeProductData;
-(void)requestProductData;


-(void)purchase:(int)type;


-(void)purchasedTransaction:(SKPaymentTransaction*)transaction;
-(void)completeTransaction:(SKPaymentTransaction*)transaction;
-(void)failedTransaction:(SKPaymentTransaction*)transaction;

-(void)restoreTransaction:(SKPaymentTransaction*)transaction;
-(void)provideContent:(NSString*)product;
- (void)recordTransaction:(SKPaymentTransaction *)transaction;


@end
