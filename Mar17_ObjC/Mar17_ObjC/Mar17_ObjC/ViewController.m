//
//  ViewController.m
//  Mar17_ObjC
//
//  Created by Consultant on 3/17/22.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import <UIKit/UIKit.h>

/*
 * storyboard idenitifiers for first and second
 * view controllers
 */

NSString *firstVC = @"FirstVC";
NSString *secondVC = @"SecondVC";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupConfiguration];
}

-(void) setupConfiguration {
    self.title = @"Selected Country";
    self.ClickHereLabel.layer.cornerRadius = 20;
    self.ClickHereLabel.text = @"Click Here";
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickHereTapped:)];
    [self.ClickHereView addGestureRecognizer:tapGesture];
}

-(IBAction) clickHereTapped:(id)sender {
    SecondViewController *secondViewController = [self.storyboard instantiateViewControllerWithIdentifier:secondVC];
    
    // Delegation
    [secondViewController setDelegate:self];
    
    // Key Value Coding
    secondViewController.firstVC = self;
    
    // Block passing data back
    secondViewController.selectedCountry = ^(NSString *country) {
        self.ClickHereLabel.text = country;
    };
    
    [secondViewController getLastCountry:^(NSString *finalCountry) {
        
    }];
    
    [self.navigationController pushViewController:secondViewController animated:YES];
    
}

-(void) addCountry:(NSString *) countryName {
    [self.ClickHereLabel setText:countryName];
}



@end
