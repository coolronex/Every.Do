//
//  NewTodoViewController.h
//  Every.Do
//
//  Created by Aaron Chong on 1/30/18.
//  Copyright © 2018 Aaron Chong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewTodoViewController : UIViewController

@property (strong, nonatomic) NSString *itemTitle;
@property (strong, nonatomic) NSString *itemDescription;
@property (assign, nonatomic) NSInteger itemPriorityNumber;


@end
