//
//  SZUnlimitedScrollView.h
//  UlimitedScrollLoop
//
//  Created by 王少泽 on 17/2/25.
//  Copyright © 2017年 王少泽. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SZUnlimitedScrollView;
@protocol SZUnlimitedScrollViewDelegate <NSObject>

- (void)didSelectImage:(UITapGestureRecognizer *)sender;

@end
@interface SZUnlimitedScrollView : UIScrollView

@property (nonatomic,weak)id<SZUnlimitedScrollViewDelegate> unlimitedDelegate;

- (void)setGetImages:(NSArray *)getImages;

@end
