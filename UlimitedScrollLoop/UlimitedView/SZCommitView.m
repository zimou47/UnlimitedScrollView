//
//  SZCommitView.m
//  UlimitedScrollLoop
//
//  Created by 王少泽 on 17/2/25.
//  Copyright © 2017年 王少泽. All rights reserved.
//

#import "SZCommitView.h"
#import "SZUnlimitedScrollView.h"
@interface SZCommitView ()<UIScrollViewDelegate,SZUnlimitedScrollViewDelegate>

@property (nonatomic,strong)NSArray *getImages;

@end

@implementation SZCommitView
{
    SZUnlimitedScrollView *_unlimitedView;
    UIPageControl *pageControl;
    NSInteger currentCount;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setImages:(NSArray *)images
{
    self.getImages = images;
    [self createScrollView];
    [self createPageControl];
}

- (void)createPageControl
{
    pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 170, 200, 30)];
    pageControl.numberOfPages = self.getImages.count;
    pageControl.currentPage = 0;
    currentCount = 0;
    [self addSubview:pageControl];
}

- (void)createScrollView
{
    _unlimitedView = [[SZUnlimitedScrollView alloc] init];
    _unlimitedView.frame = CGRectMake(0, 0, 375, 200);
    [_unlimitedView setGetImages:_getImages];
    _unlimitedView.pagingEnabled = YES;
    _unlimitedView.unlimitedDelegate = self;
    _unlimitedView.delegate = self;
    _unlimitedView.contentSize = CGSizeMake(5 * [UIScreen mainScreen].bounds.size.width, 0);
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timerCount:) userInfo:nil repeats:YES];
    [self addSubview:_unlimitedView];
}

- (void)timerCount:(NSTimer *)time
{
    currentCount++;
    pageControl.currentPage = currentCount;
    if (currentCount>= _getImages.count) {
        currentCount = 0;
        pageControl.currentPage = currentCount;
    }
    [_unlimitedView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width * currentCount, 0) animated:YES];
}

- (void)didSelectImage:(UITapGestureRecognizer *)sender
{
    if ([self.delegate respondsToSelector:@selector(didSelectImageToJumpView:)]) {
        [self.delegate didSelectImageToJumpView:sender];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger page = scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width;
    pageControl.currentPage = page;
    currentCount = page;
}

@end
