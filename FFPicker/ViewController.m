//
//  ViewController.m
//  FFPicker
//
//  Created by liu on 4/25/13.
//  Copyright (c) 2013 liu. All rights reserved.
//

#import "ViewController.h"
#import "FFPicker.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self initThePickerAndLabel];
    
    [self initTheButton];
    
    [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"showOrNot"];
}

// init the FFPicker
- (void)initThePickerAndLabel
{
    UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 50, 250, 150)];
    myLabel.text = @"FFPicker";
    myLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:28];
    myLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:myLabel];
    
    myPicker = [[FFPicker alloc] init];
    myPicker.frame = CGRectMake(0, 0, 400, 400);
    [self.view addSubview:myPicker];
    
}

//init the button
- (void)initTheButton
{
    UIButton *myButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    myButton.frame = CGRectMake(60, 415, 200, 45);
    myButton.backgroundColor = [UIColor clearColor];
    [myButton setTitle:@"SHOW_HIDE" forState:UIControlStateNormal];
    myButton.titleLabel.font = [UIFont fontWithName:@"helvetica" size:18];
    //[ButtonCircle setBackgroundImage:[UIImage imageNamed:@"28.png"] forState:UIControlStateNormal];
    //[self.view addSubview:ButtonCircle];
    [myButton addTarget:self action:@selector(buttonTouchIn) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview: myButton];
}

//button action
- (void)buttonTouchIn
{

    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"showOrNot"]) {
        
        [myPicker showThePicker];
        [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"showOrNot"];
    } else {
        
        [myPicker hidenThePicker];
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"showOrNot"];
    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
