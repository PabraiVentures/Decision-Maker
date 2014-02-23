//
//  A4ViewController.h
//  Random
//
//  Created by Nathan Pabrai on 2/22/14.
//  Copyright (c) 2014 APT4. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
@interface A4ViewController : UIViewController
@property (weak, nonatomic) IBOutlet ADBannerView *adView;
- (IBAction)exit:(id)sender;
- (IBAction)singlePressed:(id)sender;
- (IBAction)rankedPressed:(id)sender;
@end
