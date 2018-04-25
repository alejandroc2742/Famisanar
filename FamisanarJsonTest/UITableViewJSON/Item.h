//
//  Item.h
//  UITableViewJSON
//
//  Created by Admin on 24/04/18.
//  Copyright © 2018 com.test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property (strong, nonatomic)NSString *name;
@property (strong, nonatomic)NSString *thumbnail;
@property (strong, nonatomic)NSString *photo;
@property (strong, nonatomic)NSString *desc;

- (id)initWithName:(NSString *)aName
         thumbnail:(NSString *)aThumbnail
             photo:(NSString *)aPhoto
       description:(NSString *)aDescription;

- (id)initWithDictionary:(NSDictionary *)dic;

@end
