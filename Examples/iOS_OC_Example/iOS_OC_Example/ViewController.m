//
//  ViewController.m
//  iOS_OC_Example
//
//  Created by lionsom on 2022/9/1.
//

#import "ViewController.h"
#import "AViewController.h"
#import "BViewController.h"
#import "CViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)oneClick:(id)sender {
    AViewController *A = [[AViewController alloc] init];
    [self presentViewController:A animated:YES completion:nil];
}

- (IBAction)twoClick:(id)sender {
    BViewController *B = [[BViewController alloc] init];
    [self presentViewController:B animated:YES completion:nil];
}

- (IBAction)threeClick:(id)sender {
    CViewController *C = [[CViewController alloc] init];
    [self presentViewController:C animated:YES completion:nil];
}

@end
