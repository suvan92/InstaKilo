//
//  ViewController.m
//  InstaKilo
//
//  Created by Suvan Ramani on 2016-11-16.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic) NSArray *listOfImages;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpImageArray];
    
}


-(void)setUpImageArray {
    
    self.listOfImages = @[[UIImage imageNamed:@"DeepProfile"],
                          [UIImage imageNamed:@"IMG_0902"],
                          [UIImage imageNamed:@"IMG_1313"],
                          [UIImage imageNamed:@"IMG_1709"],
                          [UIImage imageNamed:@"IMG_1747"],
                          [UIImage imageNamed:@"IMG_1751"],
                          [UIImage imageNamed:@"IMG_1752"],
                          [UIImage imageNamed:@"IMG_1806"]];
    
    
    
}


@end
