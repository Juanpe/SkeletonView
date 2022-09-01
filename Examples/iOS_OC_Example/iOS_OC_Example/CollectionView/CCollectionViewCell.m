//
//  CCollectionViewCell.m
//  SkeletonView_Example
//
//  Created by lionsom on 2022/7/7.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

#import "CCollectionViewCell.h"
#import "Masonry.h"

@interface CCollectionViewCell()

@property (nonatomic, strong) UIImageView *avatarIMV;

@property (nonatomic, strong) UILabel *nameLB;

@property (nonatomic, strong) UILabel *textLB;

@end

@implementation CCollectionViewCell


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
    [self.contentView addSubview:self.textLB];
    //
    [self.avatarIMV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(5);
        make.top.mas_equalTo(5);
        make.bottom.mas_equalTo(-5);
        make.height.mas_equalTo(self.avatarIMV.mas_width);
    }];
    [self.nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.avatarIMV.mas_right).offset(5);
        make.right.mas_equalTo(-5);
        make.top.mas_equalTo(5);
    }];
    [self.textLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.nameLB);
        make.top.mas_equalTo(self.nameLB.mas_bottom).offset(0);
        make.bottom.mas_equalTo(-5);
    }];
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
        _nameLB.text = @"奥斯卡";
        _nameLB.textColor = UIColor.blackColor;
        _nameLB.font = [UIFont systemFontOfSize:12];
    }
    return _nameLB;
}

- (UILabel *)textLB {
    if (!_textLB) {
        _textLB = [[UILabel alloc] init];
        _textLB.text = @"健康撒旦教可丽金可拉倒非神即坑啊睡觉快递费接口了解打发打发看来是";
        _textLB.textColor = UIColor.blackColor;
        _textLB.numberOfLines = 2;
        _textLB.font = [UIFont systemFontOfSize:10];
    }
    return _textLB;
}

@end
