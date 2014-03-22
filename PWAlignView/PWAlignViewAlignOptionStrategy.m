//
//  PWAlignViewAlignOptionStrategy.m
//  PWAlignView
//
//  Created by wpsteak on 13/10/7.
//  Copyright (c) 2013年 Prince. All rights reserved.
//

#import "PWAlignViewAlignOptionStrategy.h"

CGRect BaseRect(CGRect rect)
{
    rect.origin.x    = 0.0f;
    rect.origin.y    = 0.0f;
    rect.size.width  = CGRectGetWidth(rect);
    rect.size.height = CGRectGetHeight(rect);
    return rect;
}

@implementation PWAlignViewAlignOptionStrategy

+ (NSObject <PWAlignViewAlignOptionStrategyProtocol> *)strategyWithLayoutSetting:(PWAlignViewAlignOption)layout
{
    if (layout == PWAlignViewAlignOptionLeftToRight) {
        return [[PWAlignViewAlignOptionStrategyLR alloc] init];
    }
    else if (layout == PWAlignViewAlignOptionRightToLeft) {
        return [[PWAlignViewAlignOptionStrategyRL alloc] init];
    }
    
    return [[PWAlignViewAlignOptionStrategyLR alloc] init];
}

@end

@implementation PWAlignViewAlignOptionStrategyLR

- (NSUInteger)determinePrevIndexByCurrIndex:(NSUInteger)index
{
    return index - 1;
}

- (CGRect)frameWithView:(UIView *)tag inViewCollection:(NSArray *)tags andBaseView:(UIView *)view
{
    NSUInteger index = [tags indexOfObject:tag];
    CGRect baseFrame = UIEdgeInsetsInsetRect(BaseRect(view.frame), self.edgeInsets);

    CGRect prevTagFrame;
    if(index == 0) {
        CGRect zeroFrame = CGRectMake(CGRectGetMinX(baseFrame), CGRectGetMinY(baseFrame), 0.0f, 0.0f);
        prevTagFrame = zeroFrame;
    }
    else {
        NSUInteger prevIndex = [self determinePrevIndexByCurrIndex:index];
        UIView *prevTag = [tags objectAtIndex:prevIndex];
        prevTagFrame = prevTag.frame;
    }
    
    CGFloat tagWidth    = CGRectGetWidth(tag.frame);
    CGFloat tagHeight   = CGRectGetHeight(tag.frame);
    CGFloat newX        = (index == 0) ? CGRectGetMaxX(prevTagFrame) : CGRectGetMaxX(prevTagFrame) + self.itemSpace;
    CGFloat newY        = CGRectGetMinY(prevTagFrame);
    
    CGRect newFrame     = CGRectMake(newX, newY, tagWidth, tagHeight);
    CGFloat rightEdgeValue = CGRectGetMaxX(newFrame);
    if (rightEdgeValue > CGRectGetMaxX(baseFrame)) {
        newX = baseFrame.origin.x;
        newY = newY + self.lineHeight;
        
        newFrame.origin.x = newX;
        newFrame.origin.y = newY;
    }
    
    return newFrame;
}

@end

@implementation PWAlignViewAlignOptionStrategyRL

- (NSUInteger)determinePrevIndexByCurrIndex:(NSUInteger)index
{
    return index - 1;
}

- (CGRect)frameWithView:(UIView *)tag inViewCollection:(NSArray *)tags andBaseView:(UIView *)view
{
    NSUInteger index = [tags indexOfObject:tag];
    CGRect baseFrame = UIEdgeInsetsInsetRect(BaseRect(view.frame), self.edgeInsets);

    CGRect prevTagFrame;
    if(index == 0) {
        CGRect zeroFrame = CGRectMake(CGRectGetMaxX(baseFrame), CGRectGetMinY(baseFrame), 0.0f, 0.0f);
        prevTagFrame = zeroFrame;
    }
    else {
        NSUInteger prevIndex = [self determinePrevIndexByCurrIndex:index];
        UIView *prevTag = [tags objectAtIndex:prevIndex];
        prevTagFrame = prevTag.frame;
    }

    CGFloat tagWidth    = CGRectGetWidth(tag.frame);
    CGFloat tagHeight   = CGRectGetHeight(tag.frame);
    CGFloat newX        = (index == 0) ? CGRectGetMinX(prevTagFrame) - tagWidth : CGRectGetMinX(prevTagFrame) - tagWidth - self.itemSpace;
    CGFloat newY        = CGRectGetMinY(prevTagFrame);

    CGRect newFrame     = CGRectMake(newX, newY, tagWidth, tagHeight);
    CGFloat leftEdgeValue = CGRectGetMinX(newFrame);
    if (leftEdgeValue < CGRectGetMinX(baseFrame)) {
        newX = CGRectGetMaxX(baseFrame) - tagWidth;
        newY = newY + self.lineHeight;
        
        newFrame.origin.x = newX;
        newFrame.origin.y = newY;
    }
    
    return newFrame;
}

@end
