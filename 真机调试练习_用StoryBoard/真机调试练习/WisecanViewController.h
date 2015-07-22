//
//  WisecanViewController.h
//  真机调试练习
//
//  Created by wisecan on 13-12-9.
//  Copyright (c) 2013年 wisecan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WisecanViewController : UIViewController<UITextFieldDelegate,UIWebViewDelegate,UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *testLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *blueBallBtns;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
- (IBAction)downloadImg:(id)sender;

- (IBAction)textFieldend:(id)sender;
@end
