//
//  SceneManager.m
//

#import "SceneManager.h"


@interface SceneManager ()

+(void) go: (CCLayer *) layer;
+(CCScene *) wrap: (CCLayer *) layer;

@end

@implementation SceneManager

/*  ___Template___________________________________
 
 Step 3 - Add implementation to call scene
 ______________________________________________
 
 
 +(void) goSceneName {
 [SceneManager go:[SceneName node]];
 }
 
 */

#pragma mark 切换场景
#pragma mark 信息设置界面

//首次使用引导界面


+(void) goGameIntroScene1{
    
    [SceneManager go:[GameIntroScene1 node]];
    
}

+(void) goGameIntroScene2{
    
     [SceneManager go:[GameIntroScene2 node]];
}
+(void) goGameIntroScene3{
    
     [SceneManager go:[GameIntroScene3 node]];
    
}
+(void) goGameIntroScene4{
    
     [SceneManager go:[GameIntroScene4 node]];
    
}

//设置导航界面

+(void)goFirstTimeSettingGuidelineScene{
    
     [SceneManager go:[FirstTimeSettingGuidelineScene node]];
    
}


//注册及登陆界面

//用户登陆界面

+(void)goUserLoginScene{
    
     [SceneManager go:[UserLoginScene node]];
    
}


//用户注册界面

+(void)goUserSignupScene{
    
     [SceneManager go:[UserSignupScene node]];
    
}


//用户选择登陆类型界面

+(void)goChooseLoginTypeScene{
    
     [SceneManager go:[ChooseLoginTypeScene node]];
    
}


//防沉迷设置界面

+(void)goAntiGameAddictionScene{
    
     [SceneManager go:[AntiGameAddictionScene node]];
    
}


//训练内容设置界面

+(void)goLearningContentSettingScene{
    
    
     [SceneManager go:[LearningContentSettingScene node]];
}


//宝宝信息设置界面

+(void)goKidsInfoSettingScene{
    
    
     [SceneManager go:[KidsInfoSettingScene node]];
}


//父母信息设置界面

+(void)goParentsInfoSettingScene{
    
     [SceneManager go:[ParentsInfoSettingScene node]];
    
}


//正式进入后的导航界面（选择宝宝还是父母入口）

+(void)goUserTypeSelectionScene{
    
     [SceneManager go:[UserTypeSelectionScene node]];
    
}



#pragma mark 宝宝功能相关界面

//世界观背景介绍
+(void)goGameWorldIntro{
    
    [SceneManager go:[GameWorldIntro node]];
    
}

//角色形象
+(void)goKidsAvatarSelection{

       [SceneManager go:[KidsAvatarSelection node]];
    
}


//宠物形象

+(void)goPetsAvatarSelection{
    
    [SceneManager go:[PetsAvatarSelection node]];

    
}

//MI多元智能训练

//自我认知智能

+(void)goMISelfCognitiveIntelligenceTrainingEntryScene{
    
     [SceneManager go:[MISelfCognitiveIntelligenceTrainingEntryScene node]];
    
}


//自然观察智能

+(void)goMINaturalObservationIntelligenceTrainingEntryScene{
    
     [SceneManager go:[MINaturalObservationIntelligenceTrainingEntryScene node]];
    
}


//运动智能

+(void)goMISportsIntelligenceTrainingEntryScene{
    
     [SceneManager go:[MISportIntelligenceTrainingEntryScene node]];
    
}


//人际智能

+(void)goMISocialIntelligenceTrainingEntryScene{
    
    
     [SceneManager go:[MISocialIntelligenceTrainingEntryScene node]];
}


//语言智能

+(void)goMILanguageIntelligenceTrainingEntryScene{
    
     [SceneManager go:[MILanguageIntelligenceTrainingEntryScene node]];
    
}


//音乐智能

+(void)goMIMusicIntelligenceTrainingEntryScene{
    
     [SceneManager go:[MIMusicIntelligenceTrainingEntryScene node]];
    
}


//数理逻辑智能

+(void)goMILogicIntelligenceTrainingEntryScene{
    
     [SceneManager go:[MILogicIntelligenceTrainingEntryScene node]];
    
}



//空间智能

+(void)goMISpaceIntelligenceTrainingEntryScene{
    
     [SceneManager go:[MISpaceIntelligenceTrainingEntryScene node]];
    
}


//宝宝好友系统界面

+(void)goKidsSocialScene{
    
     [SceneManager go:[KidsSocialScene node]];
    
}


//虚拟宠物界面

+(void)goVirtualPetScene{
    
     [SceneManager go:[VirtualPetScene node]];
    
}


//游戏商城界面

+(void)goDreamStoreScene{
    
     [SceneManager go:[DreamStoreScene node]];
    
}


//宝宝首界面

+(void)goKidsGameSelectionScene{
    
     [SceneManager go:[KidsGameSelectionScene node]];
    
}


#pragma mark 父母功能界面

//父母界面-LBS社交

+(void)goParentsFunctionSocialScene{
    
     [SceneManager go:[ParentsFunctionSocialScene node]];
    
}


//父母界面-成绩分析

+(void)goParentsFunctionScoreAnalysisScene{
    
     [SceneManager go:[ParentsFunctionScoreAnalysisScene node]];
    
}


//父母界面-查看排行榜

+(void)goParentsFunctionBoardScene{
    
     [SceneManager go:[ParentsFunctionBoardScene node]];
    
}


//父母首界面

+(void)goParentsFunctionSelectionScene{
    
     [SceneManager go:[ParentsFunctionSelectionScene node]];
    
}



#pragma mark old scenes


//
//+(void) goStartGame {
//  [SceneManager go:[StartGameScene node]];
//}
//
//+(void) goAboutScene {
//  [SceneManager go:[About node]];
//}
//
//
//
//+(void) goToyPhoneScene{
//    
//      [SceneManager go:[ToyPhoneScene node]];
//}
//+(void) goBellScene{
//    
//      [SceneManager go:[BellScene node]];
//}
//+(void) goToyBellScene{
//    
//      [SceneManager go:[ToyBellScene node]];
//}
//+(void) goToyMarimbaScene{
//    
//      [SceneManager go:[ToyMarimbaScene node]];
//}
//
//+(void) goAnimalPianoScene{
//    
//      [SceneManager go:[AnimalPianoScene node]];
//}
//
//+(void) goBubblePopping{
//    
//    [SceneManager go:[BubblePopping node]];
//    
//}
//
//+(void)goWhackMole{
//    
//    [SceneManager go:[WhackMole node]];
//}
//
//+(void)goPlayFireworks{
//    
//    [SceneManager go:[PlayFireworks node]];
//}
//
//
//+(void)goRattleDrum{
//    
//    [SceneManager go:[RattleDrum node]];
//}
//
//+(void)goPlayFireCracker{
//    
//    [SceneManager go:[PlayFirecracker node]];
//}
//
//+(void)goBambooClapper{
//    
//    [SceneManager go:[BambooClappers node]];
//    
//}
//
//+(void)goToyDrum{
//
//    [SceneManager go:[ToyDrum node]];
//    
//}


//+(void) goChapterSelect{
//    
//    [SceneManager go:[ChapterSelection node]];
//}

//+(void) goToyStore{
//    
//    [SceneManager go:[ToyStore node]];
//}
//
//
//+(void) goToyStoreNew{
//    
//    [SceneManager go:[ToyStore node]];
//}

#pragma mark  场景切换类方法

+(void) go: (CCLayer *) layer {
  CCDirector *director = [CCDirector sharedDirector];
  CCScene *newScene = [SceneManager wrap:layer];
  if ([director runningScene]) {
    
    [director replaceScene:newScene];
  }
  else {
    [director runWithScene:newScene];
  }
}


#pragma mark 类方法

+(CCScene *) wrap: (CCLayer *) layer {
  CCScene *newScene = [CCScene node];
  [newScene addChild: layer];
  return newScene;
}

@end
