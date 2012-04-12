//
//  YIPickerActionSheet.m
//  YIPickerActionSheet
//
//  Created by Yasuhiro Inami on 12/03/27.
//  Copyright (c) 2012年 Yasuhiro Inami. All rights reserved.
//

#import "YIPickerActionSheet.h"


#pragma mark -

@interface YIPickerActionSheetToolbar : UIToolbar
@end


@implementation YIPickerActionSheetToolbar

- (void)drawRect:(CGRect)rect
{
    // do nothing
}

@end

#pragma mark -

@implementation YIPickerActionSheet

@synthesize pickerToolbar = _pickerToolbar;
@synthesize pickerView = _pickerView;

- (id)init
{
    self = [super init];
    if (self) {
        self.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
        
        // toolbar items
        UIBarButtonItem* flexibleItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem* closeItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(handleClose:)];
        
        // toolbar
        YIPickerActionSheetToolbar* toolbar = [[YIPickerActionSheetToolbar alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 44)];
//        toolbar.tintColor = [UIColor blackColor];
        toolbar.translucent = YES;
        toolbar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        toolbar.items = [NSArray arrayWithObjects:flexibleItem,closeItem,nil];
        [self addSubview:toolbar];
        
        _pickerToolbar = toolbar;
        
        // pickerView
        _pickerView = [[UIPickerView alloc] init];
        _pickerView.dataSource = nil;
        _pickerView.delegate = nil;
        _pickerView.showsSelectionIndicator = YES;
        [self addSubview:_pickerView];
        
        // actionSheet adjustment
        _pickerView.frame = CGRectMake(_pickerView.frame.origin.x,
                                       _pickerView.frame.origin.y+_pickerToolbar.frame.size.height,
                                       _pickerView.frame.size.width,
                                       _pickerView.frame.size.height);
    }
    return self;
}

- (void)_adjustFrame
{
    self.frame = CGRectMake(0, 
                            self.superview.frame.size.height-(_pickerView.frame.size.height+_pickerToolbar.frame.size.height), 
                            self.superview.frame.size.width, 
                            _pickerView.frame.size.height+_pickerToolbar.frame.size.height);
}

- (void)showInView:(UIView *)view
{
    [super showInView:view];
    
    [self _adjustFrame];
}

-(void)showFromToolbar:(UIToolbar *)view
{
    [super showFromToolbar:view];
    
    [self _adjustFrame];
}

- (void)showFromTabBar:(UITabBar *)view
{
    [super showFromTabBar:view];
    
    [self _adjustFrame];
}

#pragma mark 

#pragma mark UIControl

- (void)handleClose:(id)sender
{
    [self dismissWithClickedButtonIndex:0 animated:YES];
}

@end
