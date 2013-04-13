//
//  GameData.h


/*
 
 其中使用NSUserDefaults来存储玩家的数据，如关卡中的最高得分，已解锁的关卡等，玩家在退出游戏中再次打开时仍然会保存此类信息
 此外，其中还设置不同关卡的一些基本信息，如不同关卡的背景图片文件名，要抛投的熊猫数量，通过关卡的分值要求等等。
 该类在经过修改后可在其它项目中重用
 
 */


#import <Foundation/Foundation.h>
//#import "cocos2d.h"


@interface GameData : NSObject {
    
    
    
    // 场景解锁与否
    
    BOOL isExtraSceneToyDrumUnlocked;
    
    BOOL isAllExtraScenesUnlocked;
  

  
  //音效相关
  
  BOOL soundEffectMuted; //音效是否打开
  BOOL backgroundMusicMuted;//背景音乐是否打开
  
  
  
  //游戏相关
  
  //是否是第一次玩这款游戏
  BOOL notFirstTimeEnterStore;
  
  BOOL notFirstTimePlayThisGame;
  
  
  //是否暂停游戏
  BOOL gamePaused;
  
  //系统默认设置
  NSUserDefaults* defaults;
  
  
  //关卡相关
  
  int levelsCompleted; //已通过的关卡数量
  
  int chaptersCompleted;//已完成的场景数量
  
  //当前关卡是否通过
  
  BOOL currentLevelSolved;
  
  //当前关卡是否解锁
  BOOL currentLevelUnlocked;
  
  //当前游戏场景是否解锁
  BOOL currentChapterUnlocked;
  
  
  //所选场景和关卡
  
  int _selectedChapter;
  int _selectedLevel;
  
  //当前关卡的评价（非历史最佳成绩，而是此次通关时的评价，历史最佳成绩保存在Levels-Chapter1.xml中）
  
  int currentLevelStars;
  

   
  BOOL chapterChanged;
    
    int currentBackgroundMusicIndex;
    
    
    //判断设备类型
    
    BOOL isDeviceIphone5;
    
    int selectedPianoType;
    
    BOOL hasSwitchedToAnimaSounds;
  
}

@property(nonatomic,assign) BOOL isExtraSceneToyDrumUnlocked;

@property(nonatomic,assign) BOOL isExtraSceneBambooClapperUnlocked;

@property(nonatomic,assign) BOOL isAllExtraScenesUnlocked;



@property(nonatomic,assign) BOOL currentLevelSolved,currentLevelUnlocked,currentChapterUnlocked;

@property(nonatomic,assign) int selectedPianoType;
@property(nonatomic,assign) BOOL hasSwitchedToAnimaSounds;


@property(nonatomic) NSInteger levelsCompleted,chaptersCompleted;

@property (nonatomic, assign) int selectedChapter;
@property(nonatomic,assign) int currentBackgroundMusicIndex;
@property (nonatomic, assign) int selectedLevel;

@property(nonatomic)BOOL soundEffectMuted,backgroundMusicMuted;
@property(nonatomic)BOOL notFirstTimePlayThisGame,notFirstTimeEnterStore;
@property(nonatomic)BOOL gamePaused;

@property(nonatomic)BOOL chapterChanged;

@property(nonatomic)BOOL isDeviceIphone5;

+(GameData*) sharedData;


//初始化
-(id)init;

@end
