//
//  CCollectionHeaderView_1.m
//  SkeletonView_Example
//
//  Created by lionsom on 2022/7/7.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

#import "CCollectionHeaderView_1.h"
@import SkeletonView;

@interface CCollectionHeaderView_1()

@property (nonatomic, strong) UILabel *titleLB;

@end

@implementation CCollectionHeaderView_1

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.greenColor;
        //
        [self addSubview:self.titleLB];
        self.titleLB.frame = CGRectMake(10, 10, self.frame.size.width - 20, 30);
        
        // 整个背景
//        self.isSkeletonable = YES;
//        [self showAnimatedGradientSkeleton_OC];
        
        // 单个控件
        self.titleLB.isSkeletonable = YES;
        
        // 定制
        [self.titleLB skeletonTextLineHeight_OCWithType:30];   // 行高
        [self.titleLB skeletonTextNumberOfLines_OCWithType:1]; // 行数
        self.titleLB.lastLineFillPercent = 40;  // 最后一行长度占比
        self.titleLB.linesCornerRadius = 5;     // 圆角
        
        [self.titleLB showAnimatedGradientSkeleton_OC];
    }
    return self;
}

- (void)P_updateTitle:(NSString *)title {
    self.titleLB.text = title;
}

- (UILabel *)titleLB {
    if (!_titleLB) {
        _titleLB = [[UILabel alloc] init];
        _titleLB.textColor = UIColor.purpleColor;
        _titleLB.text = @"标题";
    }
    return _titleLB;
}

@end
