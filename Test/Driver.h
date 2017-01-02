//
//  Driver.h
//  Test
//
//  Created by Jose Aponte on 1/2/17.
//  Copyright © 2017 jappsku. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Driver : NSObject

@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) NSString *taxiPlates;
@property(strong, nonatomic) NSNumber *distance;
@property(strong, nonatomic) NSString *urlImage;

-(id)initWithName:(NSString*) name;
-(id)initWithName:(NSString*) name urlImage:(NSString*) urlImage distance:(NSNumber*) distance taxiPlates:(NSString*)taxiPlates;

@end
