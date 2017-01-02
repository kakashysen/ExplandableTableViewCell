//
//  Driver.m
//  Test
//
//  Created by Jose Aponte on 1/2/17.
//  Copyright © 2017 jappsku. All rights reserved.
//

#import "Driver.h"

@implementation Driver

-(id)initWithName:(NSString*) name
{
    if (self = [super init])
    {
        self.name = name;
    }
    return self;
}

-(id)initWithName:(NSString*) name urlImage:(NSString*) urlImage distance:(NSNumber*) distance taxiPlates:(NSString*)taxiPlates
{
    if (self = [super init])
    {
        self.name = name;
        self.urlImage = urlImage;
        self.distance = distance;
        self.taxiPlates = taxiPlates;
    }
    return self;
}

@end
