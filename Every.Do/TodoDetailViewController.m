//
//  TodoDetailViewController.m
//  Every.Do
//
//  Created by Aaron Chong on 1/30/18.
//  Copyright © 2018 Aaron Chong. All rights reserved.
//

#import "TodoDetailViewController.h"

@interface TodoDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *todoTitleLabel;
@property (weak, nonatomic) IBOutlet UITextView *todoDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *priorityNumberLabel;

@end

@implementation TodoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.todoTitleLabel.text = self.todo.title;
    self.todoDescriptionLabel.text = self.todo.todoDescription;
    self.priorityNumberLabel.text = [NSString stringWithFormat:@"%ld", self.todo.priorityNumber];
}



@end
