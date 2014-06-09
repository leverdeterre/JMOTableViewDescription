//
//  JMOTableViewDescriptionHeaders.h
//  TableViewDescription
//
//  Created by Jerome Morissard on 6/9/14.
//  Copyright (c) 2014 Jerome Morissard. All rights reserved.
//


#ifndef iAppInfos_LogMacro_h
#define iAppInfos_LogMacro_h

// Log using the same parameters above but include the function name and source code line number in the log statement
#ifdef DEBUG
#define JMOLog(fmt, ...) NSLog((@"Func: %s, Line: %d, " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define JMOLog(...)
#endif

#endif

#ifndef TableViewDescription_JMOTableViewDescriptionHeaders_h
#define TableViewDescription_JMOTableViewDescriptionHeaders_h

//Controllers
#import "JMOViewControllerWithTableViewDescription.h"
#import "JMOTableViewControllerWithTableViewDescription.h"

//Models
#import "JMOTableViewDescriptionModels.h"

//Protocols
#import "JMOTableViewDescriptionCellUpdate.h"
#import "JMOTableViewDescriptionSectionUpdate.h"
#import "JMOTableViewDescriptionDelegate.h"

//UI
#import "JMOTableViewDescriptionUI.h"

#endif