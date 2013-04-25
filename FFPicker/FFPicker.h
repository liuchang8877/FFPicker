//
//  FFPicker.h
//  FFPicker
//
//  Created by liu on 4/25/13.
//  Copyright (c) 2013 liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FFPicker : UIView<UIPickerViewDataSource,UIPickerViewDelegate>
{

    UIPickerView    *pickerView;
    UIToolbar       *picketToolbar;
    NSArray         *fillingTypes;
    int             selectedRow;
    UILabel         *statesLabel;
}

@property (nonatomic, retain)  UIPickerView *pickerView;
@property (nonatomic, retain)  UIToolbar *picketToolbar;
@property(nonatomic, retain) NSArray *fillingTypes;


// show the picker
- (void)showThePicker;

//hiden picker
- (void)hidenThePicker;
@end
