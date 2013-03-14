//
//  No320FileM.h
//  rails-like-dir-example
//
//  Created by sang on 3/14/13.
//  Copyright (c) 2013 no320.com. All rights reserved.
//


#import "DDLog.h"
#import "DDASLLogger.h"
#import "DDTTYLogger.h"
#import "DDFileLogger.h"


//定义日志级别
static const int ddLogLevel = LOG_LEVEL_VERBOSE;


/**
 * 扩展UIResponder
 *
 */
@interface UIResponder(No320LogFileManager)

- (void)setNo320LogConfig;

@end



@interface No320LogFileManager : DDLogFileManagerDefault

@end
