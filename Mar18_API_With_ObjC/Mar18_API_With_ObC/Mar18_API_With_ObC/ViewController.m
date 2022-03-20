//
//  ViewController.m
//  Mar18_API_With_ObC
//
//  Created by Consultant on 3/18/22.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *BreweryTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupConfiguration];
    
}

-(void) setupConfiguration {
    self.title = @"A List of Breweries";
}

// fetching data from brewery api
-(void) fetchBrewery {
    NSString *baseUrl = @"https://api.openbrewerydb.org/breweries";
    NSString *targetUrl = [NSString stringWithFormat:@"%@/init", baseUrl];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:targetUrl]];

    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:
      ^(NSData * _Nullable data,
        NSURLResponse * _Nullable response,
        NSError * _Nullable error) {

          NSString *myString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
          NSLog(@"Data received: %@", myString);
    }] resume];
}

-(UITableViewCell *)tableView: (UITableView *) tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = @"test";
    
    return cell;
}

@end
