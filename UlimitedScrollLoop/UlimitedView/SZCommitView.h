//
//  SZCommitView.h
//  UlimitedScrollLoop
//
//  Created by 王少泽 on 17/2/25.
//  Copyright © 2017年 王少泽. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SZCommitView;
@protocol SZCommitDelegate <NSObject>

- (void)didSelectImageToJumpView:(UITapGestureRecognizer *)sender;

@end
@interface SZCommitView : UIView

- (void)setImages:(NSArray *)images;
@property (nonatomic,weak)id<SZCommitDelegate> delegate;

@end
