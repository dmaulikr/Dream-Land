//
//  FirstTimeSettingGuidelineScene.m
//  NimaMonkey
//
//  Created by Ricky on 3/5/13.
//  Copyright 2013 meetgame. All rights reserved.
//

#import "FirstTimeSettingGuidelineScene.h"

#import "SimpleAudioEngine.h"
#import "SceneManager.h"
#import "GameSounds.h"
#import "GameData.h"
#import "MobClick.h"
#import "Constants.h"


@implementation FirstTimeSettingGuidelineScene

#pragma mark 类方法

+(id)scene{
    
    CCScene *scene =[CCScene node];
    FirstTimeSettingGuidelineScene *layer = [FirstTimeSettingGuidelineScene node];
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

//添加进入下一场景的按钮

-(void)addSkipSettingItem{
    
    CGSize screenSize =[CCDirector sharedDirector].winSize;
    
    //创建菜单项
    
    CCMenuItem *moreItem = [CCMenuItemImage itemWithNormalImage:@"button_continue-ipad.png" selectedImage:nil target:self selector:@selector(skipSetting)];
    moreItem.position =ccp(screenSize.width*0.8,screenSize.height*0.2);
    
    //创建菜单
    
    CCMenu *menu =[CCMenu menuWithItems:moreItem, nil];
    menu.position = CGPointZero;
    [self addChild:menu z:2];
    
}

-(void)skipSetting{
    
    [SceneManager goUserTypeSelectionScene];
}



#pragma mark 添加其它视觉元素

//添加游戏标题

-(void)addSceneTitle{
    
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    
    
    CCLabelTTF *currentSceneTitle = [CCLabelTTF labelWithString:@"设置导航界面" fontName:@"ChalkboardSE-Bold" fontSize:40];
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

//添加一休卡通形象

-(void)addSmartKidSprite{
    
    CGSize size = [CCDirector sharedDirector].winSize;
    
    CCSprite *smartKidSprite = [CCSprite spriteWithFile:@"smartkid-ipad.png"];

    smartKidSprite.position = ccp(size.width*0.78,size.height*0.28);
    [self addChild:smartKidSprite z:2];
    
    
    
}


//添加设置选项菜单

-(void)addSettingOptionMenu{
    
    CGSize size = [CCDirector sharedDirector].winSize;
    
    CCMenuItem *parentsInfoItem = [CCMenuItemImage itemWithNormalImage:@"button_parentsinfo-ipad.png" selectedImage:nil target:self selector:@selector(setParentsInfo)];
    CCMenuItem *kidsInfoItem = [CCMenuItemImage itemWithNormalImage:@"button_kidsinfo-ipad.png" selectedImage:nil target:self selector:@selector(setKidsInfo)];
    CCMenuItem *courseInfoItem = [CCMenuItemImage itemWithNormalImage:@"button_courseinfo-ipad.png" selectedImage:nil target:self selector:@selector(setCourseInfo)];
    
    parentsInfoItem.position = ccp(size.width*0.22,size.height*0.6);
    kidsInfoItem.position = ccp(size.width*0.5,size.height*0.6);
    courseInfoItem.position = ccp(size.width*0.78,size.height*0.6);
    
    CCMenu *optionMenu = [CCMenu menuWithItems:parentsInfoItem,kidsInfoItem,courseInfoItem, nil];
    optionMenu.position = ccp(0,0);
    [self addChild:optionMenu z:2];
    

    
}

-(void)setParentsInfo{
    
    [SceneManager goParentsInfoSettingScene];
}

-(void)setKidsInfo{
    
    [SceneManager goKidsInfoSettingScene];
}

-(void)setCourseInfo{
    
    [SceneManager goLearningContentSettingScene];
}

//一休的提示信息
-(void)addTips{
    
     CGSize size = [CCDirector sharedDirector].winSize;
    
    CCLabelTTF *tips = [CCLabelTTF labelWithString:@"这里是需要的向导信息" fontName:@"ChalkboardSE-Bold" fontSize:30];
    tips.position = ccp(size.width*0.3,size.height*0.3);
    
    tips.color = ccc3(16,174,231);
    
    [self addChild:tips z:2];
    
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
        
        [self addSmartKidSprite];
        
        [self addTips];
        
        [self addSettingOptionMenu];
        
//        [self addBackItem];
        
//        [self addSkipSettingItem];
        
        //播放背景音乐
        [self playBackgroundMusic];
        
        
    }
    return self;
}



@end
