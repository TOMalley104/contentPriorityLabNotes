//
//  ViewController.m
//  contentSizingProperties
//
//  Created by Tom OMalley on 1/7/16.
//  Copyright © 2016 meseroleSt. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *widthLabel1;
@property (weak, nonatomic) IBOutlet UILabel *widthLabel2;
@property (weak, nonatomic) IBOutlet UITextField *label1TextField;
@property (weak, nonatomic) IBOutlet UITextField *label2TextField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateLabelsTapped:nil];
}

- (IBAction)updateLabelsTapped:(id)sender {
    
    self.label1.text = self.label1TextField.text;
    self.label2.text = self.label2TextField.text;
    
    [self.view layoutIfNeeded];
    
    NSString *width1 = [NSString stringWithFormat:@"Width: %.02f", self.label1.frame.size.width];
    
    NSString *width2 = [NSString stringWithFormat:@"Width: %.02f", self.label2.frame.size.width];
    
    self.widthLabel1.text = width1;
    self.widthLabel2.text = width2;
}

-(NSNumber*)largestNumberInArray:(NSArray*)numbers{
    if (numbers.count == 0) {
        return nil;
    }
    else if(numbers.count == 1) {
        return [numbers firstObject];
    } else {
        CGFloat firstNumber = [[numbers firstObject] floatValue];
        CGFloat lastNumber = [[numbers lastObject] floatValue];
        
        NSMutableArray *mutableNumbers = [numbers mutableCopy];
        
        if (firstNumber > lastNumber) {
            [mutableNumbers removeObject:[mutableNumbers lastObject]];
        } else {
            [mutableNumbers removeObject:[mutableNumbers firstObject]];
        }
        return [self largestNumberInArray:[mutableNumbers copy]];
    }
}

@end
