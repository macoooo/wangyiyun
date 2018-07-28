//
//  AccountViewController.m
//  网易云账号
//
//  Created by 强淑婷 on 2018/7/24.
//  Copyright © 2018年 强淑婷. All rights reserved.
//

#import "AccountViewController.h"

@interface AccountViewController ()

@end

@implementation AccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"账号";
    //self.title.
    //self.navigationController.title = @"账号";
    
    //导航栏标题文字颜色
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:18.0],NSFontAttributeName,nil];
    
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    UIButton *btnImage = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnImage addTarget:self action:@selector(pressRight) forControlEvents:UIControlEventTouchUpInside];
    btnImage.frame = CGRectMake(370, 8, 40, 40);
    UIImage *image = [UIImage imageNamed:@"背景音乐.png"];
    [btnImage setImage:image forState:UIControlStateNormal];
    [self.navigationController.navigationBar addSubview:btnImage];
    
     [self creatTableView];
}

- (void) creatTableView
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    _arrayData = [[NSMutableArray alloc] init];
    
    NSArray *array01 = [NSArray arrayWithObjects:@"",nil];
    NSArray *array02 = [NSArray arrayWithObjects:@"我的消息",nil];
    NSArray *array03 = [NSArray arrayWithObjects:@"会员中心", @"", @"在线听歌免流量",nil];
    NSArray *array04 = [NSArray arrayWithObjects:@"设置", @"扫一扫", @"",@"", @"定时关闭", @"音乐闹钟",@"驾驶模式", @"优惠劵", nil];
    NSArray *array05 = [NSArray arrayWithObjects:@"分享网易云音乐",@"关于",nil];
    NSArray *array06 = [NSArray arrayWithObjects:@"",nil];
    
    [_arrayData addObject:array01];
    [_arrayData addObject:array02];
    [_arrayData addObject:array03];
    [_arrayData addObject:array04];
    [_arrayData addObject:array05];
    [_arrayData addObject:array06];
}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0){
        return 100;
    }
    return 50;
}
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *str = @"cell";
    UITableViewCell *cell = nil;
    UITableViewCell *cell01 = nil;
    UITableViewCell *cell02 = nil;
    UITableViewCell *cell04 = nil;
    UITableViewCell *cell05 = nil;
    
    cell = [_tableView dequeueReusableCellWithIdentifier:str];
    cell01 = [_tableView dequeueReusableCellWithIdentifier:@"cell01"];
    cell02 = [_tableView dequeueReusableCellWithIdentifier:@"cell02"];
    cell04 = [_tableView dequeueReusableCellWithIdentifier:@"cell04"];
    cell05 = [_tableView dequeueReusableCellWithIdentifier:@"cell05"];
    
    if(indexPath.section == 0){
        if(cell01 == nil){
            cell01 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell01"];
           // cell01.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
            
            UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(135, 70, 50, 25)];
            btn2.layer.masksToBounds = YES;
            btn2.layer.borderWidth = 0.9;
            btn2.layer.borderColor = [UIColor grayColor].CGColor;
            btn2.layer.cornerRadius = 10;
            [btn2 setTitle:@"Lv10" forState:UIControlStateNormal];
            [btn2 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
            
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(330, 20, 80, 40)];
            btn.layer.masksToBounds = YES;
            btn.layer.borderWidth = 0.5;
            btn.layer.borderColor = [UIColor grayColor].CGColor;
            btn.layer.cornerRadius = 5;
            [btn setTitle:@"签到" forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:@"签到图"] forState:UIControlStateNormal];
            [btn setTitle:@"已签到" forState:UIControlStateSelected];
//            [btn setImage:nil forState:UIControlStateSelected];
            
            [btn addTarget:self action:@selector(pressRight:) forControlEvents:UIControlEventTouchUpInside];
            
            [cell01.contentView addSubview:btn2];
            [cell01.contentView addSubview:btn];
        }
        cell01.textLabel.text = @"阡陌";
        cell01.imageView.image = [UIImage imageNamed:@"头像.jpeg"];
        return cell01;
    }
    else if((indexPath.section == 2 && indexPath.row == 1) || (indexPath.section == 3 && indexPath.row == 2)){
        if(cell02 == nil){
            cell02 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell02"];
        }
        NSArray *arrayss = [NSArray arrayWithObjects:@"商城",@"个性换肤", nil];
        NSArray *arrayst = [NSArray arrayWithObjects:@"高丝蛋白水",@"自选颜色", nil];
        cell02.textLabel.text = arrayss[indexPath.section - 2];
        cell02.imageView.image = [UIImage imageNamed:arrayss[indexPath.section - 2]];
        cell02.detailTextLabel.text = arrayst[indexPath.section -2];
        return cell02;
    }
    else if(indexPath.section == 3 && indexPath.row == 3){
        if(cell04 == nil){
            cell04 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell04"];
            
            UISwitch *mySwitch = [[UISwitch alloc] init];
            mySwitch.frame = CGRectMake(350, 15, 80, 40);
            mySwitch.on = YES;
            [cell04.contentView addSubview:mySwitch];
        }
        cell04.textLabel.text = @"夜间模式";
        cell04.imageView.image = [UIImage imageNamed:@"夜间模式"];
        return cell04;
    }
    else if(indexPath.section == 5){
        if(cell05 == nil){
            cell05 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell05"];
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(180, 10, 80, 40)];
            [btn setTitle:@"退出登录" forState:UIControlStateNormal];
           [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];

            //btn.titleLabel.textColor = [UIColor redColor];
            [btn addTarget:self action:@selector(pressAlert:) forControlEvents:UIControlEventTouchUpInside];
            [cell05.contentView addSubview:btn];
            
        }
//        cell05.textLabel.text = @"退出登录";
//        cell05.textLabel.textAlignment = NSTextAlignmentCenter;
        return cell05;
    }
    else{
        if(cell == nil){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        cell.textLabel.text = _arrayData[indexPath.section][indexPath.row];
        cell.imageView.image =[UIImage imageNamed:_arrayData[indexPath.section][indexPath.row]];
        return cell;
    }
}
- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    //获取头部高度
    return @" ";
}
- (NSString *) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @" ";
}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}


- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return _arrayData.count;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger numRow = [[_arrayData objectAtIndex:section] count];
    return numRow;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) pressRight:(UIButton *) btn
{
    btn.selected = !btn.selected;
    if (!btn.selected) {
       [btn setImage:[UIImage imageNamed:@"签到图"] forState:UIControlStateNormal];
    }else{
       [btn setImage:nil forState:UIControlStateNormal];
    }
}
- (IBAction)pressAlert:(UIButton *)sender {
    //显示弹出框列表选择
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Title"
                                                                   message:@"This is an Sheet."
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * action) {
                                                             //响应事件
                                                             NSLog(@"action = %@", action);
                                                         }];
    UIAlertAction* deleteAction = [UIAlertAction actionWithTitle:@"确定退出" style:UIAlertActionStyleDestructive
                                                         handler:^(UIAlertAction * action) {
                                                             //响应事件
                                                             NSLog(@"action = %@", action);
                                                         }];
    UIAlertAction* saveAction = [UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * action) {
                                                           //响应事件
                                                           NSLog(@"action = %@", action);
                                                       }];
    [alert addAction:saveAction];
    [alert addAction:cancelAction];
    [alert addAction:deleteAction];
    [self presentViewController:alert animated:YES completion:nil];
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
