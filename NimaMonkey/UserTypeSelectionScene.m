//
//  GameEntryPortScene.m
//  NimaMonkey
//
//  Created by Ricky on 3/5/13.
//  Copyright 2013 meetgame. All rights reserved.
//

#import "UserTypeSelectionScene.h"

#import "SimpleAudioEngine.h"
#import "SceneManager.h"
#import "GameSounds.h"
#import "GameData.h"
#import "MobClick.h"
#import "Constants.h"


@implementation UserTypeSelectionScene

#pragma mark 类方法

+(id)scene{
    
    CCScene *scene =[CCScene node];
    UserTypeSelectionScene *layer = [UserTypeSelectionScene node];
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
    
    [SceneManager goGameWorldIntro];
}



#pragma mark 添加其它视觉元素

//添加游戏标题

-(void)addSceneTitle{
    
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    
    
    CCLabelTTF *currentSceneTitle = [CCLabelTTF labelWithString:@"用户类型选择导航界面" fontName:@"ChalkboardSE-Bold" fontSize:40];
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


//宝宝入口
-(void)addKidsPortLabel{
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    
    CCLabelTTF *kidsPortLabel = [CCLabelTTF labelWithString:@"宝宝入口" fontName:@"ChalkboardSE-Bold" fontSize:40];
    kidsPortLabel.position = ccp(screenSize.width*0.25,screenSize.height*0.45);
    kidsPortLabel.color = ccc3(16,174,231);
    
    [self addChild:kidsPortLabel z:1];
}

-(void)addKidsPortMenu{
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    
    
    //创建菜单项
    
    CCMenuItem *kidsPortItem = [CCMenuItemImage itemWithNormalImage:@"kids_circle-ipad.png" selectedImage:nil target:self selector:@selector(enterKidsPort)];
    kidsPortItem.position =ccp(screenSize.width*0.25,screenSize.height*0.7);
    
    //创建菜单
    
    CCMenu *menu =[CCMenu menuWithItems:kidsPortItem, nil];
    menu.position = CGPointZero;
    [self addChild:menu z:2];
}

-(void)enterKidsPort{
    
      [[SimpleAudioEngine sharedEngine]stopBackgroundMusic];
    [SceneManager goGameWorldIntro];
}

//家长入口

-(void)addParentsPortLabel{
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    
    CCLabelTTF *kidsPortLabel = [CCLabelTTF labelWithString:@"父母入口" fontName:@"ChalkboardSE-Bold" fontSize:40];
    kidsPortLabel.position = ccp(screenSize.width*0.6,screenSize.height*0.45);
    kidsPortLabel.color = ccc3(16,174,231);
    
    [self addChild:kidsPortLabel z:1];
    
}
-(void)addParentsPortMenu{
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    
    
    //创建菜单项
    
    CCMenuItem *parentsPortItem = [CCMenuItemImage itemWithNormalImage:@"parents_circle-ipad.png" selectedImage:nil target:self selector:@selector(enterParentsPort)];
    parentsPortItem.position =ccp(screenSize.width*0.6,screenSize.height*0.7);
    
    //创建菜单
    
    CCMenu *menu =[CCMenu menuWithItems:parentsPortItem, nil];
    menu.position = CGPointZero;
    [self addChild:menu z:2];
}

-(void)enterParentsPort{
    
    [[SimpleAudioEngine sharedEngine]stopBackgroundMusic];
    
    [SceneManager goParentsFunctionSelectionScene];
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


//更改信息，非第一次登陆
-(void)saveInfo{
    
    [GameData sharedData].notFirstTimePlayThisGame = YES;
}


#pragma mark-场景初始化


-(id)init{
    
    if((self  =[super init])){
        
        
        
        
        //设置各视觉元素在屏幕中的位置
        
        [self addBackground];
        
        [self addSceneTitle];
        
//        [self addBackItem];
        
//        [self addEnterNewSceneItem];
        
        [self addParentsPortLabel];
        [self addParentsPortMenu];
        
        [self addKidsPortLabel];
        [self addKidsPortMenu];
        
        [self saveInfo];
        
        //播放背景音乐
        [self playBackgroundMusic];
        
        
    }
    return self;
}




@end
