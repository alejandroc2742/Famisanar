//
//  InfoViewController.h
//  UITableViewJSON
//
//  Created by Admin on 25/04/18.
//  Copyright © 2018 Fethi El Hassasna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"

@interface InfoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *infoTextView;
@property (nonatomic) Item *itemInfo;

@end
