//
//  ViewController.m
//  InstaKilo
//
//  Created by Suvan Ramani on 2016-11-16.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import "ViewController.h"
#import "ImageCell.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic) UICollectionViewFlowLayout *layout;
@property (nonatomic) NSDictionary *dictOfImages;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpImageDict];
    
}

#pragma mark - Set Up -

-(void)setUpImageDict {
    
    NSArray *peopleArray = @[[UIImage imageNamed:@"DeepProfile"],
                             [UIImage imageNamed:@"IMG_0902"],
                             [UIImage imageNamed:@"IMG_1313"]];
    
    NSArray *foodArray = @[[UIImage imageNamed:@"IMG_1709"],
                           [UIImage imageNamed:@"IMG_1747"],
                           [UIImage imageNamed:@"IMG_1751"],
                           [UIImage imageNamed:@"IMG_1752"]];
    
    NSArray *scenesArray = @[[UIImage imageNamed:@"IMG_1806"]];
    
    self.dictOfImages = @{@"People" : peopleArray,
                          @"Food" : foodArray,
                          @"Scenes" : scenesArray};
    
}

#pragma mark - CollectionViewDelegate -



#pragma mark - CollectionViewDataSource -

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.dictOfImages.allKeys.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    NSArray *listOfKeys = self.dictOfImages.allKeys;
    
    for (NSString *key in listOfKeys) {
        if ([key isEqualToString:@"People"]) {
            return ((NSArray *)[self.dictOfImages objectForKey:key]).count;
        } else if ([key isEqualToString:@"Food"]) {
            return ((NSArray *)[self.dictOfImages objectForKey:key]).count;
        } else {
            return ((NSArray *)[self.dictOfImages objectForKey:key]).count;
        }
    }
    return 0;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"imageCell" forIndexPath:indexPath];
    
    
    
    
    
    
    return cell;
}

@end
