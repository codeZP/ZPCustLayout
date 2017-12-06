//
//  ViewController.m
//  自定义布局
//
//  Created by gongwan2 on 2017/11/17.
//  Copyright © 2017年 zp. All rights reserved.
//

#import "ViewController.h"
#import "ZPLineFlowLayout.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat collectionW = [UIScreen mainScreen].bounds.size.width;
    CGFloat collectionH = 200;
    ZPLineFlowLayout *layout = [[ZPLineFlowLayout alloc] init];
    layout.minimumLineSpacing = 20;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = CGSizeMake(collectionW - 140, 100);
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, collectionW, collectionH) collectionViewLayout: layout];
    [collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    collection.delegate = self;
    collection.dataSource = self;
    [self.view addSubview:collection];
}

#pragma mark - 代理和数据源
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

@end
