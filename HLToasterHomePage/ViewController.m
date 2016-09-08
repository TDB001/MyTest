//
//  ViewController.m
//  HLToasterHomePage
//
//  Created by XieLei on 16/9/5.
//  Copyright © 2016年 XieLei. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#define HLkScreenWidth [UIScreen mainScreen].bounds.size.width
#define HLkScreenHeight [UIScreen mainScreen].bounds.size.height




@interface ViewController ()<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *collectionViewFlowLayout;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setCollectionView];
}

#pragma mark -- collectionView代理方法

- (void)setCollectionView {
    
    self.collectionViewFlowLayout.itemSize = CGSizeMake(HLkScreenWidth, HLkScreenHeight - 64);
    self.collectionViewFlowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
//    self.collectionView.backgroundColor = HLKBACKGROUND_COLOR;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    
    self.collectionView.pagingEnabled = YES;
    
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CollectionViewCell"];
    
    
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static  NSString  *CellIdentiferId = @"CollectionViewCell";
    CollectionViewCell  *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentiferId forIndexPath:indexPath];
    if (cell == nil) {
        NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:@"CollectionViewCell" owner:nil options:nil];
        cell = [nibs lastObject];
    }
    
    if (indexPath.item == 0) {
        cell.backgroundColor = [UIColor redColor];
    } else {
        cell.backgroundColor = [UIColor greenColor];
    }
    
    return cell;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"%f", self.collectionView.contentOffset.x);
    CGFloat offsetX = self.collectionView.contentOffset.x / HLkScreenWidth + 1;
    
//    
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"HLGoodsDetailCellCollectionScroll" object:[NSString stringWithFormat:@"%f", offsetX]];
    
    //我就修改你怎么了
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
