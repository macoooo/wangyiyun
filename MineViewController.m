//
//  MineViewController.m
//  网易云账号
//
//  Created by 强淑婷 on 2018/7/24.
//  Copyright © 2018年 强淑婷. All rights reserved.
//

#import "MineViewController.h"
//#import "CustomTableViewCell.h"
//#import "QSTTableViewCell.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"我的音乐";
    //self.title.
    //self.navigationController.title = @"账号";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    //导航栏标题文字颜色
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:18.0],NSFontAttributeName,nil];

    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    UIButton *btnImage = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnImage addTarget:self action:@selector(pressRight) forControlEvents:UIControlEventTouchUpInside];
    btnImage.frame = CGRectMake(370, 8, 40, 40);
    UIImage *image = [UIImage imageNamed:@"背景音乐.png"];
    [btnImage setImage:image forState:UIControlStateNormal];
    [self.navigationController.navigationBar addSubview:btnImage];

    UIBarButtonItem *btnImage2 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"云朵"] style:UIBarButtonItemStylePlain target:nil action:@selector(pressLeft)];
    self.navigationItem.leftBarButtonItem = btnImage2;
    [self creatTableView];
    // Do any additional setup after loading the view.
}

- (void) creatTableView
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    //自定义类需要使用这个方法
    //[_tableView registerClass:[QSTTableViewCell class] forCellReuseIdentifier:@"qstCell"];

    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell2 = nil;
    UITableViewCell *cell = nil;
    UITableViewCell *cell1 = nil;

    cell2 = [_tableView dequeueReusableCellWithIdentifier:@"cell2"];
    cell = [_tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell1 = [_tableView dequeueReusableCellWithIdentifier:@"cell1"];
    
    if(indexPath.section == 0){
        if(cell == nil){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        }
        NSArray *array01 = [NSArray arrayWithObjects:@"本地音乐",@"最近播放", @"我的电台", @"我的收藏",nil];
         NSArray *array02 = [NSArray arrayWithObjects:@"279", @"101", @"0",@"专辑/歌手/视频/专栏",nil];
        cell.detailTextLabel.text = array02[indexPath.row];
        cell.textLabel.text = array01[indexPath.row];
        cell.imageView.image = [UIImage imageNamed:array01[indexPath.row]];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    else if(indexPath.section == 1){
        if(cell1 == nil){
            cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell1"];
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(120, 28, 20, 20);
            UIImage *icon01 = [UIImage imageNamed:@"btn02"];
            UIImage *icon02 = [UIImage imageNamed:@"btn03"];
            
            [btn setImage:icon01 forState:UIControlStateNormal];
            [btn setImage:icon02 forState:UIControlStateSelected];
            [btn addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
            [cell1.contentView addSubview:btn];
        }
        
        NSArray *array1 = [NSArray arrayWithObjects:@"我喜欢的音乐",@"英语",nil];
        NSArray *array3 = [NSArray arrayWithObjects:@"我喜欢的音乐.jpg",@"英语.jpg",nil];
        NSArray *array2 = [NSArray arrayWithObjects:@"79首", @"10首",nil];
        cell1.textLabel.text = array1[indexPath.row];
        cell1.detailTextLabel.text = array2[indexPath.row];
        cell1.imageView.image = [UIImage imageNamed:array3[indexPath.row]];
        return cell1;
    }
    else{
        if(cell2 == nil){
            cell2 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell2"];
        }
        NSArray *array05 = [NSArray arrayWithObjects:@"李易峰",@"纵使时光再旧，回味依然常新",@"尤克里里听见便是夏天的味道", @"给文艺的你一次悦耳的旅行", @"茫茫的人世，小小的幸福", @"我不喜欢这个世界，我只喜欢你",@"古风",nil];
        NSArray *array03 = [NSArray arrayWithObjects:@"李易峰.jpg",@"纵使时光再旧，回味依然常新.jpg",@"尤克里里听见便是夏天的味道.jpg", @"给文艺的你一次悦耳的旅行.jpg", @"茫茫的人世，小小的幸福.jpg", @"我不喜欢这个世界，我只喜欢你.jpg",@"古风.jpg",nil];
        NSArray *array04 = [NSArray arrayWithObjects:@"41首 by强淑婷",@"78首 by前女友", @"30首 by sun",@"30首 by熊安", @"101首 by Areal", @"126首 bylinu", @"101首 by花色游戏" ,nil];
        
        cell2.textLabel.text = array05[indexPath.row];
        cell2.detailTextLabel.text = array04[indexPath.row];
        cell2.imageView.image = [UIImage imageNamed:array03[indexPath.row]];
        return cell2;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section == 1){
            return @"我创建的歌单";
    }
    else if(section == 2){
           return @"我收藏的歌单";
    }
    return @" ";
}
- (CGFloat) tableView:(UITableView *) tableView heightForHeaderInSection:(NSInteger)section
{
    return 3;
}
- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 3;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array = [NSArray arrayWithObjects:@4, @2, @7, nil];
    return [array[section] integerValue];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) press:(UIButton *) button{
    button.selected = !button.selected;
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
