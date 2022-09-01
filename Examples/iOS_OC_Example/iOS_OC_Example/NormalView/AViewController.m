//
//  AViewController.m
//  SkeletonView_Example
//
//  Created by lionsom on 2022/7/6.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

#import "AViewController.h"
//#import ""
@import SkeletonView;

@interface AViewController ()

@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColor.greenColor;
    
    UIView * A = [[UIView alloc] initWithFrame:CGRectMake(50, 30, self.view.frame.size.width - 100, 100)];
    A.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:A];
    //
    A.isSkeletonable = YES;
    A.skeletonCornerRadius = 20;
    [A showAnimatedGradientSkeleton_OC];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [A hideSkeleton_OC];
        A.backgroundColor = UIColor.yellowColor;
    });
    
    
    UILabel *B = [[UILabel alloc] initWithFrame:CGRectMake(50, 150, self.view.frame.size.width - 100, 100)];
    B.numberOfLines = 5;
    B.textColor = UIColor.blackColor;
    [self.view addSubview:B];
    //
    B.isSkeletonable = YES;
    [B skeletonPaddingInsets_OCWithInsets:UIEdgeInsetsMake(10, 10, 10, 10)];  // 内边距
    [B skeletonTextLineHeight_OCWithType:30];   // 行高
    [B skeletonTextNumberOfLines_OCWithType:2]; // 行数
    B.lastLineFillPercent = 50;  // 最后一行长度占比
    B.linesCornerRadius = 5;     // 圆角
    B.skeletonLineSpacing = 10;  // 行间距
    // 打印Skeleton信息
    BOOL B_bool = [B isSkeletonActive_OC];  // NO
    NSLog(@"UILabel isSkeletonActive_OC：%d,  %@", B_bool, [B skeletonTreeDescription_OC]);
    // 开始
    [B showAnimatedGradientSkeleton_OC];
    // 打印当前Skeleton状态
    BOOL B1_bool = [B isSkeletonActive_OC];  // YES
    NSLog(@"UILabel isSkeletonActive_OC：%d", B1_bool);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 结束
        [B hideSkeleton_OC];
        B.text = @"这是新数据哈哈哈哈卷卡式带扣几分凯德风尚凯德风尚卷卡式带分开发的健康是数据哈哈哈哈卷卡式带扣几分凯德风尚凯德风尚卷卡式带分开发的数据哈哈哈哈卷卡式带扣几分凯德风尚凯德风尚卷卡式带分开发的福";
    });
    
    
    UITextView *C = [[UITextView alloc] initWithFrame:CGRectMake(50, 300, self.view.frame.size.width - 100, 100)];
    [self.view addSubview:C];
    //
    C.isSkeletonable = YES;
    C.lastLineFillPercent = 90;
    C.linesCornerRadius = 5;
    C.skeletonLineSpacing = 10;
    // 打印Skeleton信息
    BOOL C_bool = [C isSkeletonActive_OC];
    NSLog(@"UILabel的信息：%d,  %@", C_bool, [C skeletonTreeDescription_OC]);
    [C showAnimatedGradientSkeleton_OC];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [C hideSkeleton_OC];
        C.text = @"这是新数据哈哈哈哈卷卡式带扣几分凯德风尚凯德风尚卷卡式带分开发的健康是数据哈哈哈哈卷卡式带扣几分凯德风尚凯德风尚卷卡式带分开发的数据哈哈哈哈卷卡式带扣几式带扣几分凯德风尚凯德风尚卷卡式带分开发的健康是数据哈哈哈哈卷卡式带扣几分凯德风尚凯德风尚卷卡式带分开发的数据哈哈哈哈卷卡式带扣几分凯德风尚凯式带扣几分凯德风尚凯德风尚卷卡式带分开发的健康是数据哈哈哈哈卷卡式带扣几分凯德风尚凯德风尚卷卡式带分开发的数据哈哈哈哈卷卡式带扣几分凯德风尚凯式带扣几分凯德风尚凯德风尚卷卡式带分开发的健康是数据哈哈哈哈卷卡式带扣几分凯德风尚凯德风尚卷卡式带分开发的数据哈哈哈哈卷卡式带扣几分凯德风尚凯式带扣几分凯德风尚凯德风尚卷卡式带分开发的健康是数据哈哈哈哈卷卡式带扣几分凯德风尚凯德风尚卷卡式带分开发的数据哈哈哈哈卷卡式带扣几分凯德风尚凯式带扣几分凯德风尚凯德风尚卷卡式带分开发的健康是数据哈哈哈哈卷卡式带扣几分凯德风尚凯德风尚卷卡式带分开发的数据哈哈哈哈卷卡式带扣几分凯德风尚凯式带扣几分凯德风尚凯德风尚卷卡式带分开发的健康是数据哈哈哈哈卷卡式带扣几分凯德风尚凯德风尚卷卡式带分开发的数据哈哈哈哈卷卡式带扣几分凯德风尚凯式带扣几分凯德风尚凯德风尚卷卡式带分开发的健康是数据哈哈哈哈卷卡式带扣几分凯德风尚凯德风尚卷卡式带分开发的数据哈哈哈哈卷卡式带扣几分凯德风尚凯分凯德风尚凯德风尚卷卡式带分开发的福";
    });
    
    
    UIImageView *D = [[UIImageView alloc] initWithFrame:CGRectMake(50, 450, 50, 50)];
    D.backgroundColor = UIColor.redColor;
    [self.view addSubview:D];
    //
    D.isSkeletonable = YES;
    [D showAnimatedGradientSkeleton_OC];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [D hideSkeleton_OC];
        D.image = [UIImage imageNamed:@"avatar"];
    });
    
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(150, 450, 100, 40)];
    btn.backgroundColor = UIColor.redColor;
    [btn setTitle:@"点击" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    //
    btn.isSkeletonable = YES;
    [btn showAnimatedGradientSkeleton_OC];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [btn hideSkeleton_OC];
    });
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
