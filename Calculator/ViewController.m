//
//  ViewController.m
//  Calculator
//
//  Created by takuji funao on 2015/09/25.
//  Copyright (c) 2015年 takuji funao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    
    CGFloat input_num;
    
    CGFloat input_total;
    
    CGFloat halfway_total;
    
    //calcの使い分け
    //1..割り算、2..かけ算、3..引き算、4..足し算、
    int calc;
    int before_calc;
    
    BOOL first_flg;
    
    BOOL point_flg;
    
    int point_count;

}

@property (weak, nonatomic) IBOutlet UILabel *answer_label;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    input_total = 0;

    halfway_total = 0;
    
    calc = 0;
    
    first_flg = YES;
    
    point_flg = NO;
    
    point_count = 1;

}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];

}

#pragma mark caliculate


- (IBAction)tapButton_calc:(id)sender{
    
    UIButton *button = (UIButton *)sender;
    
    calc = button.tag;
    
    [self Go_Calc];
    
}


- (void)Go_Calc{
    
    if(halfway_total){
    
        switch(before_calc){
                
            case 0:

                break;
                
            case 1: //割り算
                
                if (input_total == 0) {
                    
                    first_flg = YES;
                    
                    halfway_total = 0;
                    
                    input_total = 0;
                    
                    _answer_label.text = @"0";
                    
                    break;
                    
                }else{
                
                    halfway_total = halfway_total / input_total;
                
                    break;
                    
                }
                
            case 2: //かけ算
                
                if (input_total == 0) {
                    
                    first_flg = YES;
                    
                    halfway_total = 0;
                    
                    input_total = 0;
                    
                    _answer_label.text = @"0";
                    
                    break;
                    
                }else{
                
                    halfway_total = halfway_total * input_total;
                
                    break;
                    
                }
                
            case 3: //引き算
                
                halfway_total = halfway_total - input_total;
                
                break;
                
            case 4: //足し算
                
                halfway_total = halfway_total + input_total;
                
                break;
                
            default:
                
                break;
                
        }
        
    }else{
        
        halfway_total = input_total;
    
    }
    
    before_calc = calc;
    
    first_flg = YES;
    
    point_flg = NO;
    
    point_count = 1;
    
    NSString *halfway_total_string = [NSString stringWithFormat:@"%f", halfway_total];
    
    _answer_label.text = halfway_total_string;

}

#pragma mark direct_calc

- (IBAction)equal:(id)sender {
    
    if(halfway_total){
        
        switch(before_calc){
                
            case 0:
                
                break;
                
            case 1: //割り算
                
                if (input_total == 0) {
                    
                    first_flg = YES;
                    
                    halfway_total = 0;
                    
                    input_total = 0;
                    
                    _answer_label.text = @"0";
                    
                    break;
                    
                }else{
                
                    halfway_total = halfway_total / input_total;
                
                    break;
                    
                }
                
            case 2: //かけ算
                
                if (input_total == 0) {
                    
                    first_flg = YES;
                    
                    halfway_total = 0;
                    
                    input_total = 0;
                    
                    _answer_label.text = @"0";
                    
                    break;
                   
                }else{
                    
                    halfway_total = halfway_total * input_total;
                    
                    break;
                
                }
                
            case 3: //引き算
                
                halfway_total = halfway_total - input_total;
                
                break;
                
            case 4: //足し算
                
                halfway_total = halfway_total + input_total;
                
                break;
                
            default:
                
                break;
                
        }
    
    }
    
    NSString *halfway_total_string = [NSString stringWithFormat:@"%f", halfway_total];
    
    _answer_label.text = halfway_total_string;
    
    before_calc = 0;
    
    calc = 0;
    
    first_flg = YES;
    
    point_flg = NO;
    
    point_count = 1;

}

- (IBAction)percent:(id)sender {
    
    if(halfway_total){
        
        halfway_total = halfway_total * 0.01;
        
        NSString *halfway_total_string = [NSString stringWithFormat:@"%f", halfway_total];
        
        _answer_label.text = halfway_total_string;
        
    }else{
        
        input_total = input_total * 0.01;
        
        NSString *input_total_string = [NSString stringWithFormat:@"%f", input_total];
        
        _answer_label.text = input_total_string;
        
    }
    
}

- (IBAction)changeSign:(id)sender {
    
    if(halfway_total){
        
        if (halfway_total != 0) {
        
            halfway_total = halfway_total * -1;
        
            NSString *halfway_total_string = [NSString stringWithFormat:@"%f", halfway_total];
        
            _answer_label.text = halfway_total_string;
        
        }
            
    }else{
        
        if (input_total != 0){
        
            input_total = input_total * -1;
        
            NSString *input_total_string = [NSString stringWithFormat:@"%f", input_total];
        
            _answer_label.text = input_total_string;
            
        }
        
    }
    
}

- (IBAction)clear:(id)sender {
    
    first_flg = YES;
    
    halfway_total = 0;
    
    input_total = 0;
    
    _answer_label.text = @"0";

}


#pragma mark Number

- (IBAction)tapButton:(id)sender{
    
    UIButton *button = (UIButton *)sender;
    
    input_num = button.tag;
    
    [self Go_Number];
}


- (void)Go_Number{
    
    if(point_flg == 0){
        
        if(first_flg == 0){
            
            input_total = input_total * 10;
            
            input_total += input_num;
            
            NSString *input_total_string = [NSString stringWithFormat:@"%f", input_total];
            
            _answer_label.text = input_total_string;
            
            
        }else{
            
            input_total = input_num;
            
            NSString *input_total_string = [NSString stringWithFormat:@"%f", input_total];
            
            _answer_label.text = input_total_string;
            
            first_flg = NO;
            
        }
        
    }else{
        
        float point_count_num = pow(0.1, point_count);
            
        input_total += input_num * point_count_num;
            
        NSString *input_total_string = [NSString stringWithFormat:@"%f", input_total];
            
        _answer_label.text = input_total_string;
        
        point_count += 1;
        
    }
    
    
    
}



- (IBAction)addPoint:(id)sender {
        
    if(point_flg == 1){
        
        if(first_flg == 1){
            
            point_flg = NO;
        
        }
            
    }else{
        
        point_flg = YES;
        
    }
    
}


@end
