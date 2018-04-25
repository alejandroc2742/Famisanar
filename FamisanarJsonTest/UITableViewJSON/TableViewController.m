//
//  TableViewController.m
//  FamisanarTest
//
//  Created by Admin on 24/04/18.
//  Copyright © 2018 com.test. All rights reserved.
//

#import "TableViewController.h"
#import "AFHTTPSessionManager.h"
#import "UIImageView+AFNetworking.h"
#import "Item.h"
#import "DetailViewController.h"

@interface TableViewController ()

@property (nonatomic, strong)NSArray *items;

@end

@implementation TableViewController

//- (id)initWithStyle:(UITableViewStyle)style
//{
//    self = [super initWithStyle:style];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"Famisanar";
    
    [self loadItems];
    
    // Remove empty cells
    //self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.items[indexPath.row] name];
    /*
    [cell.imageView setImageWithURL:[NSURL URLWithString:[self.items[indexPath.row] thumbnail]]
                   placeholderImage:[UIImage imageNamed:@"50-50.jpg"]];*/
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65.0f;
}

#pragma mark - Navigation

 // In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Get the new view controller using [segue destinationViewController].
    DetailViewController *detailvc = [segue destinationViewController];
    
    // Pass the selected object to the new view controller.
    NSIndexPath *index = self.tableView.indexPathForSelectedRow;
    Item *item = self.items[index.row];
    
    detailvc.item = item;
}

- (void)loadItems {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:@"http://api.tvmaze.com/shows/1/episodes" parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        NSArray *jsonArray = (NSArray *)responseObject;
        NSMutableArray *tempItems = [[NSMutableArray alloc] init];
        
        for (NSDictionary *dic in jsonArray) {
            NSArray *images = dic[@"image"];
            Item *item = [[Item alloc] initWithDictionary:dic];
            item.photo = [images valueForKey:@"original"];
            item.thumbnail = [images valueForKey:@"medium"];
            [tempItems addObject:item];
        }
        
        self.items = [[NSArray alloc] initWithArray:tempItems];
        tempItems = nil;
        
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"Error Retrieving Ninjas"
                                                                         message:[error localizedDescription]
                                                                  preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
        
        [alertVC addAction:okAction];
        
        [self presentViewController:alertVC animated:YES completion:nil];
    }];

}

@end
