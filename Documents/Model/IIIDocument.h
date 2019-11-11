//
//  IIIDocument.h
//  Documents
//
//  Created by Stephanie Bowles on 11/11/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

#import <Foundation/Foundation.h>

 

@interface IIIDocument : NSObject
//Add properties with the appropriate types and property attributes for a document's title, text, and word count.

- (instancetype)initWithTitle: (NSString *)title text:(NSString *)text;
 

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *text;
@property (nonatomic) NSUInteger *wordCount;
@end

 
