//
//  SingleResultViewController.m
//  Random
//
//  Created by Nathan Pabrai on 2/22/14.
//  Copyright (c) 2014 APT4. All rights reserved.
//

#import "SingleResultViewController.h"
#import "A4AppDelegate.h"
@interface SingleResultViewController ()

@end

@implementation SingleResultViewController
- (void) viewWillDisappear:(BOOL)animated
{
  [_adView removeFromSuperview];
  _adView.delegate = nil;
  _adView = nil;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
  A4AppDelegate* appdelegate = (A4AppDelegate *)[UIApplication sharedApplication].delegate;

  self.results.text=appdelegate.choicetext;
   
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
