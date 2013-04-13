//
//  UserSignupScene.m
//  NimaMonkey
//
//  Created by Ricky on 3/5/13.
//  Copyright 2013 meetgame. All rights reserved.
//

#import "UserSignupScene.h"

#import "SimpleAudioEngine.h"
#import "SceneManager.h"
#import "GameSounds.h"
#import "GameData.h"
#import "MobClick.h"
#import "Constants.h"


@implementation UserSignupScene{
    
    
    UITextField *userAccountTextField;
    UITextField *userPasswordTextField;
    
    NSString *userAccountInput;
    NSString *userPasswordInput;
}

#pragma mark 类方法

+(id)scene{
    
    CCScene *scene =[CCScene node];
    UserSignupScene *layer = [UserSignupScene node];
    [scene addChild:layer];
    return scene;
    
}


#pragma mark 添加菜单项

//back button

//返回游戏开始界面
-(void)backToStart{
    
    [[SimpleAudioEngine sharedEngine]playEffect:@"button2.mp3"];
    [SceneManager goUserTypeSelectionScene];
    
}
//添加返回按钮
-(void)addBackItem{
    CGSize screenSize =[CCDirector sharedDirector].winSize;
    
    CCMenuItemImage* backButton = [CCMenuItemImage itemWithNormalImage:@"button_back.png" selectedImage:nil target:self selector:@selector(backToStart)];
    
    CCMenu *menuButton = [CCMenu menuWithItems:backButton,  nil];
    menuButton.position = ccp(screenSize.width*0.85,screenSize.height*0.85);
    [self addChild:menuButton z:1];
    
}

//添加菜单
-(void)addEntryMenu{
    
    CGSize screenSize =[CCDirector sharedDirector].winSize;
    
    //创建菜单项
    
    CCMenuItem *registerItem = [CCMenuItemImage itemWithNormalImage:@"button_register-ipad.png" selectedImage:nil target:self selector:@selector(signUp)];
    registerItem.position =ccp(screenSize.width*0.5,screenSize.height*0.45);
    
    //创建菜单项
    
    CCMenuItem *loginItem = [CCMenuItemImage itemWithNormalImage:@"button_login-ipad.png" selectedImage:nil target:self selector:@selector(loginIn)];
    loginItem.position =ccp(screenSize.width*0.3,screenSize.height*0.45);
    
    
    //创建菜单
    
//    CCMenu *menu =[CCMenu menuWithItems:registerItem, loginItem, nil];
      CCMenu *menu =[CCMenu menuWithItems:registerItem, nil];
    menu.position = CGPointZero;
    [self addChild:menu z:2];
    
}

-(void)signUp{
    
    //    UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"注册新账号" message:@"触碰该按钮可以进入新账号注册界面" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    //
    //    [alert show];
    //    [alert release];
    
    [self removeAccountAndPasswordInput];
    
    [SceneManager goFirstTimeSettingGuidelineScene];
}

-(void)loginIn{
    
    [self removeAccountAndPasswordInput];
    
    //判断是否第一次登录
    if([GameData sharedData].notFirstTimePlayThisGame == NO){
        
        [SceneManager goFirstTimeSettingGuidelineScene];
        
    }else {
        
        [SceneManager goUserTypeSelectionScene];
        
    }
    
    
    
}

#pragma mark 输入账号和密码的文本框
//注意，在cocos2d-x中可以使用CCTextField

-(UITextField*)userAccountTextField{
    
    CGSize winsize=[[CCDirector sharedDirector]winSize];
    
    CCLabelTTF *tip1= [CCLabelTTF labelWithString:@"用户名：" fontName:@"ChalkboardSE-Bold" fontSize:30];
    tip1.position = ccp(winsize.width*0.35,winsize.height*0.7);
    tip1.color = ccc3(16,174,231);
    [self addChild:tip1 z:1];
    
    //设置位置(x,y,width,height)
    userAccountTextField=[[UITextField alloc] initWithFrame:CGRectMake(winsize.width*0.45, winsize.height*0.28, 250.0f, 50.0f)];
    [userAccountTextField setFont:[UIFont fontWithName:@"ChalkboardSE-Bold" size:20]];
    userAccountTextField.text=@"请在此输入您的用户名";
    //    userAccountTextField.transform = CGAffineTransformTranslate(CGAffineTransformMakeRotation(3.14159265/2), +80, +80);
    [userAccountTextField addTarget:self action:@selector(userAccountInput:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [userAccountTextField addTarget:self action:@selector(emptyAccountLine:) forControlEvents:UIControlEventEditingDidBegin];
    
    //    userAccountTextField.backgroundColor = [UIColor whiteColor];
    
    userAccountTextField.backgroundColor = [UIColor colorWithRed:0.482 green:0.969 blue:0.828 alpha:1];
    
    userAccountTextField.textColor=[UIColor blackColor];
    return [userAccountTextField autorelease];
    
    
}
-(void)emptyAccountLine:(id)sender{
    
    userAccountTextField.text = @"";
}

-(void)userAccountInput:(id)sender{
    
    userAccountInput = [[NSString alloc]init];
    
    userAccountInput =  userAccountTextField.text;
    
}

-(UITextField*)userPasswordTextField{
    
    CGSize winsize=[[CCDirector sharedDirector]winSize];
    
    
    CCLabelTTF *tip2= [CCLabelTTF labelWithString:@"密码：" fontName:@"ChalkboardSE-Bold" fontSize:30];
    tip2.position = ccp(winsize.width*0.35,winsize.height*0.6);
    tip2.color = ccc3(16,174,231);
    [self addChild:tip2 z:1];
    
    
    //设置位置(x,y,width,height)
    userPasswordTextField=[[UITextField alloc] initWithFrame:CGRectMake(winsize.width*0.45, winsize.height*0.38, 250.0f, 50.0f)];
    [userPasswordTextField setFont:[UIFont fontWithName:@"ChalkboardSE-Bold" size:20]];
    userPasswordTextField.text=@"请在此处输入密码";
    //    userPasswordTextField.transform = CGAffineTransformTranslate(CGAffineTransformMakeRotation(3.14159265/2), +80, +80);
    [userPasswordTextField addTarget:self action:@selector(userPasswordInput:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [userPasswordTextField addTarget:self action:@selector(emptyPasswordLine:) forControlEvents:UIControlEventEditingDidBegin];
    
    userPasswordTextField.backgroundColor = [UIColor colorWithRed:0.482 green:0.969 blue:0.828 alpha:1];
    userPasswordTextField.textColor=[UIColor blackColor];
    
    userPasswordTextField.secureTextEntry = YES;
    
    //    userPasswordTextField.textColor = [UIColor colorWithRed:16 green:174 blue:231 alpha:1];
    
    return [userPasswordTextField autorelease];
    
}
-(void)emptyPasswordLine:(id)sender{
    
    userPasswordTextField.text= @"";
}

-(void)userPasswordInput:(id)sender{
    
    userPasswordInput = [[NSString alloc]init];
    userPasswordInput = userPasswordTextField.text;
    
}



//添加文本输入框

-(void)addAccountAndPasswordInput{
    
    userAccountTextField = [self userAccountTextField];
    userPasswordTextField = [self userPasswordTextField];
    
    [[[CCDirector sharedDirector]view]addSubview:userAccountTextField];
    
    [[[CCDirector sharedDirector]view]addSubview:userPasswordTextField];
    
}

//清除文本输入框

-(void)removeAccountAndPasswordInput{
    
    
    if(userAccountTextField !=nil){
        
        [userAccountTextField removeFromSuperview];
//        [userAccountTextField release];
        
    }
    
    if(userPasswordTextField !=nil){
        
        [userPasswordTextField removeFromSuperview];
//        [userPasswordTextField release];
        
        
    }
    
    
    
}




//添加第三方登录

-(void)addThirdPartyLoginTip{
    
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    
    
    CCLabelTTF *tips = [CCLabelTTF labelWithString:@"使用第三方账号登录" fontName:@"ChalkboardSE-Bold" fontSize:35];
    tips.position = ccp(screenSize.width*0.27,screenSize.height*0.15);
    tips.color = ccc3(16,174,231);
    [self addChild:tips z:0];
    
}

-(void)addLoginWithSinaMicroblog{
    
    CGSize screenSize =[CCDirector sharedDirector].winSize;
    
    //创建菜单项
    
    CCMenuItem *sinaMicroblogItem = [CCMenuItemImage itemWithNormalImage:@"weibo-ipad.png" selectedImage:nil target:self selector:@selector(loginWithSinaMicroblog)];
    sinaMicroblogItem.position =ccp(screenSize.width*0.5,screenSize.height*0.2);
    
    
    
    //创建菜单
    
    CCMenu *menu =[CCMenu menuWithItems:sinaMicroblogItem, nil];
    menu.position = CGPointZero;
    [self addChild:menu z:2];
    
    
    
}

-(void)loginWithSinaMicroblog{
    
    [self removeAccountAndPasswordInput];
    
    //判断是否第一次登录
    if([GameData sharedData].notFirstTimePlayThisGame == NO){
        
        [SceneManager goFirstTimeSettingGuidelineScene];
        
    }else {
        
        [SceneManager goUserTypeSelectionScene];
        
    }
    
    
}


-(void)addLoginWithQQAccount{
    
    CGSize screenSize =[CCDirector sharedDirector].winSize;
    
    //创建菜单项
    
    CCMenuItem *QQAccountItem = [CCMenuItemImage itemWithNormalImage:@"qq-ipad.png" selectedImage:nil target:self selector:@selector(loginWithQQAcccount)];
    QQAccountItem.position =ccp(screenSize.width*0.7,screenSize.height*0.2);
    
    
    
    //创建菜单
    
    CCMenu *menu =[CCMenu menuWithItems:QQAccountItem, nil];
    menu.position = CGPointZero;
    [self addChild:menu z:2];
}

-(void)loginWithQQAcccount{
    
    [self removeAccountAndPasswordInput];
    
    //判断是否第一次登录
    if([GameData sharedData].notFirstTimePlayThisGame == NO){
        
        [SceneManager goFirstTimeSettingGuidelineScene];
        
    }else {
        
        [SceneManager goUserTypeSelectionScene];
        
    }
    
}

#pragma mark 添加其它视觉元素

//添加游戏标题

-(void)addSceneTitle{
    
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    
    
    CCLabelTTF *currentSceneTitle = [CCLabelTTF labelWithString:@"注册新账号" fontName:@"ChalkboardSE-Bold" fontSize:40];
    currentSceneTitle.position = ccp(screenSize.width/2,screenSize.height*0.85);
    currentSceneTitle.color = ccc3(16,174,231);
    [self addChild:currentSceneTitle z:0];
    
    
}

//添加背景图片
-(void)addBackground{
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    
    CCSprite *bg = [CCSprite spriteWithFile:@"bg_startscene-ipad.png"];
    
    bg.position = ccp(screenSize.width/2,screenSize.height*0.5);
    
    [self addChild:bg z:-1];
    
}


#pragma mark 播放背景音乐

//添加背景音乐
-(void)playBackgroundMusic{
    
    
    GameData *data = [GameData sharedData];
    if ( data.backgroundMusicMuted == NO ) {
        
        if([SimpleAudioEngine sharedEngine].isBackgroundMusicPlaying == NO)
        {
            [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"start.mp3" loop:YES];
            
        }
    }
    
    
}





#pragma mark-场景初始化


-(id)init{
    
    if((self  =[super init])){
        
        
        
        
        //设置各视觉元素在屏幕中的位置
        
        [self addBackground];
        
        [self addSceneTitle];
        
        //        [self addBackItem];
        
        //        [self addEnterNewSceneItem];
        
        //登录框
        [self addAccountAndPasswordInput];
        
        [self addEntryMenu];
        
        
        //第三方登录
        
        [self addThirdPartyLoginTip];
        [self addLoginWithSinaMicroblog];
        [self addLoginWithQQAccount];
        
        //播放背景音乐
        [self playBackgroundMusic];
        
        
    }
    return self;
}


@end
