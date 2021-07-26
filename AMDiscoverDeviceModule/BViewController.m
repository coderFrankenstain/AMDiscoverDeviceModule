//
//  BViewController.m
//  AMDiscoverDeviceModule
//
//  Created by mac on 2021/7/21.
//

#import "BViewController.h"
#import "AMRippleAnimationView.h"

@interface BViewController ()

@end

@implementation BViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    [super viewDidLoad];
    [self animationView];
    // Do any additional setup after loading the view.
}

- (void) animationView {
    UIView* bgView = [[UIView alloc] init];
    [self.view addSubview:bgView];
    bgView.backgroundColor = [UIColor grayColor];
    
    UIView* view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor redColor];
    [bgView addSubview:view1];
    
    UIView* view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor yellowColor];
    [bgView addSubview:view2];
    
    UIView* view3 = [[UIView alloc] init];
    view3.backgroundColor = [UIColor greenColor];
    [bgView addSubview:view3];
    
    UIView* view4 = [[UIView alloc] init];
    view4.backgroundColor = [UIColor orangeColor];
    [bgView addSubview:view4];
    
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(kScreen_Width-20);
        make.center.mas_equalTo(bgView.superview);
        make.size.height.mas_equalTo(kScreen_Width-20);

    }];
    
    
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 60));

    }];
    
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 60));
        make.center.mas_equalTo(view1).offset(70);
    }];
    
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 60));
        make.center.mas_equalTo(view2).offset(70);
        
    }];
    
    [view4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 60));
        make.center.mas_equalTo(view3).offset(70);
    }];
    
//    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
//            
//    }];
//    
//    [view4 mas_makeConstraints:^(MASConstraintMaker *make) {
//            
//    }];
    
   
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
