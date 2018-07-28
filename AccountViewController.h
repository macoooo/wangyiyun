//
//  AccountViewController.h
//  网易云账号
//
//  Created by 强淑婷 on 2018/7/24.
//  Copyright © 2018年 强淑婷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountViewController : UIViewController
<
UITableViewDelegate,
UITableViewDataSource
>
{
    UITableView *_tableView;
    NSMutableArray *_arrayData;
    NSMutableArray *_arrayImage;
}

@end
