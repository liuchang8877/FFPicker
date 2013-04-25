//
//  FFPicker.m
//  FFPicker
//
//  Created by liu on 4/25/13.
//  Copyright (c) 2013 liu. All rights reserved.
//

#import "FFPicker.h"

@implementation FFPicker
@synthesize picketToolbar;
@synthesize pickerView;
@synthesize fillingTypes;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self initThePicker];
    }
    return self;
}

#pragma mark -
#pragma mark init the picker
- (void) initThePicker
{
    
    pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0.0, 600, 320.0, 0.0)];

    pickerView.showsSelectionIndicator = YES;
    pickerView.delegate = self;
    pickerView.dataSource = self;
    
    [self addSubview:pickerView];
    //clear the background color
    self.backgroundColor = [UIColor clearColor];
    
    //the data for the picker
    [self initTheData];
    //the tool bar
    [self initTheToolBar];
    //the button
    [self initTheButton];
    //the label
    [self initTheLabel];
}

//init the tool bar for picker
- (void)initTheToolBar
{
    picketToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 656, 320, 44)];
    picketToolbar.barStyle = UIBarStyleBlackTranslucent;
    
    [self addSubview:picketToolbar];

}

//init the button on the tool bar for the picker
- (void)initTheButton
{
    UIButton *myButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    myButton.frame = CGRectMake(230, 5, 60, 35);
    myButton.backgroundColor = [UIColor clearColor];
    [myButton setTitle:@"确定" forState:UIControlStateNormal];
    myButton.titleLabel.font = [UIFont fontWithName:@"helvetica" size:18];
    //[ButtonCircle setBackgroundImage:[UIImage imageNamed:@"28.png"] forState:UIControlStateNormal];
    //[self.view addSubview:ButtonCircle];
    [myButton addTarget:self action:@selector(pickerButtonTouchIn) forControlEvents:UIControlEventTouchDown];
    [picketToolbar addSubview: myButton];
}

//init the label
- (void)initTheLabel
{
    statesLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 140, 40)];
    [statesLabel setBackgroundColor:[UIColor clearColor]];
    [statesLabel setTextColor:[UIColor grayColor]];
    [statesLabel setTextAlignment:NSTextAlignmentLeft];
    [statesLabel setFont:[UIFont fontWithName:@"Arial" size:26]];
    statesLabel.numberOfLines = 2;
    
    [statesLabel setText:@"---"];
    [picketToolbar addSubview: statesLabel];
}

//init the data for the picker
- (void) initTheData
{
    NSMutableArray *fillingArray = [[NSMutableArray alloc] initWithCapacity:5];
    
    for (int i = 0; i < 24; i++)
    {
        NSString *timeH = [NSString stringWithFormat:@"%d:00",i];
        [fillingArray addObject:timeH];
    }
    
    self.fillingTypes = [NSArray arrayWithArray:fillingArray];
}

#pragma mark -
#pragma mark picker Action
- (void)startPickerAction
{
    NSLog(@"startPickerAction");
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.6];
    [self exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    pickerView.frame = CGRectMake(0.0, 200, 320.0, 0.0);
    [UIView setAnimationDelegate:self];
    //[UIView setAnimationDidStopSelector:@selector(animationFinished)];
    [UIView commitAnimations];
    
}

- (void)startPickerToolBarAction
{
    NSLog(@"startPickerToolBarAction");
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.6];
    [self exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    picketToolbar.frame = CGRectMake(0, 156, 320, 44);
    [UIView setAnimationDelegate:self];
    //[UIView setAnimationDidStopSelector:@selector(animationFinished)];
    [UIView commitAnimations];
}

- (void)endPickerAction
{
    NSLog(@"startPickerAction");
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.6];
    [self exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    pickerView.frame = CGRectMake(0.0, 600, 320.0, 0.0);
    [UIView setAnimationDelegate:self];
    //[UIView setAnimationDidStopSelector:@selector(animationFinished)];
    [UIView commitAnimations];
    
}

- (void)endPickerToolBarAction
{
    NSLog(@"startPickerToolBarAction");
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.6];
    [self exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    picketToolbar.frame = CGRectMake(0, 656, 320, 44);
    [UIView setAnimationDelegate:self];
    //[UIView setAnimationDidStopSelector:@selector(animationFinished)];
    [UIView commitAnimations];
}

#pragma mark -
#pragma mark did show the picker action
//show picker
- (void)showThePicker
{
    [self startPickerAction];
    [self startPickerToolBarAction];

}
//hiden picker
- (void)hidenThePicker
{
    [self endPickerAction];
    [self endPickerToolBarAction];
}

#pragma mark -
#pragma mark Button Action
- (void)pickerButtonTouchIn
{
    NSLog(@"pickerButtonTouchIn---%@",[fillingTypes objectAtIndex:selectedRow]);
    statesLabel.text = [fillingTypes objectAtIndex:selectedRow];
    
}

#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{

    return [self.fillingTypes count];
}

#pragma mark Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{

    return [self.fillingTypes objectAtIndex:row];
    
}

#pragma  mark picker selected
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{

        NSLog(@"didSelectRow:%d",row);
        selectedRow = row;
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
