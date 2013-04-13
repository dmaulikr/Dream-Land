//
//  GameWorldIntro.m
//  NimaMonkey
//
//  Created by happybubsy on 3/23/13.
//  Copyright 2013 meetgame. All rights reserved.
//

#import "GameWorldIntro.h"
#import "SimpleAudioEngine.h"
#import "SceneManager.h"
#import "GameSounds.h"
#import "GameData.h"
#import "MobClick.h"
#import "Constants.h"
#import <MediaPlayer/MediaPlayer.h>



@implementation GameWorldIntro{
    
    MPMoviePlayerViewController *moviePlayerViewController;
}

#pragma mark 类方法

+(id)scene{
    
    CCScene *scene =[CCScene node];
    GameWorldIntro *layer = [GameWorldIntro node];
    [scene addChild:layer];
    return scene;
    
}

#pragma mark 播放电影
-(void)preparePlay{
    
    //Load our video file
	NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"panda" ofType:@"mov"]];
	
	//Create a MPMoviePlayerController object
	moviePlayerViewController = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
    
    
	//Register to receive a notification when the movie has finished playing.
	[[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayBackDidFinish:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:moviePlayerViewController];
    
	//Set the movie's control style and whether or not it should automatically play.
    
    moviePlayerViewController.moviePlayer.controlStyle = MPMovieControlStyleNone;
    moviePlayerViewController.moviePlayer.shouldAutoplay = YES;
    
    
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    
    moviePlayerViewController.moviePlayer.view.frame = CGRectMake(45, 50, winSize.width-90, winSize.height-100);
    
    [[CCDirector sharedDirector]presentMoviePlayerViewControllerAnimated:moviePlayerViewController];
    
    
    
}

-(void)moviePlayBackDidFinish:(NSNotification*)notification {
	//If playback is finished we stop the movie.
	[self stopMovie];
    
 
}



-(void)stopMovie {
	//We do not stop the movie if it is already stopped.
    
    MPMoviePlaybackState  state = moviePlayerViewController.moviePlayer.playbackState;
    if(state == MPMoviePlaybackStateStopped) {
		NSLog(@"Movie is already stopped.");
		return;
	}
	
	//Since playback has finished we remove the observer.
	[[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:moviePlayerViewController];
    
	//If the moviePlayer.view was added to the openGL view, it needs to be removed.
	if ([moviePlayerViewController  respondsToSelector:@selector(setFullscreen:animated:)]) {
		[moviePlayerViewController.view removeFromSuperview];
	}
    
       [SceneManager goKidsAvatarSelection];
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
    [self addChild:menu z:3];
    
}

-(void)enterNewScene{
    
    [SceneManager goKidsAvatarSelection];
}



#pragma mark 添加其它视觉元素

//添加游戏标题

-(void)addSceneTitle{
    
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    
    
    CCLabelTTF *currentSceneTitle = [CCLabelTTF labelWithString:@"游戏世界观介绍" fontName:@"ChalkboardSE-Bold" fontSize:40];
    currentSceneTitle.position = ccp(screenSize.width/2,screenSize.height*0.5);
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
        
//        if([SimpleAudioEngine sharedEngine].isBackgroundMusicPlaying == NO)
//        {
//            [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"sweet.mp3" loop:YES];
//            
//        }
          [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"sweet.mp3" loop:YES];
    }
    
   
}





#pragma mark-场景初始化


-(id)init{
    
    if((self  =[super init])){
        
        
        [self preparePlay];
        
        //设置各视觉元素在屏幕中的位置
        
        [self addBackground];
        
        [self addSceneTitle];
        
        [self addBackItem];
        
        [self addEnterNewSceneItem];
        
        //播放背景音乐
//        [self playBackgroundMusic];
   
        
        
    }
    return self;
}




@end
