//
//  ViewController.m
//  AMDiscoverDeviceModule
//
//  Created by mac on 2021/7/21.
//

#import "ViewController.h"
#import "AMRippleAnimationView.h"
#import "BViewController.h"
#import "AMConnectBubbleView.h"
#import "AMDiscoverView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    [self animationView];
    [super viewDidLoad];
//    [self customeView];
    // Do any additional setup after loading the view.
}


- (void) animationView {

    
    AMDiscoverView* discoverView = [[AMDiscoverView alloc] init];
    [self.view addSubview:discoverView];
    [discoverView mas_makeConstraints:^(MASConstraintMaker *make) {
        //中心居中
        make.center.equalTo(discoverView.superview);
        //左右约束各位10
        make.size.height.mas_equalTo(kScreen_Width-20);

    }];
    [discoverView setupViews];
    
    
}


- (void) testView {
    BViewController* bVc = [[BViewController alloc] init];
    [self presentViewController:bVc animated:YES completion:^{
        
    }];
}



@end
