//
//  Vocabulary.h
//  My Vocabularies
//
//  Created by Hans-Eric Grönlund on 9/4/12.
//  Copyright (c) 2012 Hans-Eric Grönlund. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Vocabulary : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *words;
@end

@interface Vocabulary (CoreDataGeneratedAccessors)

- (void)addWordsObject:(NSManagedObject *)value;
- (void)removeWordsObject:(NSManagedObject *)value;
- (void)addWords:(NSSet *)values;
- (void)removeWords:(NSSet *)values;

@end
