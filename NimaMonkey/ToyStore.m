//
//  ToyStore.m
//  NimaMonkey
//
//  Created by Ricky on 2/15/13.
//  Copyright 2013 meetgame. All rights reserved.
//

#import "ToyStore.h"
#import "GameSounds.h"
#import "SceneManager.h"
#import "GameData.h"
#import "SimpleAudioEngine.h"
#import "Constants.h"


@implementation ToyStore{
    
    double curTime;
    double nextTime;
    
    //设备类型（是否Iphone5)
    int deviceType;
    
    CCMenuItem *buyItem1;
    CCMenuItem *buyItem2;
    
    CCMenu *buyItem1Menu;
    CCMenu *buyItem2Menu;
    
}

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	ToyStore *layer = [ToyStore node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}


//获取设备类型
-(void)getDeviceType{
    
    if([GameData sharedData].isDeviceIphone5 == NO){
        deviceType = kDeviceTypeNotIphone5;
    }else{
        deviceType = kDeviceTypeIphone5OrNewTouch;
    }
}

//返回游戏开始界面
-(void)backToStart{
    
    [[SimpleAudioEngine sharedEngine]playEffect:@"button2.mp3"];
//    [SceneManager goStartGame];
    
}
//添加返回按钮
-(void)addBackItem{
    CGSize screenSize =[CCDirector sharedDirector].winSize;
    
    CCMenuItemImage* backButton = [CCMenuItemImage itemWithNormalImage:@"button_back.png" selectedImage:nil target:self selector:@selector(backToStart)];
    
    CCMenu *menuButton = [CCMenu menuWithItems:backButton,  nil];
    menuButton.position = ccp(screenSize.width*0.85,screenSize.height*0.85);
    [self addChild:menuButton z:1];
    
}

//添加背景图片
-(void)addBackground{
    
    
    CGSize  size = [CCDirector sharedDirector].winSize;
    
    if(deviceType == kDeviceTypeNotIphone5){
        CCSprite *bg = [CCSprite spriteWithFile:@"bg_common.png"];
        bg.position = ccp(size.width/2,size.height/2);
        [self addChild:bg z:-1];
    }else if(deviceType == kDeviceTypeIphone5OrNewTouch){
        CCSprite *bg = [CCSprite spriteWithFile:@"bg_common-iphone5.png"];
        bg.position = ccp(size.width/2,size.height/2);
        [self addChild:bg z:-1];
    }
    
}



//添加背景音乐
-(void)playBackgroundMusic{
    
    GameData *data = [GameData sharedData];
    if ( data.backgroundMusicMuted == NO ) {
        
        if([SimpleAudioEngine sharedEngine].isBackgroundMusicPlaying == NO)
        {
            
            [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"bg_cartoon.mp3" loop:YES];
        }
        
    }
    
    
}

#pragma mark add items

-(void)addItem1Sprite
{
    CGSize size = [CCDirector sharedDirector].winSize;
    
    CCSprite *item1Sprite = [CCSprite spriteWithFile:@"item_all.png"];
    item1Sprite.position = ccp(size.width*0.413,size.height*0.65);
    [self addChild:item1Sprite z:1];
}

//all toys
-(void)addItem1Menu{
    
    CGSize size = [CCDirector sharedDirector].winSize;
    
    if([GameData sharedData].isAllExtraScenesUnlocked == NO){
        
    buyItem1 = [CCMenuItemImage itemWithNormalImage:@"button_unlock.png" selectedImage:nil disabledImage:nil target:self selector:@selector(buyItem1)];
        
        if(deviceType == kDeviceTypeIphone5OrNewTouch){
             buyItem1.position = ccp(size.width*0.57,size.height*0.6);
        }else{
                buyItem1.position = ccp(size.width*0.61,size.height*0.6);
        }

    
    buyItem1Menu = [CCMenu menuWithItems:buyItem1, nil];
    buyItem1Menu.position = ccp(0,0);
    [self addChild:buyItem1Menu z:2];
        
    }else if([GameData sharedData].isAllExtraScenesUnlocked == YES){
        
        
        buyItem1 = [CCMenuItemImage itemWithNormalImage:@"button_unlocked.png" selectedImage:nil];
        if(deviceType == kDeviceTypeIphone5OrNewTouch){
            buyItem1.position = ccp(size.width*0.57,size.height*0.6);
        }else{
            buyItem1.position = ccp(size.width*0.61,size.height*0.6);
        }
        
        buyItem1Menu = [CCMenu menuWithItems:buyItem1, nil];
        buyItem1Menu.position = ccp(0,0);
        [self addChild:buyItem1Menu z:2];
    }
    

}



//toy drum

-(void)addItem2Sprite{
    
    CGSize size = [CCDirector sharedDirector].winSize;
    
    CCSprite *item3Sprite = [CCSprite spriteWithFile:@"item_toydrum.png"];
    item3Sprite.position = ccp(size.width*0.4,size.height*0.3);
    [self addChild:item3Sprite z:1];

}

-(void)addItem2Menu{
    
    CGSize size = [CCDirector sharedDirector].winSize;

    
    if([GameData sharedData].isExtraSceneToyDrumUnlocked == NO){
        
        buyItem2 = [CCMenuItemImage itemWithNormalImage:@"button_unlock.png" selectedImage:nil disabledImage:nil target:self selector:@selector(buyItem2)];
      
        
        if(deviceType == kDeviceTypeIphone5OrNewTouch){
            buyItem2.position = ccp(size.width*0.57,size.height*0.25);
        }else{
            buyItem2.position = ccp(size.width*0.61,size.height*0.25);
        }
        
        buyItem2Menu = [CCMenu menuWithItems:buyItem2, nil];
        buyItem2Menu.position = ccp(0,0);
        [self addChild:buyItem2Menu z:2];
        
    }else if([GameData sharedData].isExtraSceneToyDrumUnlocked == YES){
        
        
        buyItem2 = [CCMenuItemImage itemWithNormalImage:@"button_unlocked.png" selectedImage:nil];
        
        if(deviceType == kDeviceTypeIphone5OrNewTouch){
            buyItem2.position = ccp(size.width*0.57,size.height*0.25);
        }else{
            buyItem2.position = ccp(size.width*0.61,size.height*0.25);
        }
        
        buyItem2Menu = [CCMenu menuWithItems:buyItem2, nil];
        buyItem2Menu.position = ccp(0,0);
        [self addChild:buyItem2Menu z:2];
    }

}


//restore button

-(void)addRestoreButton{
    
    CGSize size = [CCDirector sharedDirector].winSize;
    //restore
    
    CCMenuItem *restoreButtonItem =[CCMenuItemImage itemWithNormalImage:@"button_restore.png" selectedImage:nil target:self selector:@selector(restoreButtonTapped:)];
    restoreButtonItem.position = ccp(size.width*0.16,size.height*0.9);
    
    CCMenu *menu = [CCMenu menuWithItems:restoreButtonItem, nil];
    menu.position = ccp(0,0);
    [self addChild:menu z:2];
    
}

-(void)restoreButtonTapped:(id)sender{
    
 [[SKPaymentQueue defaultQueue]restoreCompletedTransactions];
    
    [self updateMenu];
}



#pragma mark IAP

-(void)buyItem1{
    
    //buy item1
    NSLog(@"buying item1");
    
    [self purchase:IAPAllProduct];
    
}
-(void)buyItem2{
    
    //buy item2
    NSLog(@"buying item2");
    
    [self purchase:IAPToyDrum];
    
}

#pragma mark 处理IAP的相关方法

#pragma mark SKPaymentTransactionObserver 协议

-(void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions{
    
    for (SKPaymentTransaction *transaction in transactions){
        
        switch (transaction.transactionState) {
            case SKPaymentTransactionStatePurchased:
                [self completeTransaction:transaction];
                CCLOG(@"交易完成");
                
                
//                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Congratulations!" message:@"Success！You've purchased this item!" delegate:self cancelButtonTitle:NSLocalizedString(@"Close",nil) otherButtonTitles:nil, nil];
//                [alert show];
//                [alert release];
                break;
            case SKPaymentTransactionStateFailed:
                [self failedTransaction:transaction];
//                UIAlertView *alert2 = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"Failure！Please retry later!" delegate:self cancelButtonTitle:NSLocalizedString(@"Close",nil) otherButtonTitles:nil, nil];
//                [alert2 show];
//                [alert2 release];
                break;
            case SKPaymentTransactionStateRestored:
                [self restoreTransaction:transaction];
//                UIAlertView *alert3 = [[UIAlertView alloc]initWithTitle:@"Notice" message:@"You've purchased this item before!" delegate:self cancelButtonTitle:NSLocalizedString(@"Close",nil) otherButtonTitles:nil, nil];
//                [alert3 show];
//                [alert3 release];
                break;
            case SKPaymentTransactionStatePurchasing:
                CCLOG(@"product added to the list");
                break;
            default:
                break;
        }
    }
    
    
}

//删除交易

-(void)paymentQueue:(SKPaymentQueue *)queue removedTransactions:(NSArray *)transactions{
    
    CCLOG(@"删除已完成交易");
}


//恢复已完成交易失败

-(void)paymentQueue:(SKPaymentQueue *)queue restoreCompletedTransactionsFailedWithError:(NSError *)error{
    
    CCLOG(@"恢复已完成交易失败");
}

//恢复已完成交易成功

-(void)paymentQueueRestoreCompletedTransactionsFinished:(SKPaymentQueue *)queue{
    
    CCLOG(@"恢复已完成交易成功");
    
}

#pragma mark SKProductsRequestDelegate 方法

//收到商品请求响应

-(void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response{
    
    NSArray *myProduct = response.products;
    
    for(SKProduct *product in myProduct){
        
        NSLog(@"product info");
        NSLog(@"SKProduct 描述信息%@", [product description]);
        NSLog(@"产品标题 %@" , product.localizedTitle);
        NSLog(@"产品描述信息: %@" , product.localizedDescription);
        NSLog(@"价格: %@" , product.price);
        NSLog(@"Product id: %@" , product.productIdentifier);

        
    }
    

    
    SKPayment *payment = nil;
    switch (purchaseType) {
        case IAPAllProduct:
            payment = [SKPayment paymentWithProductIdentifier:kIAPItemAllProducts];

            
            break;
        case IAPToyDrum:
            payment = [SKPayment paymentWithProductIdentifier:kIAPItemToyDrum];
            break;
        default:
            break;
    }
    
    [[SKPaymentQueue defaultQueue]addPayment:payment];
    [request autorelease];
}

#pragma mark SKRequestDelegate 方法

-(void)request:(SKRequest *)request didFailWithError:(NSError *)error{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Notice" message:[error localizedDescription] delegate:self cancelButtonTitle:NSLocalizedString(@"Close", nil) otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
    
}

-(void)requestDidFinish:(SKRequest *)request{
    
    CCLOG(@"---反馈信息结束---");
}

#pragma mark 和IAP购买相关的自定义方法

//请求升级商品数据

-(void)requestProUpgradeProductData{
    
    CCLOG(@"请求升级数据");
    
    NSSet *productIdentifiers = [NSSet setWithObject:@"com.productid"];
    SKProductsRequest *productsRequest = [[SKProductsRequest alloc]initWithProductIdentifiers:productIdentifiers];
    productsRequest.delegate = self;
    [productsRequest start];
    
    
}

//请求商品数据

-(void)requestProductData{
    
    
    NSArray *product = nil;
    switch (purchaseType) {
        case IAPAllProduct:
            product = [[NSArray alloc]initWithObjects:kIAPItemAllProducts, nil];
            break;
        case IAPToyDrum:
            product = [[NSArray alloc]initWithObjects:kIAPItemToyDrum, nil];
            break;
        
        default:
            break;
    }
    
    NSSet *set = [NSSet setWithArray:product];
    SKProductsRequest *request = [[SKProductsRequest alloc]initWithProductIdentifiers:set];
    request.delegate = self;
    [request start];
    [product release];
}



//购买某种商品

-(void)purchase:(int)type{
    
    purchaseType = type;
    
    if([SKPaymentQueue canMakePayments]){
        [self requestProductData];
        CCLOG(@"允许应用内购买");
    }else {
        CCLOG(@"不允许应用内购买");
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"You can't buy this item now" delegate:self cancelButtonTitle:NSLocalizedString(@"Close", nil) otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
        
    }
}

//购买交易

-(void)purchasedTransaction:(SKPaymentTransaction *)transaction{
    
    CCLOG(@"购买的交易");
    NSArray *transactions = [[NSArray alloc]initWithObjects:transaction, nil];
    [self paymentQueue:[SKPaymentQueue defaultQueue] updatedTransactions:transactions];
    [transactions release];
    
    
}

//交易完成

-(void)completeTransaction:(SKPaymentTransaction *)transaction{
    
    CCLOG(@"交易完成");
    NSString *product = transaction.payment.productIdentifier;
    if([product length] >0){
        
        NSArray *tt = [product componentsSeparatedByString:@"."];
        NSString *productId = [tt lastObject];
        if([productId length] >0){
            
            [self recordTransaction:transaction];
            
            [self provideContent:productId];
        }
    }
    
    //将交易从购买队列中删除
    [[SKPaymentQueue defaultQueue]finishTransaction:transaction];
    
}

//交易失败

-(void)failedTransaction:(SKPaymentTransaction *)transaction{
    
    if(transaction.error.code != SKErrorPaymentCancelled){
        
    }
    
    [[SKPaymentQueue defaultQueue]finishTransaction:transaction];
    
}

//恢复交易

-(void)restoreTransaction:(SKPaymentTransaction *)transaction{
    
    CCLOG(@" 交易恢复处理");
    
    [self recordTransaction:transaction.originalTransaction];
    [self provideContent:transaction.originalTransaction.payment.productIdentifier];
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
    
    
}

//向玩家提供商品

-(void)provideContent:(NSString *)product{
    
    CCLOG(@"处理下载内容");
    
    //根据所购买商品的不同提供不同数量的天龙币
    
    switch (purchaseType) {
        case IAPAllProduct:
            [GameData sharedData].isAllExtraScenesUnlocked = YES;
            
             [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"isAllExtraScenesUnlocked"];
            
            
            break;
        case IAPToyDrum:
            [GameData sharedData].isExtraSceneToyDrumUnlocked  = YES;
            
             [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"isExtraSceneToyDrumUnlocked"];
            break;

            
        default:
            break;
    }
    
    [self updateMenu];
    
}

//recreate buttonmenu

-(void)updateMenu{
 
    if(buyItem1Menu !=nil){
        [self removeChild:buyItem1Menu cleanup:YES];
     
    }
    
    if(buyItem2Menu != nil){
        
        [self removeChild:buyItem2Menu cleanup:YES];
    }
    [self addItem1Menu];
    [self addItem2Menu];
    
}

//记录交易


-(void)recordTransaction:(SKPaymentTransaction *)transaction{
    
    CCLOG(@"记录交易");
}

#pragma mark NSURL连接代理

//确认接收数据

-(void)connection:(NSURLConnection*)connection didReceiveData:(NSData *)data{
    
    NSLog(@"%@",[[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]autorelease]);
    
}


//连接完成

-(void)connectionDidFinishLoading:(NSURLConnection*)connection{
    
}

//连接收到响应

-(void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse *)response{
    switch ([(NSHTTPURLResponse *)response statusCode]) {
            
            
        case 200:
        case 206:
            break;
        case 304:
            break;
        case 400:
            break;
        case 404:
            break;
        case 416:
            break;
        case 403:
            break;
        case 401:
        case 500:
            break;
            
        default:
            break;
    }
    
}

//连接失败

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"test");
}



#pragma mark restore


//场景初始化


-(id)init{
    if((self = [super init])){
        
        [self getDeviceType];
        
        [self addBackground];
        [self addBackItem];

        [self playBackgroundMusic];
        
        [self addItem1Sprite];
        [self addItem2Sprite];
        
        [self addItem1Menu];
        [self addItem2Menu];
        
//        [self addRestoreButton];
        
        //添加IAP监听
        
        [[SKPaymentQueue defaultQueue]addTransactionObserver:self];

        if([GameData sharedData].isExtraSceneToyDrumUnlocked == YES){
            CCLOG(@"乐器已被解锁");

        }else{
            CCLOG(@"乐器还没有被解锁!!!");
        }
        
    
        
    }
    return self;
    
}



@end
