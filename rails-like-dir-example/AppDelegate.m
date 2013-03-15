//
//  AppDelegate.m
//  rails-like-dir-example
//
//  Created by sang on 3/14/13.
//  Copyright (c) 2013 alfred sang. All rights reserved.
//

#import "AppDelegate.h"

//#import "No320LogFileManager.h"


@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
      
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [self setNo320LogConfig];
    
 
    UIButton *t = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    t.frame = CGRectMake(120, 100, 100, 50);
    [t setTitle:@"产生日志吧" forState:UIControlStateNormal];
    [t addTarget:self action:@selector(createlog) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:t];
    
    return YES;
}

 

-(void)createlog
{
//    CFUUIDRef uuid = CFUUIDCreate(NULL);
//	CFStringRef fullStr = CFUUIDCreateString(NULL, uuid);
//	NSString *result = (NSString *)CFStringCreateWithSubstring(NULL, fullStr, CFRangeMake(0, 6));
//	
//    
//    DDLogInfo(@"%@",(NSString *)fullStr);
//    DDLogWarn(@"%@",result);
//    DDLogError(@"%@",(NSString *)fullStr);
//    DDLogVerbose(@"%@",result);
//    
//    for (int i = 0; i<10; i++) {
//        
//        
//        
//        DDLogInfo(@"%s:%d:%s:%s\n", __func__, __LINE__, __FILE__,__PRETTY_FUNCTION__);
//        DDLogInfo(@"%@\n",NSStringFromSelector(_cmd));
//        DDLogInfo(@"%@\n",NSStringFromClass([self class]));
//        DDLogInfo(@"%@\n",[NSString stringWithUTF8String:__FILE__] );
//        DDLogInfo(@"%@\n",[NSThread callStackSymbols]);
//        
//    }
//    
//    
//    CFRelease(fullStr);
//	CFRelease(uuid);
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
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
