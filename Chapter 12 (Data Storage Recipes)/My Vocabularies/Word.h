//
//  Word.h
//  My Vocabularies
//
//  Created by Hans-Eric Grönlund on 9/4/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Vocabulary;

@interface Word : NSManagedObject

@property (nonatomic, retain) NSString * word;
@property (nonatomic, retain) NSString * translation;
@property (nonatomic, retain) Vocabulary *vocabulary;

@end
