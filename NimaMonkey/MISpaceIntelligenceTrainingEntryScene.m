//
//  MISpaceIntelligenceTrainingEntryScene.m
//  NimaMonkey
//
//  Created by Ricky on 3/5/13.
//  Copyright 2013 meetgame. All rights reserved.
//

#import "MISpaceIntelligenceTrainingEntryScene.h"

#import "SimpleAudioEngine.h"
#import "SceneManager.h"
#import "GameSounds.h"
#import "GameData.h"
#import "MobClick.h"
#import "Constants.h"


@implementation MISpaceIntelligenceTrainingEntryScene

#pragma mark 类方法

+(id)scene{
    
    CCScene *scene =[CCScene node];
    MISpaceIntelligenceTrainingEntryScene *layer = [MISpaceIntelligenceTrainingEntryScene node];
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
    menuButton.position = ccp(screenSize.width*0.9,screenSize.height*0.85);
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
    
    [SceneManager goGameIntroScene2];
}



#pragma mark 添加其它视觉元素

//添加游戏标题

-(void)addSceneTitle{
    
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    
    
    CCLabelTTF *currentSceneTitle = [CCLabelTTF labelWithString:@"空间智能" fontName:@"ChalkboardSE-Bold" fontSize:40];
    currentSceneTitle.position = ccp(screenSize.width/2,screenSize.height*0.5);
    currentSceneTitle.color = ccc3(255,255,255);
    [self addChild:currentSceneTitle z:0];
    
    
}

//添加背景图片
-(void)addBackground{
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    
    CCSprite *bg = [CCSprite spriteWithFile:@"gamehall_hall_background-ipad.png"];
    
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

-(void)addGameMenu{
    
    CGSize size = [CCDirector sharedDirector].winSize;
    
    CCMenuItemImage *upperItem1 = [CCMenuItemImage itemWithNormalImage:@"gamehall_topbar_home-ipad.png" selectedImage:nil target:self selector:@selector(upperItem1Touched:)];
    CCMenuItemImage *upperItem2 = [CCMenuItemImage itemWithNormalImage:@"gamehall_topbar_setting-ipad.png" selectedImage:nil target:self selector:@selector(upperItem2Touched:)];
    CCMenuItemImage *upperItem3 = [CCMenuItemImage itemWithNormalImage:@"gamehalltopbar_announce-ipad.png" selectedImage:nil target:self selector:@selector(upperItem3Touched:)];
    CCMenuItemImage *upperItem4 = [CCMenuItemImage itemWithNormalImage:@"gamehalltopbar_bag-ipad.png" selectedImage:nil target:self selector:@selector(upperItem4Touched:)];
    CCMenuItemImage *upperItem5 = [CCMenuItemImage itemWithNormalImage:@"gamehalltopbar_friends-ipad.png" selectedImage:nil target:self selector:@selector(upperItem5Touched:)];
    CCMenuItemImage *upperItem6 = [CCMenuItemImage itemWithNormalImage:@"gamehalltopbar_map-ipad.png" selectedImage:nil target:self selector:@selector(upperItem6Touched:)];
    CCMenuItemImage *upperItem7 = [CCMenuItemImage itemWithNormalImage:@"gamehalltopbar_meage-ipad.png" selectedImage:nil target:self selector:@selector(upperItem7Touched:)];
    CCMenuItemImage *upperItem8 = [CCMenuItemImage itemWithNormalImage:@"gamehalltopbar_task-ipad.png" selectedImage:nil target:self selector:@selector(upperItem8Touched:)];
    
    
    upperItem1.position = ccp(size.width*0.1,size.height*0.9);
    upperItem2.position = ccp(size.width*0.2,size.height*0.9);
    upperItem3.position = ccp(size.width*0.3,size.height*0.9);
    upperItem4.position = ccp(size.width*0.4,size.height*0.9);
    upperItem5.position = ccp(size.width*0.5,size.height*0.9);
    upperItem6.position = ccp(size.width*0.6,size.height*0.9);
    upperItem7.position = ccp(size.width*0.7,size.height*0.9);
    upperItem8.position = ccp(size.width*0.8,size.height*0.9);

    CCMenu *upperMenu = [CCMenu menuWithItems:upperItem1,upperItem2,upperItem3,upperItem4,upperItem5,upperItem6,upperItem7,upperItem8, nil];
    upperMenu.position = ccp(0,0);
    
    [self addChild:upperMenu z:1];
    
    
    CCMenuItemImage *downItem1 = [CCMenuItemImage itemWithNormalImage:@"gamehalldown_frame1-ipad.png" selectedImage:nil target:self selector:@selector(downItem1Touched:)];
    CCMenuItemImage *downItem2 = [CCMenuItemImage itemWithNormalImage:@"gamehalldown_frame1-ipad.png" selectedImage:nil target:self selector:@selector(downItem2Touched:)];
    CCMenuItemImage *downItem3 = [CCMenuItemImage itemWithNormalImage:@"gamehalldown_frame1-ipad.png" selectedImage:nil target:self selector:@selector(downItem3Touched:)];
    CCMenuItemImage *downItem4 = [CCMenuItemImage itemWithNormalImage:@"gamehalldown_frame1-ipad.png" selectedImage:nil target:self selector:@selector(downItem4Touched:)];
    CCMenuItemImage *downItem5 = [CCMenuItemImage itemWithNormalImage:@"gamehalldown_frame1-ipad.png" selectedImage:nil target:self selector:@selector(downItem5Touched:)];
    
    downItem1.position = ccp(size.width*0.15,size.height*0.2);
    downItem2.position = ccp(size.width*0.3,size.height*0.2);
    downItem3.position = ccp(size.width*0.45,size.height*0.2);
    downItem4.position = ccp(size.width*0.6,size.height*0.2);
    downItem5.position = ccp(size.width*0.75,size.height*0.2);
    
    CCMenu *downMenu = [CCMenu menuWithItems:downItem1,downItem2,downItem3,downItem4,downItem5, nil];
    downMenu.position = ccp(0,0);
    [self addChild:downMenu z:1];
    
    CCMenuItemImage *downFunctionItem1 = [CCMenuItemImage itemWithNormalImage:@"gamehalldownbar_function3-ipad.png" selectedImage:nil target:self selector:@selector(downFunctionItem1Touched:)];
    CCMenuItemImage *downFunctionItem2 = [CCMenuItemImage itemWithNormalImage:@"gamehalldownbar_function3-ipad.png" selectedImage:nil target:self selector:@selector(downFunctionItem2Touched:)];
    CCMenuItemImage *downFunctionItem3 = [CCMenuItemImage itemWithNormalImage:@"gamehalldownbar_function3-ipad.png" selectedImage:nil target:self selector:@selector(downFunctionItem3Touched:)];
    CCMenuItemImage *downFunctionItem4 = [CCMenuItemImage itemWithNormalImage:@"gamehalldownbar_function3-ipad.png" selectedImage:nil target:self selector:@selector(downFunctionItem4Touched:)];
    CCMenuItemImage *downFunctionItem5 = [CCMenuItemImage itemWithNormalImage:@"gamehalldownbar_function3-ipad.png" selectedImage:nil target:self selector:@selector(downFunctionItem5Touched:)];
    
    downFunctionItem1.position = ccp(size.width*0.15,size.height*0.2);
    downFunctionItem2.position = ccp(size.width*0.3,size.height*0.2);
    downFunctionItem3.position = ccp(size.width*0.45,size.height*0.2);
    downFunctionItem4.position = ccp(size.width*0.6,size.height*0.2);
    downFunctionItem5.position = ccp(size.width*0.75,size.height*0.2);
    
    
    CCMenu *downFunctionMenu = [CCMenu menuWithItems:downFunctionItem1,downFunctionItem2,downFunctionItem3,downFunctionItem4,downFunctionItem5, nil];
    downFunctionMenu.position = ccp(0,0);
    [self addChild:downFunctionMenu z:2];
    
}

-(void)upperItem1Touched:(id)sender{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"临时使用" message:@"这里是demo，正式产品应具有特有功能" delegate:nil cancelButtonTitle:@"好吧" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
}

-(void)upperItem2Touched:(id)sender{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"临时使用" message:@"这里是demo，正式产品应具有特有功能" delegate:nil cancelButtonTitle:@"好吧" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
}


-(void)upperItem3Touched:(id)sender{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"临时使用" message:@"这里是demo，正式产品应具有特有功能" delegate:nil cancelButtonTitle:@"好吧" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
}


-(void)upperItem4Touched:(id)sender{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"临时使用" message:@"这里是demo，正式产品应具有特有功能" delegate:nil cancelButtonTitle:@"好吧" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
}

-(void)upperItem5Touched:(id)sender{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"临时使用" message:@"这里是demo，正式产品应具有特有功能" delegate:nil cancelButtonTitle:@"好吧" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
}


-(void)upperItem6Touched:(id)sender{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"临时使用" message:@"这里是demo，正式产品应具有特有功能" delegate:nil cancelButtonTitle:@"好吧" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
}


-(void)upperItem7Touched:(id)sender{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"临时使用" message:@"这里是demo，正式产品应具有特有功能" delegate:nil cancelButtonTitle:@"好吧" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
}

-(void)upperItem8Touched:(id)sender{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"临时使用" message:@"这里是demo，正式产品应具有特有功能" delegate:nil cancelButtonTitle:@"好吧" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
}

-(void)downItem1Touched:(id)sender{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"临时使用" message:@"这里是demo，正式产品应具有特有功能" delegate:nil cancelButtonTitle:@"好吧" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
}

-(void)downItem2Touched:(id)sender{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"临时使用" message:@"这里是demo，正式产品应具有特有功能" delegate:nil cancelButtonTitle:@"好吧" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
}


-(void)downItem3Touched:(id)sender{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"临时使用" message:@"这里是demo，正式产品应具有特有功能" delegate:nil cancelButtonTitle:@"好吧" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
}


-(void)downItem4Touched:(id)sender{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"临时使用" message:@"这里是demo，正式产品应具有特有功能" delegate:nil cancelButtonTitle:@"好吧" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
}

-(void)downItem5Touched:(id)sender{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"临时使用" message:@"这里是demo，正式产品应具有特有功能" delegate:nil cancelButtonTitle:@"好吧" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
}



#pragma mark-场景初始化


-(id)init{
    
    if((self  =[super init])){
        
        
        
        
        //设置各视觉元素在屏幕中的位置
        
        [self addBackground];
        
        [self addSceneTitle];
        
        [self addBackItem];
        
        //        [self addEnterNewSceneItem];
        
        [self addGameMenu];
        
        //播放背景音乐
        [self playBackgroundMusic];
        
        
    }
    return self;
}




@end
