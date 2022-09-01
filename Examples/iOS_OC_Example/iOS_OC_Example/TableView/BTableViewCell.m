//
//  BTableViewCell.m
//  SkeletonView_Example
//
//  Created by lionsom on 2022/7/6.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

#import "BTableViewCell.h"
#import "Masonry.h"
@import SkeletonView;

@interface BTableViewCell()

//@property (nonatomic, strong) UIImageView *avatarIMV;
//
//@property (nonatomic, strong) UILabel *nameLB;
//
//@property (nonatomic, strong) UILabel *textLB;
//
//@property (nonatomic, strong) UIImageView *pictureIMV;

@end

@implementation BTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self p_createView];
    }
    return self;
}

- (void)p_createView {
    self.contentView.backgroundColor = UIColor.whiteColor;
    //
    [self.contentView addSubview:self.avatarIMV];
    [self.contentView addSubview:self.nameLB];
    [self.contentView addSubview:self.textLB];
    [self.contentView addSubview:self.pictureIMV];
    //
    [self.avatarIMV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(10);
        make.bottom.mas_equalTo(-10);
        make.height.mas_equalTo(self.avatarIMV.mas_width);
    }];
    [self.pictureIMV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(30);
        make.right.mas_equalTo(-20);
        make.centerY.mas_equalTo(0);
    }];
    [self.nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.avatarIMV.mas_right).offset(10);
        make.right.mas_equalTo(self.pictureIMV.mas_left).offset(-10);
        make.top.mas_equalTo(10);
    }];
    [self.textLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.nameLB);
        make.top.mas_equalTo(self.nameLB.mas_bottom).offset(10);
        make.bottom.mas_equalTo(-10);
    }];
}

- (void)P_showSkeleton {
    self.avatarIMV.isSkeletonable = true;
    self.nameLB.isSkeletonable = true;
    self.textLB.isSkeletonable = true;
    self.pictureIMV.isSkeletonable = true;

    [self.avatarIMV showAnimatedGradientSkeleton_OC];
    [self.nameLB showAnimatedGradientSkeleton_OC];
    [self.textLB showAnimatedGradientSkeleton_OC];
    [self.pictureIMV showAnimatedGradientSkeleton_OC];
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
        _nameLB.text = @"姓名：奥斯卡";
        _nameLB.textColor = UIColor.blackColor;
        _nameLB.font = [UIFont systemFontOfSize:20];
    }
    return _nameLB;
}

- (UILabel *)textLB {
    if (!_textLB) {
        _textLB = [[UILabel alloc] init];
        _textLB.text = @"健康撒旦教可丽金可拉倒非神即坑啊睡觉快递费接口了解打发打发看来是";
        _textLB.textColor = UIColor.blackColor;
        _textLB.numberOfLines = 2;
        _textLB.font = [UIFont systemFontOfSize:15];
    }
    return _textLB;
}

- (UIImageView *)pictureIMV {
    if (!_pictureIMV) {
        _pictureIMV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"avatar"]];
        _pictureIMV.backgroundColor = UIColor.clearColor;
    }
    return _pictureIMV;
}

@end
