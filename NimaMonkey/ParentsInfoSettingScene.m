//
//  ParentsInfoSettingScene.m
//  NimaMonkey
//
//  Created by Ricky on 3/5/13.
//  Copyright 2013 meetgame. All rights reserved.
//

#import "ParentsInfoSettingScene.h"

#import "SimpleAudioEngine.h"
#import "SceneManager.h"
#import "GameSounds.h"
#import "GameData.h"
#import "MobClick.h"
#import "Constants.h"


@implementation ParentsInfoSettingScene

#pragma mark 类方法

+(id)scene{
    
    CCScene *scene =[CCScene node];
    ParentsInfoSettingScene *layer = [ParentsInfoSettingScene node];
    [scene addChild:layer];
    return scene;
    
}


#pragma mark 添加菜单项

//back button

//返回游戏开始界面
-(void)backToStart{
    
    [[SimpleAudioEngine sharedEngine]playEffect:@"button2.mp3"];
    [SceneManager goFirstTimeSettingGuidelineScene];
    
}
//添加返回按钮
-(void)addBackItem{
    CGSize screenSize =[CCDirector sharedDirector].winSize;
    
    CCMenuItemImage* backButton = [CCMenuItemImage itemWithNormalImage:@"button_back.png" selectedImage:nil target:self selector:@selector(backToStart)];
    
    CCMenu *menuButton = [CCMenu menuWithItems:backButton,  nil];
    menuButton.position = ccp(screenSize.width*0.85,screenSize.height*0.85);
    [self addChild:menuButton z:1];
    
}

//添加进入下一场景的按钮

-(void)addEnterNewSceneItem{
    
    CGSize screenSize =[CCDirector sharedDirector].winSize;
    
    //创建菜单项
    
    CCMenuItem *moreItem = [CCMenuItemImage itemWithNormalImage:@"button_continue-ipad.png" selectedImage:nil target:self selector:@selector(enterNewScene)];
    moreItem.position =ccp(screenSize.width*0.8,screenSize.height*0.2);
    
    //创建菜单
    
    CCMenu *menu =[CCMenu menuWithItems:moreItem, nil];
    menu.position = CGPointZero;
    [self addChild:menu z:2];
    
}

-(void)enterNewScene{
    
    [SceneManager goUserTypeSelectionScene];
}



#pragma mark 添加其它视觉元素

//添加游戏标题

-(void)addSceneTitle{
    
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    
    
    CCLabelTTF *currentSceneTitle = [CCLabelTTF labelWithString:@"父母信息设置界面" fontName:@"ChalkboardSE-Bold" fontSize:40];
    currentSceneTitle.position = ccp(screenSize.width/2,screenSize.height*0.9);
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


//一休的提示信息
-(void)addTips{
    
    CGSize size = [CCDirector sharedDirector].winSize;
    
    CCLabelTTF *tips = [CCLabelTTF labelWithString:@"这里是需要的向导信息" fontName:@"ChalkboardSE-Bold" fontSize:30];
    tips.position = ccp(size.width*0.3,size.height*0.3);
    
    tips.color = ccc3(16,174,231);
    
    [self addChild:tips z:2];
    
}


//添加一休卡通形象

-(void)addSmartKidSprite{
    
    CGSize size = [CCDirector sharedDirector].winSize;
    
    CCSprite *smartKidSprite = [CCSprite spriteWithFile:@"smartkid-ipad.png"];
    
    smartKidSprite.position = ccp(size.width*0.78,size.height*0.28);
    [self addChild:smartKidSprite z:2];
    
    
    
}

#pragma mark 具体设置内容
//具体设置内容

//设置头像

-(void)addAvatarLabel{
    
    CGSize size = [CCDirector sharedDirector].winSize;
    
    CCLabelTTF *avatarLabel = [CCLabelTTF labelWithString:@"选择您的形象" fontName:@"ChalkboardSE-Bold" fontSize:30];
    avatarLabel.color = ccc3(16,174,231);
    
    avatarLabel.position = ccp(size.width*0.3,size.height*0.7);
    [self addChild:avatarLabel z:1];
}

-(void)avatarSetting{
    
    [self addAvatarLabel];
    
    CGSize size = [CCDirector sharedDirector].winSize;

    CCSprite *avatar = [CCSprite spriteWithFile:@"parentssquare-ipad.png"];
    avatar.position = ccp(size.width*0.5,size.height*0.7);
    avatar.scale = 0.8;
    [self addChild:avatar z:1];
    
    
    CCMenuItem *choosePhotoItem = [CCMenuItemImage itemWithNormalImage:@"button_uploadphoto-ipad.png" selectedImage:nil target:self selector:@selector(choosePhoto)];
    choosePhotoItem.position = ccp(size.width*0.7,size.height*0.7);
    
    CCMenu *menu = [CCMenu menuWithItems:choosePhotoItem, nil];
    menu.position = ccp(0,0);
    [self addChild:menu z:1];

}

-(void)choosePhoto{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"上传照片" message:@"选择您的照片作为形象" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
    
}

//选择身份

-(void)addGenderLabel{
    
    CGSize size = [CCDirector sharedDirector].winSize;
    
    CCLabelTTF *genderLabel = [CCLabelTTF labelWithString:@"选择您和孩子的关系" fontName:@"ChalkboardSE-Bold" fontSize:30];
    genderLabel.color = ccc3(16,174,231);
    
    genderLabel.position = ccp(size.width*0.3,size.height*0.5);
    [self addChild:genderLabel z:1];
    
}

-(void)genderSetting{
    
    [self addGenderLabel];
    
//    CGSize size = [CCDirector sharedDirector].winSize;
    
}

//其它设置

-(void)othersSetting{
    
    
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
        
        [self addBackItem];
        
        [self addTips];
        
        [self addSmartKidSprite];
        
        //信息设置
        
        [self avatarSetting];
        [self genderSetting];
        [self othersSetting];
        
        [self addEnterNewSceneItem];
        
        //播放背景音乐
        [self playBackgroundMusic];
        
        
    }
    return self;
}



@end
