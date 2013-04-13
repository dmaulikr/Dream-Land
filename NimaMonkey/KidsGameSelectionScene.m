//
//  KidsGameSelectionScene.m
//  NimaMonkey
//
//  Created by Ricky on 3/5/13.
//  Copyright 2013 meetgame. All rights reserved.
//

#import "KidsGameSelectionScene.h"

#import "SimpleAudioEngine.h"
#import "SceneManager.h"
#import "GameSounds.h"
#import "GameData.h"
#import "MobClick.h"
#import "Constants.h"


@implementation KidsGameSelectionScene{
    
    
//    //八大智能
//    
//    CCMenuItem *musicIntelligenceMenuItem;
//    CCMenuItem *sportsIntelligenceMenuItem;
//    CCMenuItem *spaceIntelligenceMenuItem;
//    CCMenuItem *languageIntelligenceMenuItem;
//    CCMenuItem *mathIntelligenceMenuItem;
//    CCMenuItem *intraIntelligenceMenuItem;
//    CCMenuItem *socialIntelligenceMenuItem;
//    CCMenuItem *naturalIntelligenceMenuItem;
//    
//    //排行榜
//    CCMenuItem *billboardMenuItem;
//    
//    //主城
//    CCMenuItem *mainBulidingMenuItem;
    
}

#pragma mark 类方法

+(id)scene{
    
    CCScene *scene =[CCScene node];
    KidsGameSelectionScene *layer = [KidsGameSelectionScene node];
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
    
    CCMenuItemImage* backButton = [CCMenuItemImage itemWithNormalImage:@"button_parent_back-ipad.png" selectedImage:nil target:self selector:@selector(backToStart)];
    
    backButton.position = ccp(screenSize.width*0.1,screenSize.height*0.15);
    
    CCMenu *menuButton = [CCMenu menuWithItems:backButton,  nil];
    menuButton.position = ccp(0,0);
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
    
    [SceneManager goMILanguageIntelligenceTrainingEntryScene];
}



#pragma mark 添加其它视觉元素

//添加游戏标题

-(void)addSceneTitle{
    
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    
    
    CCLabelTTF *currentSceneTitle = [CCLabelTTF labelWithString:@"宝宝首界面" fontName:@"ChalkboardSE-Bold" fontSize:40];
    currentSceneTitle.position = ccp(screenSize.width/2,screenSize.height*0.9);
    currentSceneTitle.color = ccc3(16,174,231);
    [self addChild:currentSceneTitle z:0];
    
    
}

//添加背景图片
-(void)addBackground{
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    
    CCSprite *bg = [CCSprite spriteWithFile:@"bg_dreamland-ipad.png"];
    
    bg.position = ccp(screenSize.width/2,screenSize.height*0.5);
    
    [self addChild:bg z:-1];
    
}

#pragma mark 导航菜单

//MI多元智能训练
-(void)addMITrainingMenu{
    
    CGSize screenSize =[CCDirector sharedDirector].winSize;
    
    //创建菜单项
    
    //音乐智能训练
    CCMenuItem *MIMusicItem = [CCMenuItemImage itemWithNormalImage:@"land1-ipad.png" selectedImage:nil target:self selector:@selector(enterMIMusicTraining)];
    MIMusicItem.position =ccp(screenSize.width*860/1024,screenSize.height*(768-260)/768);
    MIMusicItem.anchorPoint = ccp(0,0);
    
    //运动觉智能训练
    CCMenuItem *MISportsItem = [CCMenuItemImage itemWithNormalImage:@"land2-ipad.png" selectedImage:nil target:self selector:@selector(enterMISportsTraining)];
    MISportsItem.position =ccp(0,screenSize.height*(768-420)/768);
    MISportsItem.anchorPoint = ccp(0,0);
    
    //逻辑智能训练
    CCMenuItem *MILogicItem = [CCMenuItemImage itemWithNormalImage:@"land3-ipad.png" selectedImage:nil target:self selector:@selector(enterMILogicTraining)];
    MILogicItem.position =ccp(screenSize.width*202/1024,screenSize.height*(768-610)/768);
    MILogicItem.anchorPoint = ccp(0,0);
    
    //自然观察智能训练
    CCMenuItem *MINaturalItem = [CCMenuItemImage itemWithNormalImage:@"land4-ipad.png" selectedImage:nil target:self selector:@selector(enterMINaturalTraining)];
    MINaturalItem.position =ccp(screenSize.width*600/1024,screenSize.height*(768-170)/768);
    MINaturalItem.anchorPoint = ccp(0,0);
    
   //社交智能训练
    
    CCMenuItem *MISocialItem = [CCMenuItemImage itemWithNormalImage:@"land5-ipad.png" selectedImage:nil target:self selector:@selector(enterMISocialTraining)];
    MISocialItem.position =ccp(screenSize.width*520/1024,screenSize.height*(768-710)/768);
    MISocialItem.anchorPoint = ccp(0,0);
    
    //空间智能训练
    CCMenuItem *MISpaceItem = [CCMenuItemImage itemWithNormalImage:@"land6-ipad.png" selectedImage:nil target:self selector:@selector(enterMISpaceTraining)];
    MISpaceItem.position =ccp(0,screenSize.height*(768-170)/768);
    MISpaceItem.anchorPoint = ccp(0,0);
    
    //自我认知智能训练
    CCMenuItem *MICognitiveItem = [CCMenuItemImage itemWithNormalImage:@"land7-ipad.png" selectedImage:nil target:self selector:@selector(enterMICognitiveTraining)];
    MICognitiveItem.position =ccp(screenSize.width*640/1024,screenSize.height*(768-430)/768);
    MICognitiveItem.anchorPoint = ccp(0,0);
    
    //语言智能训练
    CCMenuItem *MILanguageItem = [CCMenuItemImage itemWithNormalImage:@"land8-ipad.png" selectedImage:nil target:self selector:@selector(enterMILanguageTraining)];
    MILanguageItem.position =ccp(screenSize.width*300/1024,screenSize.height*(768-320)/768);
    MILanguageItem.anchorPoint = ccp(0,0);
    
    
    //创建菜单
    
    CCMenu *menu =[CCMenu menuWithItems:MIMusicItem,MICognitiveItem,MISocialItem,MISpaceItem,MISportsItem,MILanguageItem,MILogicItem,MINaturalItem, nil];
    menu.position = CGPointZero;
    [self addChild:menu z:2];
    
    
}

-(void)enterMIMusicTraining{
    
    [SceneManager goMIMusicIntelligenceTrainingEntryScene];
}

-(void)enterMISportsTraining{
    
    [SceneManager goMISportsIntelligenceTrainingEntryScene];
}
-(void)enterMILogicTraining{
    
    [SceneManager goMILogicIntelligenceTrainingEntryScene];
}

-(void)enterMINaturalTraining{
    
    [SceneManager goMINaturalObservationIntelligenceTrainingEntryScene];
}

-(void)enterMISocialTraining{
    [SceneManager goMISocialIntelligenceTrainingEntryScene];
}

-(void)enterMISpaceTraining{
    
    [SceneManager goMISpaceIntelligenceTrainingEntryScene];
    
}

-(void)enterMICognitiveTraining{
    
    [SceneManager goMISelfCognitiveIntelligenceTrainingEntryScene];
}

-(void)enterMILanguageTraining{
    
    [SceneManager goMILanguageIntelligenceTrainingEntryScene];
}

#pragma mark 其它子系统入口菜单
-(void)addOtherKidsPortMenu{
    
    CGSize screenSize =[CCDirector sharedDirector].winSize;
    
    //创建菜单项
    
    //宝宝好友系统
    CCMenuItem *kidsSocialItem = [CCMenuItemImage itemWithNormalImage:@"button_continue-ipad.png" selectedImage:nil target:self selector:@selector(enterMICognitiveTraining)];
    kidsSocialItem.position =ccp(screenSize.width*0.8,screenSize.height*0.2);
    
    //虚拟宠物系统
    CCMenuItem *virtualPetItem = [CCMenuItemImage itemWithNormalImage:@"button_continue-ipad.png" selectedImage:nil target:self selector:@selector(enterMILanguageTraining)];
    virtualPetItem.position =ccp(screenSize.width*0.8,screenSize.height*0.2);
    
    //游戏商城
    CCMenuItem *dreamStoreItem = [CCMenuItemImage itemWithNormalImage:@"button_continue-ipad.png" selectedImage:nil target:self selector:@selector(enterMILanguageTraining)];
    dreamStoreItem.position =ccp(screenSize.width*0.8,screenSize.height*0.2);
    
    //创建菜单
    
    CCMenu *menu =[CCMenu menuWithItems:virtualPetItem,dreamStoreItem, nil];
    menu.position = CGPointZero;
    [self addChild:menu z:2];
    
    
}

//好友系统入口
-(void)enterKidsSocialPort{
    
    [SceneManager goKidsSocialScene];
}

//商城入口

-(void)enterDreamStore{
    
    [SceneManager goDreamStoreScene];
    
}

//宠物界面入口

-(void)enterPetPort{
    
    [SceneManager goVirtualPetScene];
    
}

#pragma mark 播放背景音乐

//添加背景音乐
-(void)playBackgroundMusic{
    
    
    GameData *data = [GameData sharedData];
    if ( data.backgroundMusicMuted == NO ) {
        
        if([SimpleAudioEngine sharedEngine].isBackgroundMusicPlaying == NO)
        {
            [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"sweet.mp3" loop:YES];
            
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
        
        [self addMITrainingMenu];
        
//        [self addEnterNewSceneItem];
        
        //播放背景音乐
        [self playBackgroundMusic];
        
        
    }
    return self;
}



@end
