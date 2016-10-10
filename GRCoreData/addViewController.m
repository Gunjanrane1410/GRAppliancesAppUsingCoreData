//
//  addViewController.m
//  GRCoreData
//
//  Created by Student P_03 on 09/10/16.
//  Copyright © 2016 Student P_03. All rights reserved.
//

#import "addViewController.h"

@interface addViewController ()

@end

@implementation addViewController

-(NSManagedObjectContext *)managedObjectContext{
    NSManagedObjectContext *context =nil;
    id delegate = [[UIApplication sharedApplication ]delegate];
    if([delegate performSelector:@selector(managedObjectContext)]){
        context =[delegate managedObjectContext];
        
    }
    return  context;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    if(textField ==self.TextFieldOne){
        [self.textField2 becomeFirstResponder];
    }
    else if (textField ==self.textField2){
        [self.textFieldThree becomeFirstResponder];
    }
    return YES;
}


- (IBAction)saveAction:(id)sender {
        
    NSString *name = self.TextFieldOne.text;
    NSString *model = self.textField2.text;
    NSString *company = self.textFieldThree.text;
    
    
    
    if(segmentControl.selectedSegmentIndex == 0){
        if(name.length > 0){
            if(model.length > 0){
                if(company.length > 0){
                    
                    NSManagedObjectContext *context =[self managedObjectContext];
                    
                    NSManagedObject *newDevice =[NSEntityDescription insertNewObjectForEntityForName:@"TV" inManagedObjectContext:context];
                    
                    [newDevice setValue:name forKey:@"model"];
                    [newDevice setValue:model forKey:@"price"];
                    [newDevice setValue:company forKey:@"year"];
                    
                    NSError *error;
                    
                    if([context save:&error]){
                        NSLog(@"SAVED");
                        [self.navigationController popViewControllerAnimated:YES];
                    }
                    else{
                        
                        NSLog(@"unable to saved :%@",error.localizedDescription);
                    }
                }
            }
        }
    }
    else if (segmentControl.selectedSegmentIndex == 1) {
        
        
        if (name.length > 0){
            if(model.length > 0){
                if(company.length > 0){
                    NSManagedObjectContext *context =[self managedObjectContext];
                    
        NSManagedObject *newDevice =[NSEntityDescription insertNewObjectForEntityForName:@"SmartPhone" inManagedObjectContext:context];
                    
                    [newDevice setValue:name forKey:@"name"];
                    [newDevice setValue:model forKey:@"company"];
                    [newDevice setValue:company forKey:@"price"];
                    NSError *error;
                    
                    if([context save:&error]){
                        NSLog(@"SAVED");
                        [self.navigationController popViewControllerAnimated:YES];
                    }
                    
                    else{
                        
                        NSLog(@"unable to saved :%@",error.localizedDescription);
                    }
                }
            }
        }
    }
    else if (segmentControl.selectedSegmentIndex == 2){
        if (name.length > 0){
            if(model.length > 0){
                self.textFieldThree.hidden = YES;
                NSManagedObjectContext *context =[self managedObjectContext];
                
                NSManagedObject *newDevice =[NSEntityDescription insertNewObjectForEntityForName:@"AC" inManagedObjectContext:context];
                
                [newDevice setValue:name forKey:@"name"];
                [newDevice setValue:model forKey:@"price"];
                
                NSError *error;
                
                if([context save:&error]){
                    NSLog(@"SAVED");
                    [self.navigationController popViewControllerAnimated:YES];
                }
                else{
                    
                    NSLog(@"unable to saved :%@",error.localizedDescription);
                }
            }
        }
    }
}



- (IBAction)cancleAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];

}

- (IBAction)segmentAction:(id)sender {
    
    segmentControl = sender;
    NSInteger  i;
    switch (segmentControl.selectedSegmentIndex == i) {
        case 0:
            i=0;
            [self saveAction:sender];
            break;
        case 1:
            i=1;
            [self saveAction:sender];
            break;
        case 2:
            i=2;
            [self saveAction:sender];
            break;
        default:
            break;
    }
    

}



@end
