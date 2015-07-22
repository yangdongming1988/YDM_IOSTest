//
//  WisecanAppDelegate.m
//  真机调试练习
//
//  Created by wisecan on 13-12-9.
//  Copyright (c) 2013年 wisecan. All rights reserved.
//

#import "WisecanAppDelegate.h"

@implementation WisecanAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
#if DEBUG
    NSLog(@"当前是调试模式");
#endif
    NSLog(@"%@",_window);
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"进入后台");
    [[UIApplication sharedApplication]  beginBackgroundTaskWithExpirationHandler:nil];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    NSLog(@"进入前台");
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
/*
 git branch testing //新建一个testing分支，git branch 命令，仅仅是建立了一个新的分支，但不会自动切换到这个分支中去
 git checkout testing //切换到testing分支
 
 git status //获取哪些文件当前处于什么状态
 
 git add README //开始追踪一个新文件
 
 git commit -m "本次修改说明"
 
 git commit -a -m "本次修改说明"
 
 git log //查看提交历史
 
 git log -p -2 //-p选项表示显示每次提交的内容差异；-2选项表示仅仅显示最近的两次更新
 
 git log --stat //仅显示简要的增改行数统计
 
 git log --pretty=oneline //--pretty选项可以指定不同的方式展示
 git log --pretty-format:"%h - %an, %ad : %s"
 
 git fetch 远程仓库名字 //fetch命令指示将远端的数据拉去到本地仓库，并不自动合并到当前的工作分支
 git pull 远程仓库名字 //pull命令自动赚取数据下来，然后将远端分支自动合并到本地仓库中当前分支
 
 git checkout -b is53//新建并切换到is53分支
 
 git branch -d is53 //删除分支is53
 
 */

@end
