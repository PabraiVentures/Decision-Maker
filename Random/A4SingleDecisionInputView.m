//
//  A4SingleDecisionInputView.m
//  Random
//
//  Created by Nathan Pabrai on 2/22/14.
//  Copyright (c) 2014 APT4. All rights reserved.
//

#import "A4SingleDecisionInputView.h"
#import "A4AppDelegate.h"

@interface A4SingleDecisionInputView ()

@end

@implementation A4SingleDecisionInputView
@synthesize choices,weights;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void) viewWillDisappear:(BOOL)animated
{
  [self.ad1 removeFromSuperview];
  self.ad1.delegate = nil;
  self.ad1 = nil;
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
  
  if([text isEqualToString:@"\n"]) {
    [textView resignFirstResponder];
    return NO;
  }
  
  return YES;
}


-(void)dismissKeyboard{
  int i=0;
  for (i=0;i<[self.weights count];i++){
    [[self.weights objectAtIndex:i] resignFirstResponder];
    
  }
  
  for (i=0;i<[self.choices count];i++){
    [[self.choices objectAtIndex:i] resignFirstResponder];
    
  }
  [self.decision resignFirstResponder];


  
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  [textField resignFirstResponder];
  return YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
  A4AppDelegate* appdelegate = (A4AppDelegate *)[UIApplication sharedApplication].delegate;
  appdelegate.singleInputView=self;

  self.decision.delegate=self;
  [self.delButton setHidden:true];

  UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                 initWithTarget:self
                                 action:@selector(dismissKeyboard)];
  
  [self.view addGestureRecognizer:tap];
  
	// Do any additional setup after loading the view.
  self.choices=[[NSMutableArray alloc]init];
  self.weights=[[NSMutableArray alloc]init];
  

  UITextView* newTF1=[[UITextView alloc]initWithFrame:CGRectMake(6, 10, 120, 80 )];
  newTF1.font = [UIFont systemFontOfSize:15];
  newTF1.autocorrectionType = UITextAutocorrectionTypeNo;
  newTF1.keyboardType = UIKeyboardTypeDefault;
  newTF1.returnKeyType = UIReturnKeyDone;
  newTF1.delegate = self;
  
  [self.choiceView addSubview:newTF1];
  
  UITextView* weight1=[[UITextView alloc]initWithFrame:CGRectMake(165, 30, 70, 35 )];
  weight1.font = [UIFont systemFontOfSize:15];
  weight1.autocorrectionType = UITextAutocorrectionTypeNo;
  weight1.keyboardType = UIKeyboardTypeNumberPad;
  weight1.returnKeyType = UIReturnKeyDone;
  weight1.delegate = self;
  weight1.text=@"1";
  
  
  [self.choiceView addSubview:weight1];
  
  
  [self.choiceView setContentSize:CGSizeMake(self.choiceView.frame.size.width, self.choiceView.frame.size.height+120)];
  
  UITextView* newTF2=[[UITextView alloc]initWithFrame:CGRectMake(6, 123, 120, 80 )];
  newTF2.font = [UIFont systemFontOfSize:15];
  newTF2.autocorrectionType = UITextAutocorrectionTypeNo;
  newTF2.keyboardType = UIKeyboardTypeDefault;
  newTF2.returnKeyType = UIReturnKeyDone;
  newTF2.delegate = self;
  [self.choiceView addSubview:newTF2];
  
  
  
  UITextView* weight2=[[UITextView alloc]initWithFrame:CGRectMake(165, 30+113, 70, 35 )];
  weight2.font = [UIFont systemFontOfSize:15];
  weight2.autocorrectionType = UITextAutocorrectionTypeNo;
  weight2.keyboardType = UIKeyboardTypeNumberPad;
  weight2.returnKeyType = UIReturnKeyDone;
  weight2.delegate = self;
  weight2.text=@"1";

  [self.choiceView addSubview:weight2];

  

  
  
  [self.choiceView setContentSize:CGSizeMake(self.choiceView.frame.size.width, self.choiceView.frame.size.height)];
  if ([appdelegate.choices count]>0){
    //WE NEED TO PUT THE OLD DATA BACK!
    [self.decTitle setText:appdelegate.title];
    int filled=0;
    for (NSString* choice in appdelegate.choices){
      //for each choice
      if(filled==0){
        //need to just fill in first choice/weight
        newTF1.text=choice;
        weight1.text=[appdelegate.weights objectAtIndex:0];
        [self.choices addObject:newTF1];
        [self.weights addObject:weight1];


      }
      else if(filled==1){
        newTF2.text=choice;
        weight2.text=[appdelegate.weights objectAtIndex:1];
        [self.choices addObject:newTF2];
        [self.weights addObject:weight2];
      }
      else{
        //Create choice, weight fill them and add them to
        UITextView* newTF=[[UITextView alloc]initWithFrame:CGRectMake(6, [self.choices count]*113+10, 120, 80 )];
        newTF.font = [UIFont systemFontOfSize:15];
        newTF.autocorrectionType = UITextAutocorrectionTypeNo;
        newTF.keyboardType = UIKeyboardTypeDefault;
        newTF.returnKeyType = UIReturnKeyDone;
        newTF.delegate = self;
        newTF.text=[appdelegate.choices objectAtIndex:filled];
        [self.choiceView addSubview:newTF];
        
        
        UITextView* neww=[[UITextView alloc]initWithFrame:CGRectMake(165,[self.choices count]*113+30, 70, 35 )];
        neww.font = [UIFont systemFontOfSize:15];
        neww.autocorrectionType = UITextAutocorrectionTypeNo;
        neww.keyboardType = UIKeyboardTypeNumberPad;
        neww.returnKeyType = UIReturnKeyDone;
        neww.delegate = self;
        neww.text=[appdelegate.weights objectAtIndex:filled];
        
        
        [self.choiceView addSubview:neww];
        
        
        
        [self.choiceView setContentSize:CGSizeMake(self.choiceView.frame.size.width, self.choiceView.contentSize.height+113)];
        [self.addButton setFrame:CGRectMake(self.addButton.frame.origin.x, self.addButton.frame.origin.y+113, self.addButton.frame.size.width,self.addButton.frame.size.height)];
        [self.delButton setFrame:CGRectMake(self.delButton.frame.origin.x, self.delButton.frame.origin.y+113, self.delButton.frame.size.width,self.delButton.frame.size.height)];
        [self.choiceView setContentOffset:CGPointMake(0, self.choiceView.contentSize.height-280) animated:YES];
        [self.choices addObject:newTF];
        [self.weights addObject:neww];

      }
      
      
      filled++;
    }
     }
  
  if([appdelegate.choices count]<2){
  [self.choices addObject:newTF1];
  [self.weights addObject:weight1];
  [self.choices addObject:newTF2];
  [self.weights addObject:weight2];
  }
  
  [self.choiceView setContentSize:CGSizeMake(self.choiceView.frame.size.width, self.choiceView.contentSize.height+113)];
  [self.addButton setFrame:CGRectMake(self.addButton.frame.origin.x, self.addButton.frame.origin.y, self.addButton.frame.size.width,self.addButton.frame.size.height)];
  [self.delButton setFrame:CGRectMake(self.delButton.frame.origin.x, self.delButton.frame.origin.y, self.delButton.frame.size.width,self.delButton.frame.size.height)];



  NSLog(@"viewDidLoad The count is %lu", (unsigned long)[self.choices count]);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addChoice:(UIButton*)sender {
  [self.delButton setHidden:false];

  NSLog(@"addChoice. The count is %lu, weights %lu", (unsigned long)[self.choices count], (unsigned long)[self.weights count]);
  UITextView* newTF=[[UITextView alloc]initWithFrame:CGRectMake(6, [self.choices count]*113+10, 120, 80 )];
  newTF.font = [UIFont systemFontOfSize:15];
  newTF.autocorrectionType = UITextAutocorrectionTypeNo;
  newTF.keyboardType = UIKeyboardTypeDefault;
  newTF.returnKeyType = UIReturnKeyDone;
  newTF.delegate = self;
  [self.choiceView addSubview:newTF];
 
  
  UITextView* neww=[[UITextView alloc]initWithFrame:CGRectMake(165,[self.choices count]*113+30, 70, 35 )];
  neww.font = [UIFont systemFontOfSize:15];
  neww.autocorrectionType = UITextAutocorrectionTypeNo;
  neww.keyboardType = UIKeyboardTypeNumberPad;
  neww.returnKeyType = UIReturnKeyDone;
  neww.delegate = self;
  neww.text=@"1";

  
  [self.choiceView addSubview:neww];

  
  
  [self.choiceView setContentSize:CGSizeMake(self.choiceView.frame.size.width, self.choiceView.contentSize.height+113)];
  [self.addButton setFrame:CGRectMake(self.addButton.frame.origin.x, self.addButton.frame.origin.y+113, self.addButton.frame.size.width,self.addButton.frame.size.height)];
    [self.delButton setFrame:CGRectMake(self.delButton.frame.origin.x, self.delButton.frame.origin.y+113, self.delButton.frame.size.width,self.delButton.frame.size.height)];
  [self.choiceView setContentOffset:CGPointMake(0, self.choiceView.contentSize.height-280) animated:YES];
  [self.choices addObject:newTF];
  [self.weights addObject:neww];
  
}

- (IBAction)remChoice:(id)sender {
  
  if([choices count]>2){
  
  [[choices lastObject] removeFromSuperview];
  [choices removeLastObject];
  
  [[weights lastObject]removeFromSuperview];
  [weights removeLastObject];
  
  [self.choiceView setContentSize:CGSizeMake(self.choiceView.frame.size.width, self.choiceView.contentSize.height-113)];
  [self.addButton setFrame:CGRectMake(self.addButton.frame.origin.x, self.addButton.frame.origin.y-113, self.addButton.frame.size.width,self.addButton.frame.size.height)];
  
  [self.delButton setFrame:CGRectMake(self.delButton.frame.origin.x, self.delButton.frame.origin.y-113, self.delButton.frame.size.width,self.delButton.frame.size.height)];

  [self.choiceView setContentOffset:CGPointMake(0, self.choiceView.contentSize.height-280) animated:YES];
  }
  if ([choices count]==2){
    [self.delButton setHidden:true];
  }

}

- (IBAction)goHome:(id)sender {
  
  A4AppDelegate* appdelegate = (A4AppDelegate *)[UIApplication sharedApplication].delegate;
  appdelegate.choices=nil;
  appdelegate.choicetext=nil;
  appdelegate.weights=nil;
  appdelegate.results=nil;
  appdelegate.title=nil;
  [self performSegueWithIdentifier:@"goHome" sender:nil];

}
-(void)showErrorAlert:(NSString *)title andMessage: (NSString*)message {
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil];
  [alert show];
}
- (IBAction)decide:(id)sender {
  int i=0;
  for (i=0;i<[self.choices count];i++){
    if (([((UITextView*)[self.choices objectAtIndex:i]).text length]==0)){
      [self showErrorAlert:@"Error" andMessage:@"Blank Choice"];
      return;

      
    }


  }
  
  for (i=0;i<[self.weights count];i++){
    NSLog(@"Weights is %@",[self.weights objectAtIndex:i]);
    if (([((UITextView*)[self.weights objectAtIndex:i]).text length]==0)){
      [self showErrorAlert:@"Error" andMessage:@"Blank Weight"];
      return;
    }
    if (((UITextView*)[self.weights objectAtIndex:i]).text.intValue ==0){
                                                                            [self showErrorAlert:@"Error" andMessage:@"Weight values must be greater than zero"];
      return;
    }

                                                                            
  }
  
 A4AppDelegate* appdelegate = (A4AppDelegate *)[UIApplication sharedApplication].delegate;
  appdelegate.results=[[NSMutableArray alloc]init];
    //calculate the result
  for (i=0;i<[self.weights count];i++){

    float randomNum = ((float)rand() / RAND_MAX) * [((UITextView*)[self.weights objectAtIndex:i]).text intValue];
    //store the result
  
    [appdelegate.results addObject:[NSNumber numberWithFloat:randomNum]];

    
  
  }
  
  
//appdelegate.choicetext = [[NSMutableArray alloc] initWithArray:self.choices copyItems:YES];


  float high=0;
  int highest=0;
  for (i=0;i<[appdelegate.results count];i++){
    
    if ([[appdelegate.results objectAtIndex:i] floatValue] >high){
      
      highest=i;
      high=[[appdelegate.results objectAtIndex:i] floatValue];
    }
    
    NSLog(@"Out %f",[[appdelegate.results objectAtIndex:i] floatValue]);
  }
  
  //  for (i=0;i<[appdelegate.choicetext count];i++){
  
  
  //    NSLog(@"Text %@",((UITextView*)[appdelegate.choicetext objectAtIndex:i]).text);
  //  }
  
  NSLog(@"RESULT %@",[self.choices objectAtIndex:highest]);

  appdelegate.choicetext=((UITextView*)[self.choices objectAtIndex:highest  ]).text;
  appdelegate.choices= [[NSMutableArray alloc]init];
  appdelegate.weights= [[NSMutableArray alloc] init];
  appdelegate.title=self.decTitle.text;
  
  for (UITextView* tv in self.choices){
    
    [appdelegate.choices addObject:tv.text];
  }
  
  for (UITextView* wt in self.weights){
    
    [appdelegate.weights addObject:wt.text];
  }
  
 
  
  [self performSegueWithIdentifier:@"toSingleResult" sender:nil];

  
}
@end
