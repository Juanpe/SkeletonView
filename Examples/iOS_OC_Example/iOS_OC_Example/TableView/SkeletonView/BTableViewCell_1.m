//
//  BTableViewCell_1.m
//  SkeletonView_Example
//
//  Created by lionsom on 2022/7/6.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

#import "BTableViewCell_1.h"
#import "Masonry.h"
@import SkeletonView;

@implementation BTableViewCell_1

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
    //
    self.avatarIMV.frame = CGRectMake(10, 10, 80, 80);
    self.nameLB.frame = CGRectMake(110, 25, self.contentView.frame.size.width - 120, 50);
}

- (void)P_showSkeleton {
    self.avatarIMV.isSkeletonable = true;
    self.nameLB.isSkeletonable = true;
    
    // 定制
//    [self.nameLB skeletonPaddingInsets_OCWithInsets:UIEdgeInsetsMake(10, 10, 10, 10)];  // 内边距
    [self.nameLB skeletonTextLineHeight_OCWithType:20];   // 行高
    [self.nameLB skeletonTextNumberOfLines_OCWithType:2]; // 行数
    self.nameLB.lastLineFillPercent = 50;  // 最后一行长度占比
    self.nameLB.linesCornerRadius = 5;     // 圆角
    self.nameLB.skeletonLineSpacing = 10;  // 行间距
    
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
        _nameLB.text = @"姓名：奥斯卡";
        _nameLB.textColor = UIColor.blackColor;
        _nameLB.font = [UIFont systemFontOfSize:20];
    }
    return _nameLB;
}

@end
