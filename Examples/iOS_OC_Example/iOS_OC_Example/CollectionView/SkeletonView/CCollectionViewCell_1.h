//
//  CCollectionViewCell_1.h
//  SkeletonView_Example
//
//  Created by lionsom on 2022/7/7.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CCollectionViewCell_1 : UICollectionViewCell

@property (nonatomic, strong) UIImageView *avatarIMV;

- (void)P_showSkeleton;

- (void)P_hideSkeleton;

@end

NS_ASSUME_NONNULL_END
