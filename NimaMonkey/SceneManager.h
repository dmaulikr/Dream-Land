//
//  SceneManager.h
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

/*  ___Template___________________________________
 
 Step 1 - Import header of your SceneName
 ______________________________________________
 
 #import "SceneName.h"
 
 */

//setting
#import "GameIntroScene1.h"
#import "GameIntroScene2.h"
#import "GameIntroScene3.h"
#import "GameIntroScene4.h"


#import "FirstTimeSettingGuidelineScene.h"
#import "UserLoginScene.h"
#import "UserSignupScene.h"
#import "ChooseLoginTypeScene.h"
#import "AntiGameAddictionScene.h"
#import "LearningContentSettingScene.h"
#import "KidsInfoSettingScene.h"
#import "ParentsInfoSettingScene.h"
#import "UserTypeSelectionScene.h"


//kids

//Intro

#import "GameWorldIntro.h"

//Avatar

#import "KidsAvatarSelection.h"

#import "PetsAvatarSelection.h"

//MI
#import "MISelfCognitiveIntelligenceTrainingEntryScene.h"
#import "MINaturalObservationIntelligenceTrainingEntryScene.h"
#import "MISpaceIntelligenceTrainingEntryScene.h"
#import "MISportIntelligenceTrainingEntryScene.h"
#import "MILanguageIntelligenceTrainingEntryScene.h"
#import "MIMusicIntelligenceTrainingEntryScene.h"
#import "MILogicIntelligenceTrainingEntryScene.h"
#import "MISocialIntelligenceTrainingEntryScene.h"

//
#import "KidsSocialScene.h"
#import "VirtualPetScene.h"
#import "DreamStoreScene.h"
#import "KidsGameSelectionScene.h"

//parents

#import "ParentsFunctionSocialScene.h"
#import "ParentsFunctionScoreAnalysisScene.h"
#import "ParentsFunctionBoardScene.h"
#import "ParentsFunctionSelectionScene.h"

//old scenes

//#import "StartGameScene.h"
//#import "About.h"
//#import "ToyPhoneScene.h"
//#import "BellScene.h"
//#import "ToyBellScene.h"
//#import "ToyMarimbaScene.h"
//#import "AnimalPianoScene.h"
//#import "BubblePopping.h"
//#import "WhackMole.h" 
//#import "PlayFireworks.h"
//#import "RattleDrum.h"
//#import "PlayFirecracker.h"
//#import "BambooClappers.h"
//#import "ToyDrum.h"

//#import "ToyStore.h"

//#import "ToyStoreNew.h"


//#import "ChapterSelect.h"


@interface SceneManager : NSObject {
  
}

/*  ___Template___________________________________
 
 Step 2 - Add interface scene calling method
 ______________________________________________
 
 +(void) goSceneName;
 
 */
#pragma mark 信息设置界面

//首次使用引导界面

+(void) goGameIntroScene1;
+(void) goGameIntroScene2;
+(void) goGameIntroScene3;
+(void) goGameIntroScene4;

//设置导航界面

+(void)goFirstTimeSettingGuidelineScene;

//注册及登陆界面

//用户登陆界面

+(void)goUserLoginScene;

//用户注册界面

+(void)goUserSignupScene;

//用户选择登陆类型界面

+(void)goChooseLoginTypeScene;

//防沉迷设置界面

+(void)goAntiGameAddictionScene;

//训练内容设置界面

+(void)goLearningContentSettingScene;

//宝宝信息设置界面

+(void)goKidsInfoSettingScene;

//父母信息设置界面

+(void)goParentsInfoSettingScene;

//正式进入后的导航界面（选择宝宝还是父母入口）

+(void)goUserTypeSelectionScene;


#pragma mark 宝宝功能相关界面
//进入世界观背景介绍
+(void)goGameWorldIntro;

//角色形象
+(void)goKidsAvatarSelection;

//宠物形象

+(void)goPetsAvatarSelection;



//MI多元智能训练

//自我认知智能

+(void)goMISelfCognitiveIntelligenceTrainingEntryScene;

//自然观察智能

+(void)goMINaturalObservationIntelligenceTrainingEntryScene;

//运动智能

+(void)goMISportsIntelligenceTrainingEntryScene;

//人际智能

+(void)goMISocialIntelligenceTrainingEntryScene;

//语言智能

+(void)goMILanguageIntelligenceTrainingEntryScene;

//音乐智能

+(void)goMIMusicIntelligenceTrainingEntryScene;

//数理逻辑智能

+(void)goMILogicIntelligenceTrainingEntryScene;


//空间智能

+(void)goMISpaceIntelligenceTrainingEntryScene;

//宝宝好友系统界面

+(void)goKidsSocialScene;

//虚拟宠物界面

+(void)goVirtualPetScene;

//游戏商城界面

+(void)goDreamStoreScene;

//宝宝首界面

+(void)goKidsGameSelectionScene;

#pragma mark 父母功能界面

//父母界面-LBS社交

+(void)goParentsFunctionSocialScene;

//父母界面-成绩分析

+(void)goParentsFunctionScoreAnalysisScene;

//父母界面-查看排行榜

+(void)goParentsFunctionBoardScene;

//父母首界面

+(void)goParentsFunctionSelectionScene;

#pragma mark 老场景

//+(void) goStartGame;
//+(void) goAboutScene;
//
//+(void) goToyPhoneScene;
//+(void) goBellScene;
//+(void) goToyBellScene;
//+(void) goToyMarimbaScene;
//+(void) goAnimalPianoScene;
//+(void) goBubblePopping;
//+(void) goWhackMole;
//+(void) goPlayFireworks;
//+(void) goRattleDrum;
//+(void) goPlayFireCracker;
//+(void) goBambooClapper;
//+(void) goToyDrum;

//
//+(void) goChapterSelect;
//
//+(void) goToyStore;


@end
