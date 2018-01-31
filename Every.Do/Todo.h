//
//  Todo.h
//  Every.Do
//
//  Created by Aaron Chong on 1/30/18.
//  Copyright © 2018 Aaron Chong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Todo : UIView

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *todoDescription;
@property (assign, nonatomic) NSInteger priorityNumber;
@property (assign, nonatomic) BOOL isCompleted;


- (instancetype) initWithTitle:(NSString *)title todoDescription:(NSString *)description priorityNumber:(NSInteger)number isCompleted:(BOOL)isCompleted;

@end
