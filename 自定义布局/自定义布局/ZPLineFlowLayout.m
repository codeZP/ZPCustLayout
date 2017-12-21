//
//  ZPLineFlowLayout.m
//  自定义布局
//
//  Created by gongwan2 on 2017/11/17.
//  Copyright © 2017年 zp. All rights reserved.
//

#import "ZPLineFlowLayout.h"

@implementation ZPLineFlowLayout


- (void)prepareLayout {
    [super prepareLayout];
    CGFloat inset = (self.collectionView.frame.size.width - self.itemSize.width) * 0.5;
    self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    CGRect rect = CGRectMake(proposedContentOffset.x, 0, self.collectionView.frame.size.width, self.collectionView.frame.size.height);
    NSArray<UICollectionViewLayoutAttributes *> *array = [super layoutAttributesForElementsInRect:rect];
    // 中心点的x
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.bounds.size.width * 0.5;
    CGFloat perX = CGFLOAT_MAX;
    CGFloat dis = 0;
    for (UICollectionViewLayoutAttributes *attrs in array) {
        // 距离的绝对值
        CGFloat distence = ABS(attrs.center.x - centerX);
        if (distence < perX) {
            perX = distence;
            dis = attrs.center.x - centerX;
        }
    }
    proposedContentOffset.x += dis;
    return proposedContentOffset;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray<UICollectionViewLayoutAttributes *> *array = [super layoutAttributesForElementsInRect:rect];
    // 中心点的x
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.bounds.size.width * 0.5;
    for (UICollectionViewLayoutAttributes *attrs in array) {
        // 距离的绝对值
        CGFloat distence = ABS(attrs.center.x - centerX);
        CGFloat scale = 1 - (distence / (self.collectionView.frame.size.width + 800));
        attrs.transform = CGAffineTransformMakeScale(scale, scale);
    }
    return array;
}

@end
