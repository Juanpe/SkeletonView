//
//  CCollectionViewCell_1.m
//  SkeletonView_Example
//
//  Created by lionsom on 2022/7/7.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

#import "CCollectionViewCell_1.h"
@import SkeletonView;

@interface CCollectionViewCell_1()

@property (nonatomic, strong) UILabel *nameLB;

@end

@implementation CCollectionViewCell_1


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self p_createView];
    }
    return self;
}

- (void)p_createView {
    self.contentView.backgroundColor = UIColor.lightGrayColor;
    //
    [self.contentView addSubview:self.avatarIMV];
    [self.contentView addSubview:self.nameLB];
    //
    self.avatarIMV.frame = CGRectMake(5, 5, 30, 30);
    self.nameLB.frame = CGRectMake(40, 5, 55, 30);
}


- (void)P_showSkeleton {
    self.avatarIMV.isSkeletonable = true;
    self.nameLB.isSkeletonable = true;
    
    // 定制
    [self.nameLB skeletonTextLineHeight_OCWithType:12];   // 行高
    [self.nameLB skeletonTextNumberOfLines_OCWithType:2]; // 行数
    self.nameLB.lastLineFillPercent = 50;  // 最后一行长度占比
    self.nameLB.linesCornerRadius = 3;     // 圆角
    self.nameLB.skeletonLineSpacing = 6;  // 行间距
    
    [self.avatarIMV showAnimatedGradientSkeleton_OC];
    [self.nameLB showAnimatedGradientSkeleton_OC];
}

- (void)P_hideSkeleton {
    [self.contentView hideSkeleton_OC];
}

- (UIImageView *)avatarIMV {
    if (!_avatarIMV) {
        _avatarIMV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user_photo"]];
        _avatarIMV.backgroundColor = UIColor.clearColor;
    }
    return _avatarIMV;
}

- (UILabel *)nameLB {
    if (!_nameLB) {
        _nameLB = [[UILabel alloc] init];
        _nameLB.text = @"";
        _nameLB.textColor = UIColor.blackColor;
        _nameLB.font = [UIFont systemFontOfSize:12];
    }
    return _nameLB;
}

@end
