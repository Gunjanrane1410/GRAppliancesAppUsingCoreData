//
//  ViewController.m
//  GRCoreData
//
//  Created by Student P_03 on 09/10/16.
//  Copyright © 2016 Student P_03. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
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
    // Do any additional setup after loading the view, typically from a nib.
    TVArray =[[NSMutableArray alloc]init];
    SmartPhoneArray=[[NSMutableArray alloc]init];
    ACArray=[[NSMutableArray alloc]init];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
    
}
-(void)viewDidAppear:(BOOL)animated
{
    [self fetchDeviceFromCoreData];
}


-(void)fetchDeviceFromCoreData{
    NSManagedObjectContext *context =[self managedObjectContext];
    
    if(segmentControl.selectedSegmentIndex ==0){
        
        NSFetchRequest *fetchRequest =[[NSFetchRequest alloc]initWithEntityName:@"TV"];
        
        NSError *error;
        TVArray=[[context executeFetchRequest:fetchRequest error:&error]mutableCopy];
        
        if (error) {
            NSLog(@"%@",error.localizedDescription);
        }
        else {
            [self.tableView reloadData];
        }
    }
    
    else if (segmentControl.selectedSegmentIndex ==1){
        NSFetchRequest *fetchRequest =[[NSFetchRequest alloc]initWithEntityName:@"SmartPhone"];
        
        NSError *error;
        SmartPhoneArray=[[context executeFetchRequest:fetchRequest error:&error]mutableCopy];
        
        if (error) {
            NSLog(@"%@",error.localizedDescription);
        }
        else {
            [self.tableView reloadData];
        }
        
    }
    else if (segmentControl.selectedSegmentIndex){
        NSFetchRequest *fetchRequest =[[NSFetchRequest alloc]initWithEntityName:@"AC"];
        
        NSError *error;
        ACArray=[[context executeFetchRequest:fetchRequest error:&error]mutableCopy];
        
        if (error) {
            NSLog(@"%@",error.localizedDescription);
        }
        else {
            [self.tableView reloadData];
        }
        
    }
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if(segmentControl.selectedSegmentIndex==0){
        return TVArray.count;
    }
    else if (segmentControl.selectedSegmentIndex==1){
        return SmartPhoneArray.count;
    }
    else if (segmentControl.selectedSegmentIndex==2){
        return ACArray.count;
    }
    return 0;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    CustomTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"device_cell"];
    
    {
        if(segmentControl.selectedSegmentIndex == 0 ){
            NSManagedObject *tv =[TVArray objectAtIndex:indexPath.row];
            
            cell.firstLable.text=[tv valueForKey:@"model"];
            cell.secondLable.text=[tv valueForKey:@"price"];
            cell.thirdLable.text=[tv valueForKey:@"year"];
            
        }
        else if(segmentControl.selectedSegmentIndex == 1){
            
            NSManagedObject *smartPhone =[SmartPhoneArray objectAtIndex:indexPath.row];
            
            cell.firstLable.text=[smartPhone valueForKey:@"name"];
            cell.secondLable.text=[smartPhone valueForKey:@"company"];
            cell.thirdLable.text=[smartPhone valueForKey:@"price"];
            
            
        }
        else if(segmentControl.selectedSegmentIndex == 2){
            NSManagedObject *AC =[ACArray objectAtIndex:indexPath.row];
            
            cell.firstLable.text=[AC valueForKey:@"name"];
            cell.secondLable.text=[AC valueForKey:@"price"];
            
        }
    }
    
    return cell;

}


-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


- (IBAction)segmentAction:(id)sender {
    
    segmentControl= sender;
    NSInteger i;
    switch (segmentControl.selectedSegmentIndex == i) {
        case 0:
            i=0;
            [self.tableView reloadData];
            break;
        case 1:
            i=1;
            [self.tableView reloadData];
            break;
        case 2:
            i=2;
            [self.tableView reloadData];
        default:
            break;
    }

}

- (IBAction)addAction:(id)sender {
    
    addViewController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"addViewController"];
    [self.navigationController pushViewController:view animated:YES];

}
@end
