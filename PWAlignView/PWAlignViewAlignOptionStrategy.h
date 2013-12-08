//
//  PWAlignViewAlignOptionStrategy.h
//  PWAlignView
//
//  Created by wpsteak on 13/10/7.
//  Copyright (c) 2013年 Prince. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    PWAlignViewAlignOptionDefault,
    PWAlignViewAlignOptionLeftToRight,
    PWAlignViewAlignOptionRightToLeft
} PWAlignViewAlignOption;

@protocol PWAlignViewAlignOptionStrategyProtocol <NSObject>

@required

@property (nonatomic, assign)NSUInteger     lineHeight;
@property (nonatomic, assign)NSInteger      itemSpace;
@property (nonatomic, assign)UIEdgeInsets   edgeInsets;

- (CGRect)frameWithView:(UIView *)tag inViewCollection:(NSArray *)tags andBaseView:(UIView *)view;
@end

@interface PWAlignViewAlignOptionStrategy : NSObject
+ (NSObject <PWAlignViewAlignOptionStrategyProtocol> *)strategyWithLayoutSetting:(PWAlignViewAlignOption)layout;
@end

@interface PWAlignViewAlignOptionStrategyLR : NSObject <PWAlignViewAlignOptionStrategyProtocol>

@property (nonatomic, assign)NSUInteger     lineHeight;
@property (nonatomic, assign)NSInteger      itemSpace;
@property (nonatomic, assign)UIEdgeInsets   edgeInsets;

- (CGRect)frameWithView:(UIView *)tag inViewCollection:(NSArray *)tags andBaseView:(UIView *)view;

@end

@interface PWAlignViewAlignOptionStrategyRL : NSObject <PWAlignViewAlignOptionStrategyProtocol>

@property (nonatomic, assign)NSUInteger     lineHeight;
@property (nonatomic, assign)NSInteger      itemSpace;
@property (nonatomic, assign)UIEdgeInsets   edgeInsets;

- (CGRect)frameWithView:(UIView *)tag inViewCollection:(NSArray *)tags andBaseView:(UIView *)view;

@end
