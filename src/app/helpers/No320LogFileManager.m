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
    NSString *logsDirectory = @"";
    return [self getLogDirectory];
//    log_info(@"%@",logsDirectory);
//    NSString *logsDirectory = NO320_LOG_DIR;
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
    CFUUIDRef uuid = CFUUIDCreate(NULL);
	CFStringRef fullStr = CFUUIDCreateString(NULL, uuid);

    NSError *error = nil;
	NSString *logsDirectory = [self defaultLogsDirectory];
	do
	{
        
        log_info(@"日志文件名称 = %@",fullStr);
		NSString *fileName = [NSString stringWithFormat:@"log-%@.txt", fullStr];
		
		NSString *filePath = [logsDirectory stringByAppendingPathComponent:fileName];
		if (![[NSFileManager defaultManager] fileExistsAtPath:filePath])
		{
//			NSLogVerbose(@"DDLogFileManagerDefault: Creating new log file: %@", fileName);
			
//			[[NSFileManager defaultManager] createFileAtPath:filePath contents:nil attributes:nil];
			 
            [[NSFileManager defaultManager] removeItemAtPath:filePath error:&error];
            [[NSFileManager defaultManager] createFileAtPath:filePath contents:nil attributes:nil];
            
			return filePath;
		}else{
           
        }
		
	} while(YES);
    
    
    CFRelease(fullStr);
	CFRelease(uuid);
}

#pragma mark - Private Methods Implementions

-(NSString *)getRootDirectoryWithBeforeLevel:(int)blevel
{
    NSString *current_dir = [NSString stringWithFormat:@"%s",__FILE__];
    log_info(@"current_dir = %@",current_dir);
    return [self getDirectory:current_dir withBeforeLevel:blevel];
}

-(NSString *)getLogDirectory
{
    log_info(@"log dir = %@",[self getRootDirectoryWithBeforeLevel:CUR_FILE_TO_PROJECT_HOME_BEFORE_LEVEL]);
    NSString *log_dir = [NSString stringWithFormat:@"%@/%@",[self getRootDirectoryWithBeforeLevel:CUR_FILE_TO_PROJECT_HOME_BEFORE_LEVEL],@"src/log/"];
    log_info(@"log_dir = %@",log_dir);
    return log_dir;
}

-(NSString *)getDirectory:(NSString *)current_dir withBeforeLevel:(int)blevel
{
    //NSString *current_dir = [NSString stringWithFormat:@"%s",__FILE__];
    NSMutableArray *dir_arr = [NSMutableArray arrayWithArray:[current_dir componentsSeparatedByString:@"/"]];
    
    for (int i = 0; i< blevel; i++) {
        [dir_arr removeObjectAtIndex:[dir_arr count]-1];
    }
    
    return [dir_arr componentsJoinedByString:@"/"];
}

-(void)deleteOldLogFiles
{
//    
//    CFUUIDRef uuid = CFUUIDCreate(NULL);
//	CFStringRef fullStr = CFUUIDCreateString(NULL, uuid);
//	//NSString *result = (NSString *)CFStringCreateWithSubstring(NULL, fullStr, CFRangeMake(0, 6));
//	
//    NSString *fileName = [NSString stringWithFormat:@"log-%@.txt", @"no320-alfred.sang"];
//    NSString *filePath = [[self getLogDirectory] stringByAppendingPathComponent:fileName];
//    
//    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath])
//    {
//        NSString *fileName_copy =  [NSString stringWithFormat:@"log-%@.log", fullStr];
//        NSString *filePath2= [[self getLogDirectory] stringByAppendingPathComponent:fileName_copy];
//        
//        NSError *error = nil;
//        //判断是否移动
//        if ([[NSFileManager defaultManager] moveItemAtPath:filePath toPath:filePath2 error:&error] != YES)
//        {
//             NSLog(@"Unable to move file: %@", [error localizedDescription]);
//             //显示文件目录的内容
//             NSLog(@"Documentsdirectory: %@",[[NSFileManager defaultManager] contentsOfDirectoryAtPath:filePath2 error:&error]);
//        }
//    }
//    
//    [[NSFileManager defaultManager] createFileAtPath:filePath contents:nil attributes:nil];
//
//    CFRelease(fullStr);
//	CFRelease(uuid);
}

@end
