//
//  ViewController.h
//  YIPickerActionSheetDemo
//
//  Created by Yasuhiro Inami on 12/03/27.
//  Copyright (c) 2012年 Yasuhiro Inami. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController <UIActionSheetDelegate, UIPickerViewDataSource, UIPickerViewDelegate>

- (IBAction)handleButton:(id)sender;

@end
