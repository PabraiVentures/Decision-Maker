//
//  A4AppDelegate.h
//  Random
//
//  Created by Nathan Pabrai on 2/22/14.
//  Copyright (c) 2014 APT4. All rights reserved.
//
#import "A4SingleDecisionInputView.h"
#import <UIKit/UIKit.h>

@interface A4AppDelegate : UIResponder <UIApplicationDelegate>

{
  
  @public BOOL  single;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic) NSMutableArray *results;
@property (strong,nonatomic) NSMutableArray *choices;
@property (strong,nonatomic) NSMutableArray *weights;
@property (strong,nonatomic) NSString *choicetext;

@property(retain,nonatomic) A4SingleDecisionInputView* singleInputView;

@end
