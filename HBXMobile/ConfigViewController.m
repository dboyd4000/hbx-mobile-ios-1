//
//  ConfigViewController.m
//  HBXMobile
//
//  Created by David Boyd on 6/10/16.
//  Copyright © 2016 David Boyd. All rights reserved.
//

#import "ConfigViewController.h"

#define USE_ENROLL      1001
#define USE_MOBILE      1002
#define USE_GIT         1003

@interface ConfigViewController ()

@end

@implementation ConfigViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        self.navigationController.navigationBarHidden = NO;
    self.view.backgroundColor = [UIColor colorWithRed:(141/255.0) green:(180/255.0) blue:(212/255.0) alpha:1.0];

    configTableNames = [[NSMutableArray alloc] initWithObjects: @"Use Enroll Database Server", @"Use Notification Server", @"Use Github", nil];
    
    configTable.frame = CGRectMake(20, self.view.frame.origin.y, self.view.frame.size.width - 40, self.view.frame.size.height); //screenBound.origin.y + screenSize.height - 290); //  myTabBar.frame.origin.y-90);
    
    configTable.backgroundColor = [UIColor clearColor];
    configTable.backgroundView = nil;
    
    if (!expandedRow)
        expandedRow = [[NSMutableIndexSet alloc] init];
    if (!expandedCell)
        expandedCell = [[NSMutableIndexSet alloc] init];
/*
    NSLog(@"==>ConfigView:   %@  -  %@", [[NSUserDefaults standardUserDefaults] stringForKey:@"serverAddress"], [[NSUserDefaults standardUserDefaults] integerForKey:@"whichServer"]);
 */   
    switch([[NSUserDefaults standardUserDefaults] integerForKey:@"whichServer"])
    {
        case USE_ENROLL:
        {
            [configTableNames insertObject:@"Enroll server" atIndex:1];
            [expandedRow addIndex:0];
            [expandedCell addIndex:1];
            eUseWhichServer = USE_ENROLL;
            
     //       NSIndexPath *item = [NSIndexPath indexPathForRow:0 inSection: 0];
     //       UITableViewCell* cell = [configTable cellForRowAtIndexPath:item];
            checkedIndexPath = [NSIndexPath indexPathForRow:0 inSection: 0];;
            
        }
            break;
        case USE_MOBILE:
        {
            [configTableNames insertObject:@"Mobile server" atIndex:2];
            [expandedRow addIndex:1];
            [expandedCell addIndex:2];
            eUseWhichServer = USE_MOBILE;
     //       NSIndexPath *item = [NSIndexPath indexPathForRow:1 inSection: 0];
     //       UITableViewCell* cell = [configTable cellForRowAtIndexPath:item];
            checkedIndexPath = [NSIndexPath indexPathForRow:1 inSection: 0];;

        }
            break;
        case USE_GIT:
        default:
        {
            NSIndexPath *selectedIndexPath = [NSIndexPath indexPathForRow:2 inSection: 0];
            UITableViewCell* cell = [configTable cellForRowAtIndexPath:selectedIndexPath];
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            checkedIndexPath = selectedIndexPath;
            eUseWhichServer = USE_GIT;
            [expandedRow addIndex:2];
        }
            break;
    }


//    [[NSUserDefaults standardUserDefaults] setInteger:eUseWhichServer forKey:@"whichServer"];
//    [[NSUserDefaults standardUserDefaults] setValue:textServer.text forKey:@"serverAddress"];

/*
    UILabel* lblUseEnroll = [[UILabel alloc] initWithFrame:CGRectMake(100, 100,200,40)];
    lblUseEnroll.textAlignment = NSTextAlignmentLeft;
    lblUseEnroll.font = [UIFont systemFontOfSize:14];
    lblUseEnroll.text = @"Use Enroll Database?";
    [self.view addSubview:lblUseEnroll];
    
    UISwitch *switchview = [[UISwitch alloc] initWithFrame:CGRectMake(280, 100, 100, 40)];
    [switchview addTarget: self action: @selector(flip:) forControlEvents:UIControlEventValueChanged];
    switchview.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"useEnrollDB"];
    
    [self.view addSubview:switchview];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(100, 400, 200, 40);
    btn.backgroundColor = [UIColor redColor];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.layer.cornerRadius = 10; // this value vary as per your desire
    btn.clipsToBounds = YES;

    [btn setTitle:@"Save and Exit" forState:UIControlStateNormal];
    
    UILabel* lblEnrollServer = [[UILabel alloc] initWithFrame:CGRectMake(100, 145, 200, 50)];
    lblEnrollServer.textAlignment = NSTextAlignmentLeft;
    lblEnrollServer.font = [UIFont systemFontOfSize:14];
    lblEnrollServer.numberOfLines = 0;
    lblEnrollServer.lineBreakMode = NSLineBreakByWordWrapping;
    lblEnrollServer.text = @"Enter network address and port for enroll database server";
    [self.view addSubview:lblEnrollServer];

    UITextField* txtAddress = [[UITextField alloc] initWithFrame:CGRectMake(100,200,200,40)];
    txtAddress.borderStyle = UITextBorderStyleRoundedRect;
    txtAddress.font = [UIFont systemFontOfSize:14];
    txtAddress.placeholder = @"enter network address";
    txtAddress.autocorrectionType = UITextAutocorrectionTypeNo;
    txtAddress.keyboardType = UIKeyboardTypeDefault;
    txtAddress.returnKeyType = UIReturnKeyDone;
    txtAddress.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtAddress.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtAddress.delegate = self;
    txtAddress.enabled = FALSE;
    txtAddress.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:txtAddress];
    
    
    UITextField* txtPort = [[UITextField alloc] initWithFrame:CGRectMake(100,250,200,40)];
    txtPort.borderStyle = UITextBorderStyleRoundedRect;
    txtPort.font = [UIFont systemFontOfSize:14];
    txtPort.placeholder = @"enter port number";
    txtPort.autocorrectionType = UITextAutocorrectionTypeNo;
    txtPort.keyboardType = UIKeyboardTypeDefault;
    txtPort.returnKeyType = UIReturnKeyDone;
    txtPort.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtPort.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtPort.delegate = self;
    txtPort.enabled = FALSE;
    txtPort.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:txtPort];
    
    [btn addTarget:self action:@selector(saveAndExit:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
*/
}
- (void)viewDidAppear:(BOOL)animated {
    
}

- (void)viewWillDisappear:(BOOL)animated {
    NSIndexPath *item = [NSIndexPath indexPathForRow:checkedIndexPath.row+1 inSection: 0];
    UITableViewCell* cell = [configTable cellForRowAtIndexPath:item];
    
    UITextField *textServer = (UITextField *)[cell.contentView viewWithTag:50];
    
    NSLog(@"%@  -  %@  -  %i", [configTableNames objectAtIndex:checkedIndexPath.row], textServer.text, eUseWhichServer);
    [[NSUserDefaults standardUserDefaults] setValue:[NSString stringWithFormat:@"%i", eUseWhichServer] forKey:@"whichServer"];
    if (eUseWhichServer == USE_ENROLL)
        [[NSUserDefaults standardUserDefaults] setValue:textServer.text forKey:@"enrollServer"];
    if (eUseWhichServer == USE_MOBILE)
        [[NSUserDefaults standardUserDefaults] setValue:textServer.text forKey:@"mobileServer"];
}

-(void)saveAndExit:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)flip:(id)sender {
    UISwitch *onoff = (UISwitch *)sender;
    
    [[NSUserDefaults standardUserDefaults] setBool:onoff.isOn forKey:@"useEnrollDB"];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        /*
        if ([expandedRow containsIndex:section])
        {
            return [configTableNames count]+1;
        }
*/
        return [configTableNames count];
    }
    
    return 1;
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
//    if (theTextField == self.playerNameField) {
        [theTextField resignFirstResponder];
//    }
    [self.navigationController popViewControllerAnimated:YES];
    return YES;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:simpleTableIdentifier];
        
        if ([expandedCell containsIndex:indexPath.row])
        {
            [cell setIndentationLevel:1];
            UITextField* txtAddress = [[UITextField alloc] initWithFrame:CGRectMake(tableView.frame.size.width - 170, 2, 170, 40)];
            txtAddress.borderStyle = UITextBorderStyleRoundedRect;
            txtAddress.font = [UIFont systemFontOfSize:14];
            txtAddress.placeholder = @"enter network address";
            txtAddress.autocorrectionType = UITextAutocorrectionTypeNo;
            txtAddress.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
            txtAddress.returnKeyType = UIReturnKeyDone;
            txtAddress.clearButtonMode = UITextFieldViewModeWhileEditing;
            txtAddress.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
            txtAddress.delegate = self;
            txtAddress.enabled = TRUE;
            txtAddress.tag = 50;
            txtAddress.textAlignment = NSTextAlignmentRight;
            if (eUseWhichServer == USE_ENROLL)
                txtAddress.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"enrollServer"];
            else
                txtAddress.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"mobileServer"];
            
            txtAddress.textColor = [UIColor darkGrayColor];
            
            [cell.contentView addSubview:txtAddress];
            
        }

    }
    
 //   cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.font = [UIFont fontWithName:@"Roboto-Regular" size:14];
    cell.textLabel.textColor = [UIColor darkGrayColor];

    if (indexPath.section == 0)
    {
        if ([expandedRow containsIndex:indexPath.row] )
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        else
            cell.accessoryType = UITableViewCellAccessoryNone;
        
        cell.textLabel.text = [configTableNames objectAtIndex:indexPath.row];
    }
    else
    {
        cell.backgroundColor = [UIColor redColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([expandedCell containsIndex:indexPath.row] || [expandedRow containsIndex:indexPath.row])
        return;
    // Uncheck the previous checked row
    [expandedRow removeAllIndexes];
    if(checkedIndexPath && indexPath.section == 0)
    {
        UITableViewCell* uncheckCell = [tableView
                                        cellForRowAtIndexPath:checkedIndexPath];
        uncheckCell.accessoryType = UITableViewCellAccessoryNone;
        [expandedRow removeIndex:checkedIndexPath.row];
        
        NSMutableArray *tmpArray = [NSMutableArray array];
        
        [expandedCell enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop)
        {
            NSIndexPath *item = [NSIndexPath indexPathForRow:idx inSection: 0];
                [tmpArray addObject:item];
                [configTableNames removeObjectAtIndex:item.row];
             }];

        [tableView deleteRowsAtIndexPaths:tmpArray
                         withRowAnimation:UITableViewRowAnimationBottom];

        [expandedCell removeAllIndexes];

    }

    if ( indexPath.section == 0 )
    {
        indexPath = [tableView indexPathForSelectedRow];
        if (![[configTableNames objectAtIndex:indexPath.row] isEqualToString:@"Use Github"])
        {
   //         int uu = selectedIndexPath.row;
            [expandedRow addIndex:indexPath.row];

            NSIndexPath *tmpIndexPath = [NSIndexPath indexPathForRow:indexPath.row + 1
                                                            inSection:indexPath.section];
            NSMutableArray *tmpArray = [NSMutableArray array];
            [tmpArray addObject:tmpIndexPath];
            
            [expandedCell addIndex:tmpIndexPath.row];
            
            if ([[configTableNames objectAtIndex:indexPath.row] isEqualToString:@"Use Enroll Database Server"])
            {
                [configTableNames insertObject:@"Enroll server" atIndex:indexPath.row + 1];
                eUseWhichServer = USE_ENROLL;
            }
            else
            {
                [configTableNames insertObject:@"Mobile server" atIndex:indexPath.row + 1];
                eUseWhichServer = USE_MOBILE;
            }
            
            [tableView beginUpdates];
            [tableView insertRowsAtIndexPaths:tmpArray withRowAnimation:UITableViewRowAnimationTop];
            [tableView endUpdates];
        }
        else
            eUseWhichServer = USE_GIT;
   
        NSIndexPath *selectedIndexPath = [tableView indexPathForSelectedRow];
        UITableViewCell* cell = [tableView cellForRowAtIndexPath:selectedIndexPath];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        checkedIndexPath = selectedIndexPath;
    
    }
    
    if ( indexPath.section == 1 )
    {
 //       [[NSUserDefaults standardUserDefaults] setBool:TRUE forKey:@"useEnrollDB"];
        [expandedCell enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop)
         {
             NSIndexPath *item = [NSIndexPath indexPathForRow:idx inSection: 0];
             NSLog(@"%@", [configTableNames objectAtIndex:item.row]);
  //           [tmpArray addObject:item];
 //            [configTableNames removeObjectAtIndex:item.row];
         }];

    }
}
@end