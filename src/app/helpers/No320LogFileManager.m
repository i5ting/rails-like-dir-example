//
//  No320FileM.m
//  rails-like-dir-example
//
//  Created by sang on 3/14/13.
//  Copyright (c) 2013 no320.com. All rights reserved.
//

#import "No320LogFileManager.h"


@implementation UIResponder(No320LogFileManager)

- (void)setNo320LogConfig
{
    
    No320LogFileManager *m = [[No320LogFileManager new] autorelease];
    DDFileLogger *fileLogger = [[DDFileLogger alloc] initWithLogFileManager:m];
    
    fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
     
    
    [DDLog addLogger:fileLogger];
    
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    
}

@end


@implementation No320LogFileManager

#pragma mark - Override

/**
 * 覆盖父类方法
 *
 * 如果想使用默认日志路径，可以修改此方法名或注释调
 *
 * Returns the path to the default logs directory.
 * If the logs directory doesn't exist, this method automatically creates it.
 *
 */
- (NSString *)defaultLogsDirectory
{
#if TARGET_OS_IPHONE    
    NSString *logsDirectory = @"/Users/dudan/work/git/rails-like-dir-example/src/log/";
#else
    //todo other platform
	NSString *appName = [[NSProcessInfo processInfo] processName];
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
	NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : NSTemporaryDirectory();
	NSString *logsDirectory = [[basePath stringByAppendingPathComponent:@"Logs"] stringByAppendingPathComponent:appName];
    
#endif
    
	return logsDirectory;
}



/**
 * Generates a new unique log file path, and creates the corresponding log file.
 **/
- (NSString *)createNewLogFile
{
	// Generate a random log file name, and create the file (if there isn't a collision)
	
	NSString *logsDirectory = [self defaultLogsDirectory];
	do
	{
		NSString *fileName = [NSString stringWithFormat:@"log-%@.txt", @"no320-alfred.sang"];
		
		NSString *filePath = [logsDirectory stringByAppendingPathComponent:fileName];
		
		if (![[NSFileManager defaultManager] fileExistsAtPath:filePath])
		{
//			NSLogVerbose(@"DDLogFileManagerDefault: Creating new log file: %@", fileName);
			
			[[NSFileManager defaultManager] createFileAtPath:filePath contents:nil attributes:nil];
			
			// Since we just created a new log file, we may need to delete some old log files
//			[self deleteOldLogFiles];
			
			return filePath;
		}
		
	} while(YES);
}


@end
