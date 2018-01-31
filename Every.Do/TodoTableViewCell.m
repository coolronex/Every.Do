//
//  TodoTableViewCell.m
//  Every.Do
//
//  Created by Aaron Chong on 1/30/18.
//  Copyright © 2018 Aaron Chong. All rights reserved.
//

#import "TodoTableViewCell.h"

@implementation TodoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


}

- (void) setTodo:(Todo *)todo {
    
    _todo = todo;
    [self configureCell];
}

- (void)configureCell {
    
    self.titleLabel.text = self.todo.title;
    self.descriptionLabel.text = self.todo.todoDescription;
    self.priorityNumberLabel.text = [NSString stringWithFormat:@"%ld", self.todo.priorityNumber];
    
    if (self.todo.isCompleted == YES) {

        NSDictionary *attributes = @{NSStrikethroughStyleAttributeName: @(NSUnderlineStyleSingle),
                                     NSStrikethroughColorAttributeName: [UIColor redColor]};
        NSAttributedString *title = [[NSAttributedString alloc] initWithString:self.todo.title attributes:attributes];
        [self.titleLabel setAttributedText:title];

    }
}

- (IBAction)isCompletedButton:(UIButton *)sender {
    
    if (self.todo.isCompleted == NO) {
        
        NSDictionary *attributes = @{NSStrikethroughStyleAttributeName: @(NSUnderlineStyleSingle),
                                     NSStrikethroughColorAttributeName: [UIColor redColor]};
        NSAttributedString *title = [[NSAttributedString alloc] initWithString:self.todo.title attributes:attributes];
        
        self.todo.isCompleted = YES;
        [self.titleLabel setAttributedText:title];
        
    } else if (self.todo.isCompleted == YES) {
        
        NSMutableAttributedString *originalMutableAttributedString = [[NSMutableAttributedString alloc] initWithString:self.todo.title];
        NSRange originalRange = NSMakeRange(0, originalMutableAttributedString.length);
        [originalMutableAttributedString setAttributes:@{} range:originalRange];
        [self.titleLabel setAttributedText:originalMutableAttributedString];
        
        self.todo.isCompleted = NO;
        }
}



@end
