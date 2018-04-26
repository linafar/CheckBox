//
//  TestViewController.m
//  RefreshTest
//
//  Created by imac on 16/8/12.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "TestViewController.h"
#import "TestCell.h"

@interface TestViewController ()<UITableViewDelegate,UITableViewDataSource,TestCellDelegate>

@property (strong,nonatomic) UITableView *tableView;
//选项数组
@property (strong,nonatomic) NSMutableArray *testArr;
//选中数据存储数组
@property (strong,nonatomic) NSMutableArray *chooseArr;
@end

@implementation TestViewController
#pragma mark ==获取tableview的选项假数据==
- (void)getData{
    _chooseArr = [NSMutableArray array];
    _testArr = [NSMutableArray array];
     NSArray *titleArr = @[@"开心",@"生气",@"难过",@"无感"];
    for (int i =0; i<4; i++) {
        [_testArr addObject:titleArr[i]];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"多项选择";
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self getData];
    [self initView];
}

- (void)initView{
    self.automaticallyAdjustsScrollViewInsets= NO;
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, __kWidth, __kHeight-64)];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;

}


#pragma mark -UITableView- Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _testArr.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TestCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TestCell"];
    if (!cell) {
        cell = [[TestCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TestCell"];
    }
    cell.testLb.text = _testArr[indexPath.row];
    cell.testBtn.tag = indexPath.row;
    cell.delegate = self;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

#pragma mark -TestCell Delegate
-(void)SelectedCell:(UIButton *)sender{
    if (sender.selected) {
        [_chooseArr addObject:_testArr[sender.tag]];//选中添加
    }else{
        [_chooseArr removeObject:_testArr[sender.tag]];//再选取消
    }
    for (int i=0; i<_chooseArr.count; i++) {
        NSLog(@"%@",_chooseArr[i]);//便于观察选中后的数据
    }
    NSLog(@"==============");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
