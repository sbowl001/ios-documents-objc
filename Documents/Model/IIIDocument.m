//
//  IIIDocument.m
//  Documents
//
//  Created by Stephanie Bowles on 11/11/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

#import "IIIDocument.h"
#import "NSString+WordCount.h"

@implementation IIIDocument

- (instancetype)initWithTitle: (NSString *)title text:(NSString *)text
{
    self = [super init];
    if (self) {
        _title = title.copy;
        _text = text.copy;
    }
    return self;
}

//Create an initializer that will set the model's title and text, but not the word count.

-(NSUInteger)wordCount
{
    return [self.text wordCount];
}
//Create a custom property accessor for the word count property. In the accessor, use the wordCount method you just created in the NSString category. (Remember to import the "NSString+WordCount.h" file or you won't be able to access the method)
@end
