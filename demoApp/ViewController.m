//
//  ViewController.m
//  demoApp
//
//  Created by nathan byarley on 12/18/13.
//  Copyright (c) 2013 nathan byarley. All rights reserved.

//CLASS: AOC1
//TERM: 1312
//

#import "ViewController.h"

#define BUTTON_ZERO 0
#define BUTTON_ONE 1
#define BUTTON_TWO 2

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    //UserName Label
    userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0f, 25.0f, 85.0f, 20.0f)];
    //if username is nil do the following
    if (userNameLabel != nil)
    {
        userNameLabel.backgroundColor = [UIColor clearColor];
        userNameLabel.text = @"Username:";
        userNameLabel.textColor = [UIColor blackColor];
        
        //view username
        [self.view addSubview:userNameLabel];
    }
    
    //TextField
    textField = [[UITextField alloc] initWithFrame:CGRectMake(125.0f, 20.0f, 190.0f, 30.0f)];
    //conditional based on text field
    if (textField != nil)
    {
        //text field attributes
        textField.placeholder = @"Enter Name";
        textField.borderStyle = UITextBorderStyleRoundedRect;
        //view text field on screen
        [self.view addSubview:textField];
    }
    
    //Login Button
    loginButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    
    if (loginButton != nil)
    {
        //login button design and attributes
        loginButton.frame = CGRectMake(235.0f, 65.0f, 70.0f, 30.0f);
        [loginButton setTitle:@"Login" forState:UIControlStateNormal];
        
        //using the onclick event
        [loginButton addTarget:self action:@selector(onClick:) forControlEvents: UIControlEventTouchUpInside];
        
        //button zero tag
        loginButton.tag = BUTTON_ZERO;
        //view button on screen
        [self.view addSubview:loginButton];
    }
    
    //Enter UserName Field
    verifyLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 140.0f, 320.0f, 50.0f)];
    //if labe
    if (verifyLabel != nil)
    {
        verifyLabel.backgroundColor = [UIColor colorWithRed:0.633 green:0.292 blue:0.224 alpha:1];
        verifyLabel.textColor = [UIColor whiteColor];
        verifyLabel.text = @"Please Enter Your Username";
        verifyLabel.textAlignment = kCTRightTextAlignment;
        
        [self.view addSubview:verifyLabel];
    }
    
    // Date Button
    dateButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    if (dateButton != nil)
    {
        //dateButton attributes
        dateButton.frame = CGRectMake(15.0f, 235.0f, 105.00, 40.0f);
        [dateButton setTitle:@"Show Date" forState:UIControlStateNormal];
        [dateButton addTarget:self action:@selector(onClick:) forControlEvents: UIControlEventTouchUpInside];
        
        dateButton.tag = BUTTON_ONE;
        [self.view addSubview:dateButton];
    }
    // Info Button
    infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    
    if (infoButton != nil)
    {
        infoButton.frame = CGRectMake(15.0f, 320.0f, 20.0f, 20.0f);
        [infoButton addTarget:self action:@selector(onClick:) forControlEvents: UIControlEventTouchUpInside];
        
        infoButton.tag = BUTTON_TWO;
        [self.view addSubview:infoButton];
    }
    
    //Info Label
    infoButtonLabel = [[UILabel alloc] initWithFrame: CGRectMake(0.0f, 370.0f, 320.0f, 50.0f)];
    if (infoButtonLabel != nil)
    {
        //buttonLable attributes
        infoButtonLabel.backgroundColor = [UIColor clearColor];
        infoButtonLabel.textAlignment = kCTRightTextAlignment;
        infoButtonLabel.numberOfLines = 2;
        
        [self.view addSubview:infoButtonLabel];
    }
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

//onClick method
//determining the output based on the tage clicked.
- (void)onClick: (UIButton*)button
{
    //Date Button
    if (button.tag == BUTTON_ZERO)
    {
        NSString *userInput = [textField text];
        //check to verify there is data in the textfield
        if (userInput.length != 0)
        {
            //verify label attributes
            verifyLabel.backgroundColor = [UIColor colorWithRed:0.522 green:0.922 blue:0.416 alpha:1];
            verifyLabel.textColor = [UIColor colorWithRed:0.008 green:0.243 blue:0.004 alpha:1];
            
            NSString *userString = [[NSString alloc] initWithFormat: @"User: %@ has been logged in",userInput];
            verifyLabel.text = userString;
            verifyLabel.numberOfLines = 2;
            
        }
        //if there is no data in the text field do the following
        else
        {
            verifyLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
            verifyLabel.textColor = [UIColor colorWithRed:0.933 green:0.933 blue:0 alpha:1];
            verifyLabel.text = @"Please enter a Username";
        }
    }
    
    //Date Button
    if (button.tag == BUTTON_ONE)
    {
        // NSDate
        NSDate *date = [NSDate date];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        if (dateFormat != nil)
        {
            [dateFormat setDateStyle:NSDateFormatterLongStyle];
            [dateFormat setTimeStyle:NSDateFormatterFullStyle];
        }
        //format string based on date
        NSString *dateString = [dateFormat stringFromDate:date];
        
        // UIAlertView
        UIAlertView *dateAlert = [[UIAlertView alloc] initWithTitle:@"Date" message:dateString delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [dateAlert show];
    }
    
    // Info Button
    if (button.tag == BUTTON_TWO)
    {
        //information based on button tag
        infoButtonLabel.textColor = [UIColor blackColor];
        infoButtonLabel.text = @"This application was developed by: Nathan Byarley";
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
