//
//  Todo.m
//  Every.Do
//
//  Created by Aaron Chong on 1/30/18.
//  Copyright © 2018 Aaron Chong. All rights reserved.
//

#import "Todo.h"

@implementation Todo

- (instancetype)initWithTitle:(NSString *)title todoDescription:(NSString *)description priorityNumber:(NSInteger)number isCompleted:(BOOL)isCompleted {
    
    self = [super init];
    if (self) {
        
        _title = title;
        _todoDescription = description;
        _priorityNumber = number;
        _isCompleted = isCompleted;
    }
    
    return self;
}

@end
