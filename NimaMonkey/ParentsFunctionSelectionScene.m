//
//  ParentsFunctionSelectionScene.m
//  NimaMonkey
//
//  Created by Ricky on 3/5/13.
//  Copyright 2013 meetgame. All rights reserved.
//

#import "ParentsFunctionSelectionScene.h"

#import "SimpleAudioEngine.h"
#import "SceneManager.h"
#import "GameSounds.h"
#import "GameData.h"
#import "MobClick.h"
#import "Constants.h"


@implementation ParentsFunctionSelectionScene

#pragma mark 类方法

+(id)scene{
    
    CCScene *scene =[CCScene node];
    ParentsFunctionSelectionScene *layer = [ParentsFunctionSelectionScene node];
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
    
    [SceneManager goParentsFunctionBoardScene];
}



#pragma mark 添加其它视觉元素

//添加游戏标题

-(void)addSceneTitle{
    
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    
    
    CCLabelTTF *currentSceneTitle = [CCLabelTTF labelWithString:@"父母首界面" fontName:@"ChalkboardSE-Bold" fontSize:40];
    currentSceneTitle.position = ccp(screenSize.width/2,screenSize.height*0.8);
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


//添加导航菜单

-(void)addEntryMenu{
    
    CGSize screenSize =[CCDirector sharedDirector].winSize;
    
    //创建菜单项
    
    CCMenuItem *scoreItem = [CCMenuItemImage itemWithNormalImage:@"button_score-ipad.png" selectedImage:nil target:self selector:@selector(enterScoreAnalysis)];

    
    
    CCMenuItem *boardItem = [CCMenuItemImage itemWithNormalImage:@"button_board-ipad.png" selectedImage:nil target:self selector:@selector(enterBillBoard)];

    
    CCMenuItem *kidsInfoItem = [CCMenuItemImage itemWithNormalImage:@"button_kidsinfo-ipad.png" selectedImage:nil target:self selector:@selector(setKidsInfo)];
    
   
    
    CCMenuItem *courseInfoItem = [CCMenuItemImage itemWithNormalImage:@"button_courseinfo-ipad.png" selectedImage:nil target:self selector:@selector(setCourseInfo)];
    
    scoreItem.position =ccp(screenSize.width*0.2,screenSize.height*0.5);
    boardItem.position =ccp(screenSize.width*0.4,screenSize.height*0.5);
     kidsInfoItem.position = ccp(screenSize.width*0.6,screenSize.height*0.5);
    courseInfoItem.position = ccp(screenSize.width*0.8,screenSize.height*0.5);
    
    
    //创建菜单
    
    CCMenu *menu =[CCMenu menuWithItems:scoreItem, boardItem,kidsInfoItem,courseInfoItem, nil];
    menu.position = CGPointZero;
    [self addChild:menu z:2];
    
    
}

-(void)enterScoreAnalysis{
    
    [SceneManager goParentsFunctionScoreAnalysisScene];
    
}


-(void)enterBillBoard{
    
    [SceneManager goParentsFunctionBoardScene];
    
}
-(void)setKidsInfo{
    
    [SceneManager goKidsInfoSettingScene];
}

-(void)setCourseInfo{
    
    [SceneManager goLearningContentSettingScene];
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
        
//       [self addEnterNewSceneItem];
        
        [self addEntryMenu];
        
        //播放背景音乐
        [self playBackgroundMusic];
        
        
    }
    return self;
}



@end
