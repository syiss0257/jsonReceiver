//
//  ViewController.h
//  jsonReceiver
//
//  Created by ohtake shingo on 2014/03/15.
//  Copyright (c) 2014年 ohtake shingo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebApiAccess.h"

@interface ViewController : UIViewController<WebAPIAccessDelegate>
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UITextView *consoleView;
- (IBAction)getBtn:(id)sender;

@end
