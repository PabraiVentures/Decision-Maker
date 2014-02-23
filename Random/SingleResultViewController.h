//
//  SingleResultViewController.h
//  Random
//
//  Created by Nathan Pabrai on 2/22/14.
//  Copyright (c) 2014 APT4. All rights reserved.
//
#import <iAd/iAd.h>
#import <UIKit/UIKit.h>

@interface SingleResultViewController : UIViewController
@property (weak, nonatomic) IBOutlet ADBannerView *adView;
@property (weak, nonatomic) IBOutlet UILabel *results;

@end
