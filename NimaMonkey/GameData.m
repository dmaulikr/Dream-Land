
#import "GameData.h"
#import "Constants.h"
#import "SimpleAudioEngine.h"

@implementation GameData


@synthesize isExtraSceneToyDrumUnlocked;
@synthesize isAllExtraScenesUnlocked;
@synthesize isExtraSceneBambooClapperUnlocked;

@synthesize notFirstTimePlayThisGame,notFirstTimeEnterStore;
@synthesize gamePaused;

@synthesize selectedChapter = _selectedChapter;
@synthesize selectedLevel = _selectedLevel;
@synthesize soundEffectMuted,backgroundMusicMuted;


@synthesize currentLevelSolved,currentLevelUnlocked,currentChapterUnlocked;

@synthesize levelsCompleted,chaptersCompleted;



@synthesize chapterChanged;

@synthesize isDeviceIphone5;

@synthesize selectedPianoType;

@synthesize hasSwitchedToAnimaSounds;

@synthesize currentBackgroundMusicIndex;

static GameData *sharedData = nil;

+(GameData*) sharedData {
  
  if (sharedData == nil) {
    sharedData = [[GameData alloc] init] ;
    
  }
  return  sharedData;
  
}


-(id) init
{
  
  //无法获取数据的愿意可能在此，也即使用了参数
  
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
    
    
    sharedData = self;
    
    defaults = [NSUserDefaults standardUserDefaults];
    
    
       
    currentLevelSolved = [defaults boolForKey:@"currentLevelSolved"];
    
    currentLevelUnlocked = [defaults boolForKey:@"currentLevelUnlocked"];
    
    currentChapterUnlocked = [defaults boolForKey:@"currentChapterUnlocked"];
    
    
    soundEffectMuted = [defaults boolForKey:@"soundEffectMuted"];   //默认值为NO
    backgroundMusicMuted = [defaults boolForKey:@"backgroundMusicMuted"];   //默认值为NO
    
    
    gamePaused = [defaults boolForKey:@"gamePaused"];
        
    isAllExtraScenesUnlocked = [defaults boolForKey:@"isAllExtraScenesUnlocked"];
        
    isExtraSceneToyDrumUnlocked= [defaults boolForKey:@"isExtraSceneToyDrumUnlocked"];
        

    
    
    
    notFirstTimePlayThisGame = [defaults boolForKey:@"notFirstTimePlayThisGame"];
    notFirstTimeEnterStore = [defaults boolForKey:@"notFirstTimeEnterStore"];
    
    
    levelsCompleted = [defaults integerForKey:@"levelsCompletedTotal"];
    chaptersCompleted = [defaults integerForKey:@"chaptersCompleted"];
    


    
    
    //默认选择的关卡和场景
    _selectedChapter = 1;
    _selectedLevel =1;
    
    
    //关卡成就相关
    
    
    chapterChanged = [defaults boolForKey:@"chapterChanged"];
        
        isDeviceIphone5 = [defaults boolForKey:@"isDeviceIphone5"];
        
        selectedPianoType = [defaults integerForKey:@"selectedPianoType"];
        hasSwitchedToAnimaSounds = [defaults boolForKey:@"hasSwitchedToAnimaSounds"];
        
        
        currentBackgroundMusicIndex = [defaults integerForKey:@"currentBackgroundMusicIndex"];
  }
  
  return self;
}





@end
