//
//  KidsAvatarSelection.m
//  NimaMonkey
//
//  Created by happybubsy on 3/23/13.
//  Copyright 2013 meetgame. All rights reserved.
//

#import "KidsAvatarSelection.h"

#import "SimpleAudioEngine.h"
#import "SceneManager.h"
#import "GameSounds.h"
#import "GameData.h"
#import "MobClick.h"
#import "Constants.h"


@implementation KidsAvatarSelection{
    
    

    
}


#pragma mark 类方法

+(id)scene{
    
    CCScene *scene =[CCScene node];
    KidsAvatarSelection *layer = [KidsAvatarSelection node];
    [scene addChild:layer];
    return scene;
    
}

#pragma mark 添加菜单项

//back button

//返回游戏开始界面
-(void)backToStart{
    
    [[SimpleAudioEngine sharedEngine]playEffect:@"button2.mp3"];
    [SceneManager goKidsGameSelectionScene];
    
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
    
    [SceneManager goPetsAvatarSelection];
}



#pragma mark 添加其它视觉元素

//添加游戏标题

-(void)addSceneTitle{
    
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    
    
    CCLabelTTF *currentSceneTitle = [CCLabelTTF labelWithString:@"人物角色形象选择" fontName:@"ChalkboardSE-Bold" fontSize:40];
    currentSceneTitle.position = ccp(screenSize.width/2,screenSize.height*0.85);
    currentSceneTitle.color = ccc3(255,255,255);
    [self addChild:currentSceneTitle z:0];
    
    
}

//添加背景图片
-(void)addBackground{
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    
    CCSprite *bg = [CCSprite spriteWithFile:@"bg_avatarselection-ipad.png"];
    
    bg.position = ccp(screenSize.width/2,screenSize.height*0.5);
    
    [self addChild:bg z:-1];
    
}



#pragma mark 添加菜单

-(void)addCharacterMenu{
    
    CGSize size = [CCDirector sharedDirector].winSize;
    
    CCMenuItem *girlAvatarMenuItem = [CCMenuItemImage itemWithNormalImage:@"avatar_girl-ipad.png" selectedImage:nil target:self selector:@selector(choosePets:)];
    CCMenuItem *boyAvatarMenuItem = [CCMenuItemImage itemWithNormalImage:@"avatar_boy-ipad.png"  selectedImage:nil target:self selector:@selector(choosePets:)];
    
    girlAvatarMenuItem.position = ccp(size.width*0.3,size.height*0.4);
    boyAvatarMenuItem.position = ccp(size.width *0.7,size.height *0.4);
    
    
    CCMenu *menu = [CCMenu menuWithItems:girlAvatarMenuItem,boyAvatarMenuItem, nil];
    menu.position = ccp(0,0);
    [self addChild:menu z:1];
    
}

-(void)choosePets:(id)sender{
    
    [SceneManager goPetsAvatarSelection];
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
        
//        [self addBackItem];
        
//        [self addEnterNewSceneItem];
        
        
        [self addCharacterMenu];
        
        //播放背景音乐
        [self playBackgroundMusic];
        
        
    }
    return self;
}






@end
