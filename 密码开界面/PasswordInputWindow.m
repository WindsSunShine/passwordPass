//
//  PasswordInputWindow.m
//  密码开界面
//
//  Created by 张建军 on 16/6/29.
//  Copyright © 2016年 张建军. All rights reserved.
//

#import "PasswordInputWindow.h"

@implementation PasswordInputWindow{
    
    
    UITextField * _textField;
}



+(PasswordInputWindow *)sharedInstance{
    
    
    static id sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
        
    });
    
    
    return sharedInstance;
    
}



-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];

    if (self) {
        UILabel * lable = [[UILabel alloc]initWithFrame:CGRectMake(10, 50, 200, 20)];
        lable.text = @"请输入密码:";
        [self addSubview:lable];
        
        
        UITextField * textField = [[UITextField alloc]initWithFrame:CGRectMake(10, 150, 200, 44)];
        textField.backgroundColor = [UIColor purpleColor];
        textField.secureTextEntry = YES;
        [self addSubview:textField];
        
        
        
        UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(10, 110, 200, 44)];
        [button setBackgroundColor:[UIColor blueColor]];
        button.titleLabel.textColor = [UIColor blackColor];
        [button setTitle:@"确定" forState:(UIControlStateNormal)];
        [button addTarget:self action:@selector(completeButtonPressed:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:button];
        
        self.backgroundColor = [UIColor yellowColor];
        
        _textField = textField;
        
        
        
        
        
        
                
        
        
        
        
    }
    
    return  self;
}


-(void)enterCode:(NSString *)code
{
    if ([_textField.text isEqualToString:@"abcdef"]) {
        
        
        [_textField resignFirstResponder];
        
        [self resignKeyWindow];
        
        self.hidden = YES;
        
    }else{
        
        [self showErrorAlertView];
        
       
        
    }
    
    

    

}



-(void)show {
    
    
    [self makeKeyWindow];
    
    self.hidden = NO;
    
    
    
}




-(void)completeButtonPressed:(id)sender {
    
    if ([_textField.text isEqualToString:@"abcd"]) {
        
        
        [_textField resignFirstResponder];
        
        [self resignKeyWindow];
        
        self.hidden = YES;
        
    }else{
       
        [self showErrorAlertView];
        
    }
    
    
    
    
}



-(void)showErrorAlertView {
    
    
    UIAlertView * alertView= [[UIAlertView alloc]initWithTitle:nil message:@"密码错误，正确密码是abcd" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [alertView show];
    
    _textField.text = nil;
//    [self textChange:_textField];
    
}

#pragma mark - 文本框内容改变
- (void)textChange:(UITextField *)textField {
    NSString *password = textField.text;
    if (password.length > 6) {
        return;
    }
    
}
    
 




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
