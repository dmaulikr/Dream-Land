//
//  PetsAvatarSelection.m
//  NimaMonkey
//
//  Created by happybubsy on 3/23/13.
//  Copyright 2013 meetgame. All rights reserved.
//

#import "PetsAvatarSelection.h"

#import "SimpleAudioEngine.h"
#import "SceneManager.h"
#import "GameSounds.h"
#import "GameData.h"
#import "MobClick.h"
#import "Constants.h"

@implementation PetsAvatarSelection

+(id)scene{
    
    CCScene *scene =[CCScene node];
    PetsAvatarSelection *layer = [PetsAvatarSelection node];
    [scene addChild:layer];
    return scene;
    
}

#pragma mark 添加菜单项

//back button

//返回游戏开始界面
-(void)backToStart{
    
    [[SimpleAudioEngine sharedEngine]playEffect:@"button2.mp3"];
    [SceneManager goKidsAvatarSelection];
    
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
    moreItem.position =ccp(screenSize.width*0.5,screenSize.height*0.2);
    
    //创建菜单
    
    CCMenu *menu =[CCMenu menuWithItems:moreItem, nil];
    menu.position = CGPointZero;
    [self addChild:menu z:2];
    
}

-(void)enterNewScene{
    
    //进入任务界面
    [SceneManager goKidsGameSelectionScene];
}



#pragma mark 添加其它视觉元素

//添加游戏标题

-(void)addSceneTitle{
    
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    
    
    CCLabelTTF *currentSceneTitle = [CCLabelTTF labelWithString:@"宠物角色形象选择" fontName:@"ChalkboardSE-Bold" fontSize:40];
    currentSceneTitle.position = ccp(screenSize.width/2,screenSize.height*0.5);
    currentSceneTitle.color = ccc3(255,255,255);
    [self addChild:currentSceneTitle z:0];
    
    
}

//添加背景图片
-(void)addBackground{
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    
    CCSprite *bg = [CCSprite spriteWithFile:@"bg_petselection-ipad.png"];
    
    bg.position = ccp(screenSize.width/2,screenSize.height*0.5);
    
    [self addChild:bg z:-1];
    
}

//选择宠物
-(void)addAvatars{
    
    CGSize size =[CCDirector sharedDirector].winSize;
    
    //创建菜单项
    
    CCMenuItem *petAvatar1Item = [CCMenuItemImage itemWithNormalImage:@"petselection_bull-ipad.png" selectedImage:nil target:self selector:@selector(enterNewScene)];
    petAvatar1Item.position =ccp(size.width*0.2,size.height*0.35);
    
    
    CCMenuItem *petAvatar2Item = [CCMenuItemImage itemWithNormalImage:@"petselection_cock-ipad.png" selectedImage:nil target:self selector:@selector(enterNewScene)];
    petAvatar2Item.position =ccp(size.width*0.4,size.height*0.35);
    
    CCMenuItem *petAvatar3Item = [CCMenuItemImage itemWithNormalImage:@"petselection_cow-ipad.png" selectedImage:nil target:self selector:@selector(enterNewScene)];
    petAvatar3Item.position =ccp(size.width*0.6,size.height*0.35);
    
    CCMenuItem *petAvatar4Item = [CCMenuItemImage itemWithNormalImage:@"petselection_dragon-ipad.png" selectedImage:nil target:self selector:@selector(enterNewScene)];
    petAvatar4Item.position =ccp(size.width*0.8,size.height*0.35);
    
    CCMenuItem *petAvatar5Item = [CCMenuItemImage itemWithNormalImage:@"petselection_hu-ipad.png" selectedImage:nil target:self selector:@selector(enterNewScene)];
    petAvatar5Item.position =ccp(size.width*0.2,size.height*0.6);
    
    
    CCMenuItem *petAvatar6Item = [CCMenuItemImage itemWithNormalImage:@"petselection_monkey-ipad.png" selectedImage:nil target:self selector:@selector(enterNewScene)];
    
    petAvatar6Item.position =ccp(size.width*0.4,size.height*0.6);
    
    CCMenuItem *petAvatar7Item = [CCMenuItemImage itemWithNormalImage:@"petselection_pig-ipad.png" selectedImage:nil target:self selector:@selector(enterNewScene)];
    petAvatar7Item.position =ccp(size.width*0.6,size.height*0.6);
    
    CCMenuItem *petAvatar8Item = [CCMenuItemImage itemWithNormalImage:@"petselection_rabbit-ipad.png" selectedImage:nil target:self selector:@selector(enterNewScene)];
    
    petAvatar8Item.position =ccp(size.width*0.8,size.height*0.6);
    
    
    CCMenuItem *petAvatar9Item = [CCMenuItemImage itemWithNormalImage:@"petselection_rat-ipad.png" selectedImage:nil target:self selector:@selector(enterNewScene)];
    
    petAvatar9Item.position =ccp(size.width*0.2,size.height*0.85);
    
    
    CCMenuItem *petAvatar10Item = [CCMenuItemImage itemWithNormalImage:@"petselection_sheep-ipad.png" selectedImage:nil target:self selector:@selector(enterNewScene)];
    
    petAvatar10Item.position =ccp(size.width*0.4,size.height*0.85);
    
    CCMenuItem *petAvatar11Item = [CCMenuItemImage itemWithNormalImage:@"petselection_snake-ipad.png" selectedImage:nil target:self selector:@selector(enterNewScene)];
    
    petAvatar11Item.position =ccp(size.width*0.6,size.height*0.85);
    
    CCMenuItem *petAvatar12Item = [CCMenuItemImage itemWithNormalImage:@"petselection_tiger-ipad.png" selectedImage:nil target:self selector:@selector(enterNewScene)];
    
    petAvatar12Item.position =ccp(size.width*0.8,size.height*0.85);
    
    CCMenuItem *petItem = [CCMenuItemImage itemWithNormalImage:@"petselection_pet-ipad.png" selectedImage:nil target:self selector:@selector(enterNewScene)];

    petItem.position =ccp(size.width*0.5,size.height*0.2);
    
    
    CCMenuItem *guide = [CCMenuItemImage itemWithNormalImage:@"petselection_guide-ipad.png" selectedImage:nil target:self selector:@selector(enterNewScene)];

    guide.position =ccp(size.width*0.9,size.height*0.15);
    
    //创建菜单
    
    CCMenu *menu =[CCMenu menuWithItems:petAvatar1Item, petAvatar2Item,petAvatar3Item, petAvatar4Item, petAvatar5Item,petAvatar6Item,petAvatar7Item,petAvatar8Item,petAvatar9Item,petAvatar10Item,petAvatar11Item,petAvatar12Item,petItem,guide,nil];
    menu.position = CGPointZero;
    [self addChild:menu z:2];
    
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
        
        [self addAvatars];
        
        //播放背景音乐
        [self playBackgroundMusic];
        
        
    }
    return self;
}




@end
