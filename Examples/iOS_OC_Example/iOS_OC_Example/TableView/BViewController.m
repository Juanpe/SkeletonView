//
//  BViewController.m
//  SkeletonView_Example
//
//  Created by lionsom on 2022/7/6.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

#import "BViewController.h"
#import "BTableViewCell.h"
#import "BTableViewCell_1.h"
@import SkeletonView;

@interface BViewController () <UITableViewDelegate, UITableViewDataSource, SkeletonTableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.tableView];
    
    //
    self.tableView.isSkeletonable = true;
    [self.tableView showAnimatedGradientSkeleton_OC];
    //
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView hideSkeleton_OC];
    });
}

#pragma mark - SkeletonTableViewDataSource

- (NSInteger)numSectionsIn:(UITableView *)collectionSkeletonView {
    return 1;
}

- (NSInteger)collectionSkeletonView:(UITableView *)skeletonView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (NSString *)collectionSkeletonView:(UITableView *)skeletonView cellIdentifierForRowAt:(NSIndexPath *)indexPath {
    return @"CellID_1";  // @"CellID"
}

- (UITableViewCell *)collectionSkeletonView:(UITableView *)skeletonView skeletonCellForRowAt:(NSIndexPath *)indexPath {
    // BTableViewCell *cell = (BTableViewCell *)[skeletonView dequeueReusableCellWithIdentifier:@"CellID" forIndexPath:indexPath];
    BTableViewCell_1 *cell = (BTableViewCell_1 *)[skeletonView dequeueReusableCellWithIdentifier:@"CellID_1" forIndexPath:indexPath];
    [cell P_showSkeleton];
    return cell;
}

- (void)collectionSkeletonView:(UITableView *)skeletonView prepareCellForSkeleton:(UITableViewCell *)cell at:(NSIndexPath *)indexPath {
    BTableViewCell_1 *newCell = (BTableViewCell_1 *)cell;
    if (indexPath.row == 0) {
        newCell.avatarIMV.layer.cornerRadius = 40;
        newCell.avatarIMV.layer.masksToBounds = YES;
    }
}

#pragma mark - UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    [cell P_hideSkeleton];
    return cell;
}

#pragma mark - Setter

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 100;
        [_tableView registerClass:BTableViewCell.class forCellReuseIdentifier:@"CellID"];
        [_tableView registerClass:BTableViewCell_1.class forCellReuseIdentifier:@"CellID_1"];
    }
    return _tableView;
}

@end
