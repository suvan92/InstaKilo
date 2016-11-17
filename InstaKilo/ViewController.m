//
//  ViewController.m
//  InstaKilo
//
//  Created by Suvan Ramani on 2016-11-16.
//  Copyright © 2016 suvanr. All rights reserved.
//

#import "ViewController.h"
#import "HeaderReusableView.h"
#import "ImageCell.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic) UICollectionViewFlowLayout *groupLayout;
@property (nonatomic) UICollectionViewFlowLayout *freeLayout;

@property (nonatomic) NSDictionary *dictOfImages;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor lightGrayColor];
    
    [self setUpImageDict];
    [self setUpLayouts];
    
    self.collectionView.collectionViewLayout = self.groupLayout;
    
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

#pragma mark - CollectionView -

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.dictOfImages.allKeys.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    NSArray *listOfKeys = self.dictOfImages.allKeys;
    
    NSString *currentSection = listOfKeys[section];
    
    return ((NSArray *)[self.dictOfImages objectForKey:currentSection]).count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"imageCell" forIndexPath:indexPath];
    
    NSArray *listOfKeys = self.dictOfImages.allKeys;
    NSString *section = listOfKeys[indexPath.section];
    NSArray *arrayOfImages = [self.dictOfImages objectForKey:section];
    
    UIImage *imageToDisplay = arrayOfImages[indexPath.row];
    
    cell.imageViewForCell.image = imageToDisplay;
    cell.imageViewForCell.contentMode = UIViewContentModeScaleAspectFit;
    
    return cell;
}


-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    HeaderReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView" forIndexPath:indexPath];
    
    NSArray *arrayOfKeys = self.dictOfImages.allKeys;
    
    headerView.sectionTitleLabel.text = arrayOfKeys[indexPath.section];
    return headerView;
    
}

#pragma mark - Layout Setup -

-(void)setUpLayouts {
    self.groupLayout = [[UICollectionViewFlowLayout alloc] init];
    self.groupLayout.itemSize = CGSizeMake(200, 200);
    self.groupLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.groupLayout.minimumInteritemSpacing = 15;
    self.groupLayout.minimumLineSpacing = 10;
    self.groupLayout.headerReferenceSize = CGSizeMake(self.collectionView.frame.size.width, 40);
    
    
    self.freeLayout = [[UICollectionViewFlowLayout alloc] init];
    self.freeLayout.itemSize = CGSizeMake(70, 70);
    self.freeLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    self.freeLayout.minimumLineSpacing = 5;
    self.freeLayout.minimumLineSpacing = 5;
}


@end
