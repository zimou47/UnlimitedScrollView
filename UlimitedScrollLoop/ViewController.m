//
//  ViewController.m
//  UlimitedScrollLoop
//
//  Created by 王少泽 on 17/2/25.
//  Copyright © 2017年 王少泽. All rights reserved.
//

#import "ViewController.h"
#import "ImageViewViewController.h"

#import "SZCommitView.h"
@interface ViewController ()<SZCommitDelegate>

@end

@implementation ViewController
{
    SZCommitView *_commitView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self lazyLoadModeToUnlimitedView];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)lazyLoadModeToUnlimitedView
{
    if (!_commitView) {
        _commitView = [[SZCommitView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 200)];
        _commitView.delegate = self;
        [_commitView setImages:@[@"001.jpg",@"002.jpg",@"003.jpg",@"004.jpg",@"005.jpg"]];
        [self.view addSubview:_commitView];
    }
}

- (void)didSelectImageToJumpView:(UITapGestureRecognizer *)sender
{
    ImageViewViewController *imageVC = [[ImageViewViewController alloc] init];
    NSArray *arr = @[@"001.jpg",@"002.jpg",@"003.jpg",@"004.jpg",@"005.jpg"];
    UITapGestureRecognizer *tap = (UITapGestureRecognizer *)sender;
    NSInteger index = [tap view].tag - 100;
    imageVC.imageName = arr[index];
    
    [self.navigationController pushViewController:imageVC animated:YES];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
