//
//  CViewController.m
//  SkeletonView_Example
//
//  Created by lionsom on 2022/7/7.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

#import "CViewController.h"
#import "CCollectionViewCell.h"
#import "CCollectionHeaderView.h"
#import "CCollectionViewCell_1.h"
#import "CCollectionHeaderView_1.h"
@import SkeletonView;

@interface CViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, SkeletonCollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation CViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self.view addSubview:self.collectionView];
    
    self.collectionView.isSkeletonable = YES;
    [self.collectionView showAnimatedGradientSkeleton_OC];
    //
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.collectionView hideSkeleton_OC];
    });
}

#pragma mark - SkeletonCollectionViewDataSource

- (NSInteger)numSectionsIn:(UICollectionView *)collectionSkeletonView {
    return 3;
}

- (NSInteger)collectionSkeletonView:(UICollectionView *)skeletonView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (NSString *)collectionSkeletonView:(UICollectionView *)skeletonView cellIdentifierForItemAt:(NSIndexPath *)indexPath {
    return @"CellID_1";
}

- (NSString *)collectionSkeletonView:(UICollectionView *)skeletonView supplementaryViewIdentifierOfKind:(NSString *)supplementaryViewIdentifierOfKind at:(NSIndexPath *)indexPath {
    return @"HeaderID_1";
}

- (UICollectionViewCell *)collectionSkeletonView:(UICollectionView *)skeletonView skeletonCellForItemAt:(NSIndexPath *)indexPath {
    CCollectionViewCell_1 *cell = (CCollectionViewCell_1 *)[skeletonView dequeueReusableCellWithReuseIdentifier:@"CellID_1" forIndexPath:indexPath];
    [cell P_showSkeleton];
    return cell;
}

- (void)collectionSkeletonView:(UICollectionView *)skeletonView prepareCellForSkeleton:(UICollectionViewCell *)cell at:(NSIndexPath *)indexPath {
    CCollectionViewCell_1 *newCell = (CCollectionViewCell_1 *)cell;
    if (indexPath.section == 0) {
        newCell.layer.cornerRadius = 15;
        newCell.layer.masksToBounds = YES;
    } else if (indexPath.section == 1) {
        newCell.avatarIMV.layer.cornerRadius = 15;
        newCell.avatarIMV.layer.masksToBounds = YES;
    }
}

- (void)collectionSkeletonView:(UICollectionView *)skeletonView prepareViewForSkeleton:(UICollectionReusableView *)view at:(NSIndexPath *)indexPath {
    
}

#pragma mark - UICollectionView Delegate DataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 5;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellID" forIndexPath:indexPath];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        CCollectionHeaderView *header = (CCollectionHeaderView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderID"  forIndexPath:indexPath];
        [header P_updateTitle:[NSString stringWithFormat:@"标题：%ld", (long)indexPath.section]];
        return header;
    }
    return [[UICollectionReusableView alloc] init];
}

#pragma mark - Layout Delegate

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(self.view.frame.size.width, 50);
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        layout.itemSize = CGSizeMake(100, 40);
        layout.minimumInteritemSpacing = 20;
        layout.minimumLineSpacing = 10;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerClass:CCollectionViewCell.class forCellWithReuseIdentifier:@"CellID"];
        [_collectionView registerClass:CCollectionViewCell_1.class forCellWithReuseIdentifier:@"CellID_1"];
        [_collectionView registerClass:CCollectionHeaderView.class forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderID"];
        [_collectionView registerClass:CCollectionHeaderView_1.class forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderID_1"];
    }
    return _collectionView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
