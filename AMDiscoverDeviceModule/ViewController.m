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
@property(strong,nonatomic) AMDiscoverView* dView;
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

    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(30, 30, 100, 40)];
    [btn setTitle:@"数量4" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = 0;
    [self.view addSubview:btn];
    
    UIButton* btn1 = [[UIButton alloc] initWithFrame:CGRectMake(30+100+30, 30, 100, 40)];
    [btn1 setTitle:@"数量3" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn1.tag = 1;
    [btn1 addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:btn1];
    
    UIButton* btn2 = [[UIButton alloc] initWithFrame:CGRectMake(30, 30+40+20, 100, 40)];
    [btn2 setTitle:@"数量20" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn2.tag = 2;
    [btn2 addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UIButton* btn3 = [[UIButton alloc] initWithFrame:CGRectMake(30+100+30, 30+40+20, 100, 40)];
    [btn3 setTitle:@"数量5" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn3.tag = 3;
    [btn3 addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    
    [self dViewWithTag:5];
        
}


- (void) action:(UIButton*) sender {
    if (sender.tag == 0) {
        [self.dView removeFromSuperview];
        [self dViewWithTag:4];

    }
    else if (sender.tag == 1) {
        [self.dView removeFromSuperview];
        [self dViewWithTag:3];

    }
    else if (sender.tag == 3) {
        [self.dView removeFromSuperview];
        [self dViewWithTag:5];

    }
    else {
        [self.dView removeFromSuperview];
        [self dViewWithTag:20];

    }
}

- (void) dViewWithTag:(NSInteger) tag{
    AMDiscoverView* discoverView = [[AMDiscoverView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width-20, kScreen_Width-20) index:tag];
    discoverView.center = self.view.center;
    self.dView = discoverView;
    [self.view addSubview:discoverView];
}

@end
