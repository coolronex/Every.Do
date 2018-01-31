//
//  NewTodoViewController.m
//  Every.Do
//
//  Created by Aaron Chong on 1/30/18.
//  Copyright © 2018 Aaron Chong. All rights reserved.
//

#import "NewTodoViewController.h"

@interface NewTodoViewController () <UITextFieldDelegate, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *priorityNumberTextField;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;


@end

@implementation NewTodoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:@"save"]) {

        if ([self.titleTextField.text isEqualToString:@""]) {
            self.titleTextField.text = @"Title";
        }
        self.itemTitle = self.titleTextField.text;
        self.itemDescription = self.descriptionTextView.text;
        self.itemPriorityNumber = [self.priorityNumberTextField.text integerValue];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    
    [textView setText:@""];
}

@end
