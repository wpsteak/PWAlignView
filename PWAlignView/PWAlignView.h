//
//  PWAlignView.h
//  PWAlignView
//
//  Created by wpsteak on 13/10/7.
//  Copyright (c) 2013年 Prince. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PWAlignViewAlignOptionStrategy.h"

@interface PWAlignView : UIView

@property (nonatomic, assign) NSUInteger             lineHeight;
@property (nonatomic, assign) NSInteger              itemSpace;
@property (nonatomic, assign) PWAlignViewAlignOption alignOption;
@property (nonatomic, assign) UIEdgeInsets           edgeInsets;

- (void)appendWithViewArray:(NSArray *)viewArray;
- (void)removeAllItems;
- (void)reloadLayout;

@end
