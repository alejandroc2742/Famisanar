//
//  DetailViewController.h
//  FamisanarTest
//
//  Created by Admin on 24/04/18.
//  Copyright © 2018 com.test. All rights reserved.
//

#import "DetailViewController.h"
#import "UIImageView+AFNetworking.h"
#import "UIButton+AFNetworking.h"
#import "InfoViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UITextView *desc;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = [self.item name];
    [self.photo setImageWithURL:[NSURL URLWithString:self.item.photo]
               placeholderImage:[UIImage imageNamed:@"300-300.jpg"]];
    self.desc.text = self.item.desc;
    
    [self.button setBackgroundImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.item.photo]]]forState:UIControlStateNormal];
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Get the new view controller using [segue destinationViewController].
    InfoViewController *infovc = [segue destinationViewController];
    
    // Pass the selected object to the new view controller.

    infovc.itemInfo = self.item;
}

@end
