//
//  PWAlignViewAlignOptionStrategy.m
//  PWAlignView
//
//  Created by wpsteak on 13/10/7.
//  Copyright (c) 2013年 Prince. All rights reserved.
//

#import "PWAlignViewAlignOptionStrategy.h"

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

- (CGRect)frameWithView:(UIView *)tag inViewCollection:(NSArray *)tags andBaseView:(UIView *)view
{
    NSUInteger index = [tags indexOfObject:tag];
    CGRect baseFrame = UIEdgeInsetsInsetRect(view.bounds, self.edgeInsets);

    CGRect prevTagFrame;
    if(index == 0) {
        CGRect zeroFrame = CGRectMake(CGRectGetMinX(baseFrame), CGRectGetMinY(baseFrame), 0.0, 0.0);
        prevTagFrame = zeroFrame;
    }
    else {
        NSUInteger lastIndex = index - 1;
        UIView *prevTag = [tags objectAtIndex:lastIndex];
        prevTagFrame = prevTag.frame;
    }
    
    CGFloat newX = (index == 0) ? CGRectGetMaxX(prevTagFrame) : CGRectGetMaxX(prevTagFrame) + self.itemSpace;
    CGFloat newY = CGRectGetMinY(prevTagFrame);
    CGFloat newWidth = CGRectGetWidth(tag.frame);
    CGFloat newHeight = CGRectGetHeight(tag.frame);
    CGRect newFrame = CGRectMake(newX, newY, newWidth, newHeight);
    
    CGPoint rightEdgePoint = CGPointMake(CGRectGetMaxX(newFrame), CGRectGetMinY(newFrame));
    if (!CGRectContainsPoint(baseFrame, rightEdgePoint)) {
        newX = baseFrame.origin.x;
        newY = newY + self.lineHeight;
        
        newFrame.origin.x = newX;
        newFrame.origin.y = newY;
    }
    
    return newFrame;
}

@end

@implementation PWAlignViewAlignOptionStrategyRL

- (CGRect)frameWithView:(UIView *)tag inViewCollection:(NSArray *)tags andBaseView:(UIView *)view
{
    NSUInteger index = [tags indexOfObject:tag];
    
    CGRect baseFrame = UIEdgeInsetsInsetRect(view.bounds, self.edgeInsets);

    
    CGRect prevTagFrame;
    if(index == 0) {
        CGRect zeroFrame = CGRectMake(CGRectGetMaxX(baseFrame), CGRectGetMinY(baseFrame), 0.0, 0.0);
        prevTagFrame = zeroFrame;
    }
    else {
        NSUInteger lastIndex = index - 1;
        UIView *prevTag = [tags objectAtIndex:lastIndex];
        prevTagFrame = prevTag.frame;
    }

    CGFloat newWidth = CGRectGetWidth(tag.frame);
    CGFloat newHeight = CGRectGetHeight(tag.frame);
    CGFloat newX = (index == 0) ? CGRectGetMinX(prevTagFrame) - newWidth : CGRectGetMinX(prevTagFrame) - newWidth - self.itemSpace;
    CGFloat newY = CGRectGetMinY(prevTagFrame);

    CGRect newFrame = CGRectMake(newX, newY, newWidth, newHeight);
    
    CGPoint leftEdgePoint = CGPointMake(CGRectGetMinX(newFrame), CGRectGetMinY(newFrame));
    if (!CGRectContainsPoint(baseFrame, leftEdgePoint)) {
        newX = CGRectGetMaxX(baseFrame) - newWidth;
        newY = newY + self.lineHeight;
        
        newFrame.origin.x = newX;
        newFrame.origin.y = newY;
    }
    
    return newFrame;
}

@end
