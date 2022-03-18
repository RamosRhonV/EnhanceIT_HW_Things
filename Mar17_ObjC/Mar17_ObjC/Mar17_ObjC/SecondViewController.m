//
//  SecondViewController.m
//  Mar17_ObjC
//
//  Created by Consultant on 3/17/22.
//

#import "ViewController.h"
#import "SecondViewController.h"

NSString *selectedCountry = @"nationState";

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UITableView *CountryTableView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void) setupConfiguration {
    self.title = @"List of Countries";
}

/*
 * static list of countries array to populate tableview
 */

-(NSArray *) countriesList {
    NSArray *countriesList = [NSArray arrayWithObjects:@"Bingus", @"Floppa", @"Gakster", @"Scoogas", @"Plimpus",@"The United States of America", @"Skrunkly", @"Cate", nil];
    
    return countriesList;
}

/*
 * TableView methods: delegates set in storyboard
 */

-(NSInteger) tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.countriesList.count;
}

-(UITableViewCell *)tableView: (UITableView *) tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:selectedCountry forIndexPath:indexPath];
    
    cell.textLabel.text = [self.countriesList objectAtIndex:indexPath.row];
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:false];
    
    [self.navigationController popToRootViewControllerAnimated:true];
    
    // update the label
    // key value chain
    self.firstVC.ClickHereLabel.text = [self.countriesList objectAtIndex: indexPath.row];
    
    // Delegation
    [self.delegate addCountry:[self.countriesList objectAtIndex:indexPath.row]];
    
    // Block Closer
    self.selectedCountry([self.countriesList objectAtIndex:indexPath.row]);
    
    self.selectedCountry([self.countriesList objectAtIndex:indexPath.row]);
}

-(void) getLastCountry:(void (^)(NSString *))selectedCountry {
    selectedCountry(self.countriesList.lastObject);
}

@end
