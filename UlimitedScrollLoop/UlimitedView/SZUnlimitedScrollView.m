//
//  SZUnlimitedScrollView.m
//  UlimitedScrollLoop
//
//  Created by 王少泽 on 17/2/25.
//  Copyright © 2017年 王少泽. All rights reserved.
//

#import "SZUnlimitedScrollView.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width
@interface SZUnlimitedScrollView ()

@property (nonatomic,strong)NSArray *images;

@end
@implementation SZUnlimitedScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {

    }
    return self;
}

- (void)setGetImages:(NSArray *)getImages
{
    self.images = getImages;
    [self createImageScroll];
}

- (void)createImageScroll
{
    for (int i = 0; i < self.images.count; i++) {
        UIImageView *tmpImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.images[i]]];
        tmpImage.frame = CGRectMake(i * WIDTH, 0, WIDTH, 200);
        tmpImage.userInteractionEnabled = YES;
        [self addSubview:tmpImage];
        UITapGestureRecognizer *tapImage = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectImage:)];
        [tmpImage addGestureRecognizer:tapImage];
        UIView *tapView = [tapImage view];
        tapView.tag = 100 + i;
    }
}
//代理传值
- (void)selectImage:(UITapGestureRecognizer *)sender
{
    if ([self.unlimitedDelegate respondsToSelector:@selector(didSelectImage:)]) {
        [self.unlimitedDelegate didSelectImage:sender];
    }
}

@end
