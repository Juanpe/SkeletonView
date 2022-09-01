//
//  CCollectionHeaderView.m
//  SkeletonView_Example
//
//  Created by lionsom on 2022/7/7.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

#import "CCollectionHeaderView.h"
#import "Masonry.h"

@interface CCollectionHeaderView()

@property (nonatomic, strong) UILabel *titleLB;

@end

@implementation CCollectionHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.greenColor;
        //
        [self addSubview:self.titleLB];
        [self.titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.bottom.mas_equalTo(0);
            make.right.mas_equalTo(-10);
        }];
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
