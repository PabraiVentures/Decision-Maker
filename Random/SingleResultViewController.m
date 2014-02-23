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
  if (appdelegate->single){
    
  self.results.text=[NSString stringWithFormat:@"%@\nResult\n%@",appdelegate.title,appdelegate.choicetext];
  }
  else {
    NSMutableArray *rankedarray= [[NSMutableArray alloc]init];
   // self.results.text=@"Ranked!";
    int i=0;
    float high=0;
    int highest=0;
    int selected=0;
    
    
    while (selected< [appdelegate.choices count]){
    
    
    //this adds higest element in array
    for (i=0;i<[appdelegate.results count];i++){
      
      if ([[appdelegate.results objectAtIndex:i] floatValue] >high){
        
        highest=i;
        high=[[appdelegate.results objectAtIndex:i] floatValue];
      }
      
   //   NSLog(@"Out %f",[[appdelegate.results objectAtIndex:i] floatValue]);
           //this adds higest element in array

      
    }
      [rankedarray addObject:((NSString*)[appdelegate.choices objectAtIndex:highest  ])];
      [appdelegate.results replaceObjectAtIndex:highest withObject:@"-1"];
      selected++;
      high=0;
    
    }
    
    NSLog(@"%@\nThe Ranked results: %@",appdelegate.title ,rankedarray);
    NSString *resultstring=[NSString stringWithFormat:@"%@\nResults:",appdelegate.title];
    int cnt=1;
    for(NSString* string in rankedarray){
      resultstring=[NSString stringWithFormat:@"%@ \n%d. %@",resultstring,cnt,string];
      cnt++;
      NSLog(@"res is %@",resultstring);
    
    }
    
    [self.scrollview setContentSize:CGSizeMake(self.scrollview.frame.size.width, 25*(cnt+3))];
    [self.results setFrame:CGRectMake(0,10,self.scrollview.frame.size.width, 25*(3+cnt))];
    
    [self.results setText: resultstring];
    
 
    
    
  }
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goHome:(id)sender {
  A4AppDelegate* appdelegate = (A4AppDelegate *)[UIApplication sharedApplication].delegate;
  appdelegate.choices=nil;
  appdelegate.choicetext=nil;
  appdelegate.weights=nil;
  appdelegate.results=nil;
  appdelegate.title=nil;
  [self performSegueWithIdentifier:@"toHome" sender:nil];

}
@end
