//
//  SecondViewController.h
//  Mar17_ObjC
//
//  Created by Consultant on 3/17/22.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@protocol AddCountryDelegate <NSObject>

-(void)addCountry: (NSString *) countryName;

@end

@interface SecondViewController : UIViewController

@property (nonatomic, weak) id <AddCountryDelegate> delegate;

@property (nonatomic, weak) ViewController *firstVC;

@property (nonatomic, copy) void (^selectedCountry)(NSString *);

-(void) getLastCountry: (void(^)(NSString *)) selectedCountry;

@end

