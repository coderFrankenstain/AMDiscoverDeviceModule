//
//  ViewController.m
//  AMDiscoverDeviceModule
//
//  Created by mac on 2021/7/21.
//

#import "ViewController.h"
#import "AMRippleAnimationView.h"
#import "AMConnectBubbleView.h"
#import "AMDiscoverView.h"
#import "AMBubbleModel.h"
@interface ViewController ()
@property(strong,nonatomic) AMDiscoverView* dView;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self animationView];
    self.view.backgroundColor = ColorWithAlpha(241, 241, 241, 1);
}


- (void) animationView {
    
    UISegmentedControl* control = [[UISegmentedControl alloc] initWithItems:@[@"数量1",@"数量2",@"数量3",@"数量4",@"数量5",@"数量6"]];
    [control setFrame:CGRectMake(10, 50, kScreen_Width-20, 40)];
    [control addTarget:self action:@selector(segementAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:control];
    
    [self dViewWithTag:0];
}


- (void) segementAction:(UISegmentedControl*) control {    
    if (self.dView) {
        [self.dView removeFromSuperview];
    }
    [self dViewWithTag:control.selectedSegmentIndex+1];
}

- (void) dViewWithTag:(NSInteger) tag {
    
    AMDiscoverView* discoverView = [[AMDiscoverView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width-20, kScreen_Width-20)];
    discoverView.center = self.view.center;
    self.dView = discoverView;
    [self.view addSubview:discoverView];

    [discoverView setModels:[self models:tag]];
    
}

- (void) rippleView {
    AMRippleAnimationView* rippleView = [[AMRippleAnimationView alloc] initWithFrame:CGRectMake(0, 0, (kScreen_Width-20)/1.6, (kScreen_Width-20)/1.6)];
    rippleView.center = self.view.center;
    [self.view addSubview:rippleView];
}

#pragma bubleModel

- (NSArray*) models:(NSInteger) count {
    
    NSMutableArray* array = [NSMutableArray array];
    for(int i = 0;i < count;i++){
        AMBubbleModel* model = [[AMBubbleModel alloc] init];
        model.title = [NSString stringWithFormat:@"index %d",i];
        model.icon = @"iPhoneX";
        [array addObject:model];
    }
    return array;
}




@end
