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
@property (nonatomic) UICollectionViewFlowLayout *layout;
@property (nonatomic) NSDictionary *dictOfImages;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpImageDict];
    
    self.layout = [[UICollectionViewFlowLayout alloc] init];
    self.layout.itemSize = CGSizeMake(200, 200);
    self.layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.layout.minimumInteritemSpacing = 15;
    self.layout.minimumLineSpacing = 10;
    self.layout.headerReferenceSize = CGSizeMake(self.collectionView.frame.size.width, 50);
    
    self.collectionView.collectionViewLayout = self.layout;
    self.collectionView.backgroundColor = [UIColor lightGrayColor];
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
    
    for (NSString *key in listOfKeys) {
        if ([key isEqualToString:@"People"]) {
            return ((NSArray *)[self.dictOfImages objectForKey:key]).count;
        } else if ([key isEqualToString:@"Food"]) {
            return ((NSArray *)[self.dictOfImages objectForKey:key]).count;
        } else {
            return 1;
        }
    }
    return 0;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"imageCell" forIndexPath:indexPath];
    
    NSArray *listOfKeys = self.dictOfImages.allKeys;
    NSString *section = listOfKeys[indexPath.section];
    NSArray *arrayOfImages = [self.dictOfImages objectForKey:section];
    UIImage *imageToDisplay = arrayOfImages[indexPath.row];
    
    cell.imageViewForCell.image = imageToDisplay;
    
    return cell;
}


-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    HeaderReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView" forIndexPath:indexPath];
    
    NSArray *arrayOfKeys = self.dictOfImages.allKeys;
    
    headerView.sectionTitleLabel.text = arrayOfKeys[indexPath.section];
    return headerView;
    
}


@end
