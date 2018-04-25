//
//  Item.m
//  UITableViewJSON
//
//  Created by Admin on 24/04/18.
//  Copyright © 2018 com.test. All rights reserved.
//

#import "Item.h"

@implementation Item

//The designated initializer
- (instancetype)initWithName:(NSString *)aName
         thumbnail:(NSString *)aThumbnail
             photo:(NSString *)aPhoto
       description:(NSString *)aDescription {
    self = [super init];
    
    if (self) {
        self.name = aName;
        self.thumbnail = aThumbnail;
        self.photo = aPhoto;
        self.desc = aDescription;
    }
    
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dic {
    self = [self initWithName:dic[@"name"] thumbnail:dic[@"medium"] photo:dic[@"original"] description:dic[@"summary"]];
    return self;
}

- (instancetype)init {
    self = [self initWithName:@"Undifined" thumbnail:@"Undifined" photo:@"Undifined" description:@"Undifined"];
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ : %@", self.name, self.description];
}

@end
