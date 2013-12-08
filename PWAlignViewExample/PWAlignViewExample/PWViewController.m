//
//  PWViewController.m
//  PWAlignViewExample
//
//  Created by Prince on 2013/12/8.
//  Copyright (c) 2013年 Prince. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "PWViewController.h"
#import "PWAlignView.h"

#define CARD_SIZE 45
#define TAG_SIZE 10

@interface PWViewController ()

@end

@implementation PWViewController

- (NSMutableArray *)cardLabelsWithString:(NSString *)string
{
    NSMutableArray *viewCollection = [NSMutableArray array];
    for (int i = 0; i < [string length]; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(3, 3, CARD_SIZE, CARD_SIZE)];
        [label setFont:[UIFont systemFontOfSize:CARD_SIZE]];
        [label setBackgroundColor:[UIColor clearColor]];
        [label setText:[string substringWithRange:NSMakeRange(i, 1)]];
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"GrayCard"]];
        [imageView addSubview:label];
        [viewCollection addObject:imageView];
    }
    
    return viewCollection;
}

- (NSMutableArray *)tagLabelsWithArray:(NSArray *)array
{
    NSMutableArray *viewCollection = [NSMutableArray array];
    for (NSString *tagTitle in array) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, TAG_SIZE, TAG_SIZE)];
        [label setFont:[UIFont systemFontOfSize:TAG_SIZE]];
        [label setBackgroundColor:[UIColor colorWithRed:0.145 green:0.267 blue:0.706 alpha:1.000]];
        [label setTextColor:[UIColor whiteColor]];
        [label setText:tagTitle];
        [label sizeToFit];
        label.layer.cornerRadius = 3.0;
        [viewCollection addObject:label];
    }
    
    return viewCollection;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    /*
     sample1
     imageViews
     */
    PWAlignView *alignView1 = [[PWAlignView alloc] initWithFrame:CGRectMake(77, 38, 230, 169)];
    alignView1.lineHeight = 64 ;
    alignView1.itemSpace = 9;
    alignView1.alignOption = PWAlignViewAlignOptionLeftToRight;
    alignView1.edgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    [self.view addSubview:alignView1];
    
    NSString *sample1 = @"媽～  我在這！0.0/";
    NSMutableArray *cardLabels = [self cardLabelsWithString:sample1];
    [alignView1 appendWithViewArray:cardLabels];
    
    /*
     sample2
     left to right
     */
    PWAlignView *alignView2 = [[PWAlignView alloc] initWithFrame:CGRectMake(0, 270, 320, 20)];
    alignView2.lineHeight = TAG_SIZE + 10;
    alignView2.itemSpace = 5;
    alignView2.alignOption = PWAlignViewAlignOptionLeftToRight;
    alignView2.edgeInsets = UIEdgeInsetsMake(5, 5, 0, 0);
    [self.view addSubview:alignView2];
    
    NSArray *sample2 = @[@" Tags ", @" Taipei ", @" 象山 "];
    NSMutableArray *tagLabels = [self tagLabelsWithArray:sample2];
    [alignView2 appendWithViewArray:tagLabels];

    /*
     sample3
     right to left
     */
    PWAlignView *alignView3 = [[PWAlignView alloc] initWithFrame:CGRectMake(0, 305, 320, 50)];
    alignView3.lineHeight = TAG_SIZE + 10;
    alignView3.itemSpace = 5;
    alignView3.alignOption = PWAlignViewAlignOptionRightToLeft;
    alignView3.edgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
    
    [self.view addSubview:alignView3];

    NSArray *sample3 = @[@" Tags ", @" Taipei ", @" 象山 "];
    NSMutableArray *tagLabels2 = [self tagLabelsWithArray:sample3];
    [alignView3 appendWithViewArray:tagLabels2];
    
    /*
     sample4
     multi-lines
     */
    PWAlignView *alignView4 = [[PWAlignView alloc] initWithFrame:CGRectMake(0, 360, 320, 50)];
    alignView4.lineHeight = TAG_SIZE + 10;
    alignView4.itemSpace = 5;
    alignView4.edgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    [self.view addSubview:alignView4];
    
    NSArray *sample4 = @[@" longlongTag ", @" tagOne ", @" longTag ", @" tagTWO ", @" tag ", @" tagThree ", @" tag ", @" longlongTag ", @" tag ", @" tag ", @" tag ", @" tag ", @" longlongTag "];
    NSMutableArray *manyTagLabels = [self tagLabelsWithArray:sample4];
    [alignView4 appendWithViewArray:manyTagLabels];
    
    /*
     sample5
     different color text layout
     */
    PWAlignView *alignView5 = [[PWAlignView alloc] initWithFrame:CGRectMake(0, 440, 320, 50)];
    alignView4.lineHeight = 24;
    alignView5.itemSpace = 0;
    alignView5.edgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    [self.view addSubview:alignView5];

    NSMutableArray *customViews = [NSMutableArray array];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 24, 24)];
    [label1 setFont:[UIFont systemFontOfSize:24]];
    [label1 setBackgroundColor:[UIColor clearColor]];
    [label1 setTextColor:[UIColor grayColor]];
    [label1 setText:@"Different"];
    [label1 sizeToFit];
    [customViews addObject:label1];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 24, 24)];
    [label2 setFont:[UIFont systemFontOfSize:24]];
    [label2 setBackgroundColor:[UIColor clearColor]];
    [label2 setTextColor:[UIColor redColor]];
    [label2 setText:@"Color"];
    [label2 sizeToFit];
    [customViews addObject:label2];

    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 24, 24)];
    [label3 setFont:[UIFont systemFontOfSize:24]];
    [label3 setBackgroundColor:[UIColor clearColor]];
    [label3 setTextColor:[UIColor blackColor]];
    [label3 setText:@"Text"];
    [label3 sizeToFit];
    [customViews addObject:label3];
    
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 24, 24)];
    [label4 setFont:[UIFont systemFontOfSize:24]];
    [label4 setBackgroundColor:[UIColor clearColor]];
    [label4 setTextColor:[UIColor purpleColor]];
    [label4 setText:@"Layout"];
    [label4 sizeToFit];
    [customViews addObject:label4];
    
    [alignView5 appendWithViewArray:customViews];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
