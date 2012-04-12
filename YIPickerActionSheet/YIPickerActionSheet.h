//
//  YIPickerActionSheet.h
//  YIPickerActionSheet
//
//  Created by Yasuhiro Inami on 12/03/27.
//  Copyright (c) 2012年 Yasuhiro Inami. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface YIPickerActionSheet : UIActionSheet

@property (strong, nonatomic, readonly) UIToolbar* pickerToolbar;
@property (strong, nonatomic, readonly) UIPickerView* pickerView;

@end
