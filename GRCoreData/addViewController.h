//
//  addViewController.h
//  GRCoreData
//
//  Created by Student P_03 on 09/10/16.
//  Copyright © 2016 Student P_03. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface addViewController : UIViewController<UITextFieldDelegate>

{
    
    UISegmentedControl *segmentControl;
}
@property (weak, nonatomic) IBOutlet UITextField *TextFieldOne;
@property (weak, nonatomic) IBOutlet UITextField *textField2;
@property (weak, nonatomic) IBOutlet UITextField *textFieldThree;

- (IBAction)saveAction:(id)sender;

- (IBAction)cancleAction:(id)sender;

- (IBAction)segmentAction:(id)sender;

@end
