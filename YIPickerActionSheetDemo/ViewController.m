//
//  ViewController.m
//  YIPickerActionSheetDemo
//
//  Created by Yasuhiro Inami on 12/03/27.
//  Copyright (c) 2012年 Yasuhiro Inami. All rights reserved.
//

#import "ViewController.h"
#import "YIPickerActionSheet.h"


@interface ViewController ()

@end

@implementation ViewController
{
    NSArray* _categoryNames;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray* names = [NSMutableArray array];
    
    for (int i = 0; i < 100; i++) {
        [names addObject:[NSString stringWithFormat:@"Test%02d",i]];
    }
    _categoryNames = names;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (IBAction)handleButton:(id)sender 
{
    YIPickerActionSheet* sheet = [[YIPickerActionSheet alloc] init];
    sheet.delegate = self;
    sheet.pickerView.dataSource = self;
    sheet.pickerView.delegate = self;
    [sheet showInView:self.view];
}

#pragma mark -

#pragma mark UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView 
{
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component 
{
	if (component == 0) {
		return [_categoryNames count];
	}	
	return 0;
}

#pragma mark UIPickerViewDelegate

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component 
{
	return 50;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component 
{
	return 200;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component 
{
	return [_categoryNames objectAtIndex:row];
}

#pragma mark UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"this will not be called");
}

- (void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"will dismiss");
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"did dismiss");
}

@end
