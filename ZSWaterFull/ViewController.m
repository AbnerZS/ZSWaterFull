//
//  ViewController.m
//  ZSWaterFull
//
//  Created by abnerzhang on 2016/11/8.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

#import "ViewController.h"
#import "ZSWaterfullLayout.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

static NSString *const cellIdentifier = @"cellIdentifier";


@interface ViewController ()<ZSCollectionViewLayoutDelegte, UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // 测试数据
    self.dataSource = [NSMutableArray array];
    for (int i = 0; i < 40; i++) {
        float arc = arc4random() % 100 + 50;
        [self.dataSource addObject:[NSNumber numberWithFloat:arc]];
    }
    
    [self.view addSubview:self.collectionView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        
        ZSWaterfullLayout *layout = [[ZSWaterfullLayout alloc] init];
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        layout.minimumColumnSpacing = 10;
        layout.minimumInteritemSpacing = 15;
        //layout.headerHeight = 200;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:layout];
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor greenColor];
        [_collectionView registerClass:[UICollectionViewCell class]
            forCellWithReuseIdentifier:cellIdentifier];
    }
    return _collectionView;
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell =
    [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSNumber *num = self.dataSource[indexPath.row];
    float arc = [num floatValue];
    
    CGSize size = CGSizeMake((SCREEN_WIDTH - 30) / 3, arc);
    return size;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%zi", indexPath.row);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
