//
//  ImageViewViewController.m
//  UlimitedScrollLoop
//
//  Created by 王少泽 on 17/2/26.
//  Copyright © 2017年 王少泽. All rights reserved.
//

#import "ImageViewViewController.h"

@interface ImageViewViewController ()

@end

@implementation ImageViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:_imageName]];
    image.frame = self.view.bounds;
    
    [self.view addSubview:image];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
