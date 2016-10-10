//
//  ViewController.h
//  GRCoreData
//
//  Created by Student P_03 on 09/10/16.
//  Copyright © 2016 Student P_03. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTableViewCell.h"
#import "addViewController.h"
#import "AppDelegate.h"


@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

    {
        NSMutableArray *TVArray;
        NSMutableArray *SmartPhoneArray;
        NSMutableArray *ACArray;
        
        UISegmentedControl *segmentControl;
    }

@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)segmentAction:(id)sender;

- (IBAction)addAction:(id)sender;
    



@end

