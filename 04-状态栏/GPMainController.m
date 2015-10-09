//
//  GPMainController.m
//  04-状态栏
//
//  Created by qianfeng on 15-10-9.
//  Copyright (c) 2015年 肖喆. All rights reserved.
//

#import "GPMainController.h"
#import "UINavigationBar+Status.h"

@interface GPMainController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,weak)UIView * backGorundView;
@end

@implementation GPMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hengda"]];
    imageView.frame = CGRectMake(0, -64, 375, 264);
    UIView *  contentViewImageView = [[UIView alloc] init];
    
    [contentViewImageView addSubview:imageView];
    contentViewImageView.frame = CGRectMake(0, 0, 375, 200);
    contentViewImageView.backgroundColor = [UIColor yellowColor];
    
    self.tableView.tableHeaderView = contentViewImageView;
    
    //这两种方式,改变navigationBar的alpha值,会导致导航栏上的按钮也都透明
//    self.navigationController.navigationBar.backgroundColor = [UIColor blueColor];
//    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
    
    /*
    UIView * backGorundView = [[UIView alloc] init];
   
    backGorundView.frame = CGRectMake(0, -20, self.navigationController.navigationBar.frame.size.width, 64);
//    backGorundView.backgroundColor = [UIColor blueColor];
    //添加到navigationBar 最底层
    [self.navigationController.navigationBar insertSubview:backGorundView atIndex:0];
    //让navigationBar没有任何颜色
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    //去掉阴影线
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    self.backGorundView = backGorundView;
    */
    

    self.tableView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar nav_setBackgroundColor:[UIColor clearColor]];
    self.tableView.delegate = self;
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.navigationController.navigationBar nav_clear];
    self.tableView.delegate = nil;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    self.navigationController.navigationBar.alpha = 0;
    
    UIColor * color = [UIColor colorWithRed:86/255.0 green:165/255.0 blue:249/255.0 alpha:1];
    
    CGFloat offSetY = scrollView.contentOffset.y;
    
    if (offSetY > 50)
    {
        CGFloat alpha = 1 - (100 - offSetY) / 50;
//        self.backGorundView.backgroundColor = [color colorWithAlphaComponent:alpha];
        
        [self.navigationController.navigationBar nav_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
    }
    else
    {
//        self.backGorundView.backgroundColor = [color colorWithAlphaComponent:0];
         [self.navigationController.navigationBar nav_setBackgroundColor:[color colorWithAlphaComponent:0]];
    }
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc] init];
    
    cell.textLabel.text = @"test";
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"header";
}
@end
