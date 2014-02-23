//
//  A4SingleDecisionInputView.h
//  Random
//
//  Created by Nathan Pabrai on 2/22/14.
//  Copyright (c) 2014 APT4. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
@interface A4SingleDecisionInputView : UIViewController <UITextViewDelegate,UIAlertViewDelegate>
- (IBAction)decide:(id)sender;
- (IBAction)addChoice:(UIButton*)sender;
- (IBAction)remChoice:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *choiceView;
@property (strong,nonatomic) NSMutableArray *choices;
@property (strong,nonatomic) NSMutableArray *weights;
@property (strong, nonatomic) IBOutlet UITextView *decision;
@property (weak, nonatomic) IBOutlet UIButton *delButton;
@property (weak, nonatomic) IBOutlet ADBannerView *ad1;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@end
