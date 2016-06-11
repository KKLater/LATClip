//
//  ViewController.m
//  LATClipDemo
//
//  Created by Later on 16/6/3.
//  Copyright © 2016年 Later. All rights reserved.
//

#import "ViewController.h"
#import "LATClipHeader.h"
@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    //    /** 圆角图片设置 */
    //    self.imageView=[[UIImageView alloc]initWithFrame:CGRectMake(100,200, 100, 100)];
    //    [self.imageView clipWithCornerRadius:LATRadiusMake(40, 40, 40, 40) backgroundImage:[UIImage imageNamed:@"IMG_0230.GIF"]];
    //    [self.view addSubview:self.imageView];
    //
    //    /** 圆角视图 */
    //    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(100, 400, 80, 80)];
    //    view2.backgroundColor = [UIColor redColor];
    //    [view2 clipWithCorners:UIRectCornerBottomLeft | UIRectCornerTopRight cornerRadiusSize:CGSizeMake(20, 20) backgroundColor:view2.backgroundColor];
    //    [self.view addSubview:view2];
    //
    //    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(100, 500, 100, 100)];
    //    view3.backgroundColor = [UIColor greenColor];
    //    [view3 clipWithCornerRadius:LATRadiusMake(10, 30, 20, 120) borderWidth:3 borderColor:[UIColor redColor] backgroundColor:view3.backgroundColor];
    //    [self.view addSubview:view3];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tableView.frame = self.view.bounds;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
    cell.backgroundColor = [UIColor colorWithWhite:1 alpha:0];
    [cell.contentView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
    [imageView clipToRountWithBackgroundImage:[UIImage imageNamed:@"IMG_0230.GIF"]];
    [cell.contentView addSubview:imageView];
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 20, 100, 20)];
    [label clipWithCornerRadius:LATRadiusMake(5, 10, 4, 6) borderWidth:1 borderColor:[UIColor redColor] backgroundColor:[UIColor whiteColor]];
    label.text = @"jhjahdjkhkjhkhjkhdkjk";
    [cell.contentView addSubview:label];
    
    UIImageView *offScreenImage = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(label.bounds) + CGRectGetWidth(label.bounds) + 10, 10, 40, 40)];
    offScreenImage.image = [UIImage imageNamed:@"1438755843749.jpg"];
    offScreenImage.layer.cornerRadius = 20;
    offScreenImage.layer.masksToBounds = YES;
    [cell.contentView addSubview:offScreenImage];

    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.rowHeight = 60;
        _tableView.backgroundColor = [UIColor colorWithWhite:1 alpha:0];
    }
    return _tableView;
}
@end
