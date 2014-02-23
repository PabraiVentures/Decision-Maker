//
//  A4ViewController.m
//  Random
//
//  Created by Nathan Pabrai on 2/22/14.
//  Copyright (c) 2014 APT4. All rights reserved.
//

#import "A4ViewController.h"
#import "A4AppDelegate.h"

@interface A4ViewController ()

@end

@implementation A4ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (void) viewWillDisappear:(BOOL)animated
{
  [self.adView removeFromSuperview];
  _adView.delegate = nil;
  _adView = nil;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)singlePressed:(id)sender {
  A4AppDelegate* appdelegate = (A4AppDelegate *)[UIApplication sharedApplication].delegate;
  appdelegate->single=true;
  [self performSegueWithIdentifier:@"toInput" sender:nil];

}

- (IBAction)rankedPressed:(id)sender {
  A4AppDelegate* appdelegate = (A4AppDelegate *)[UIApplication sharedApplication].delegate;
  appdelegate->single=false;
  [self performSegueWithIdentifier:@"toInput" sender:nil];

}
@end
