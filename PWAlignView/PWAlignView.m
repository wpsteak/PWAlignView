//
//  PWAlignView.m
//  PWAlignView
//
//  Created by wpsteak on 13/10/7.
//  Copyright (c) 2013年 Prince. All rights reserved.
//

#import "PWAlignView.h"

@interface PWAlignView ()

@property (nonatomic, strong)NSMutableArray *viewCollection;
@property (nonatomic, strong)NSObject<PWAlignViewAlignOptionStrategyProtocol> *layoutStrategy;

@end

@implementation PWAlignView

#pragma mark - handle layout logic

- (CGRect)determineFrameAtIndex:(UIView *)view
{
    return [self.layoutStrategy frameWithView:view inViewCollection:self.viewCollection andBaseView:self];
}

#pragma mark - public

- (void)appendWithViewArray:(NSArray *)viewArray
{
    [self.viewCollection addObjectsFromArray:viewArray];
    
    [self reloadLayout];
}

- (void)removeAllItems
{
    [self.viewCollection makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.viewCollection removeAllObjects];
    [self reloadLayout];
}

- (void)reloadLayout
{
    self.layoutStrategy = [PWAlignViewAlignOptionStrategy strategyWithLayoutSetting:self.alignOption];
    self.layoutStrategy.lineHeight = self.lineHeight;
    self.layoutStrategy.itemSpace = self.itemSpace;
    self.layoutStrategy.edgeInsets = self.edgeInsets;
    
    [self.viewCollection enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIView *view = (UIView *)obj;
        CGRect frame = [self determineFrameAtIndex:view];
        [view setFrame:frame];
        [self addSubview:view];
    }];
}

#pragma mark - view's life cycle

- (void)initControl
{
    //Default Setting
    self.viewCollection = [NSMutableArray array];
    self.lineHeight = 20.0f;
    self.itemSpace = 5.0f;
    self.edgeInsets = UIEdgeInsetsZero;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initControl];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initControl];
    }
    return self;
}

@end
