//
//  ViewController.m
//  TouchDemo
//
//  Created by Antonio081014 on 8/22/15.
//  Copyright (c) 2015 antonio081014.com. All rights reserved.
//

#import "ViewController.h"
#import "DotView.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *canvasView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIVisualEffectView *drawerView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect bounds = self.view.bounds;
    
    self.canvasView = [[UIView alloc] initWithFrame:bounds];
    self.canvasView.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:self.canvasView];
    
    [self addDots:25 toView:self.canvasView];
    [DotView arrangeDotsRandomlyInView:self.canvasView];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:bounds];
    [self.view addSubview:self.scrollView];
    
    self.drawerView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
    self.drawerView.frame = CGRectMake(0, 0, bounds.size.width, 650);
    [self.scrollView addSubview:self.drawerView];
    
    [self addDots:20 toView:self.drawerView.contentView];
    [DotView arrangeDotsNeatlyInView:self.drawerView.contentView];
    
    self.scrollView.contentSize = CGSizeMake(bounds.size.width, bounds.size.height + self.drawerView.bounds.size.height);
    self.scrollView.contentOffset = CGPointMake(0, self.drawerView.bounds.size.height);
    
    self.scrollView.userInteractionEnabled = NO;
    [self.view addGestureRecognizer:self.scrollView.panGestureRecognizer];
}

- (void)addDots:(NSUInteger)count toView:(UIView *)view
{
    for (int i=0; i<count; i++) {
        DotView *dotView = [DotView randomDotView];
        [view addSubview:dotView];
    }
}


@end
