//
//  NSString+WordCount.m
//  Documents
//
//  Created by Stephanie Bowles on 11/11/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

#import "NSString+WordCount.h"

 


@implementation NSString (WordCount)

-(NSUInteger)wordCount
{
    NSArray *wordArray = [self componentsSeparatedByString:@" "];
    return [wordArray count];
}
@end
