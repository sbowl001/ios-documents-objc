//
//  ModelController.m
//  Documents
//
//  Created by Stephanie Bowles on 11/11/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

#import "ModelController.h"
#import "IIIDocument.h"

@interface ModelController()

@property (nonatomic) NSMutableArray<IIIDocument *> *internalDocuments;

@end


@implementation ModelController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalDocuments = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)addDocument:(IIIDocument *)aDocument
{
    [self.internalDocuments addObject:aDocument];
}
-(void)removeDocument:(IIIDocument *)aDocument
{
    [self.internalDocuments removeObject:aDocument];
}
 
- (void)updateDocument:(IIIDocument *)document withTitle:(NSString *)title andText:(NSString *)text
    {
       document.title = title;
       document.text = text;
       
}
 

-(NSArray<IIIDocument *> *)documents
{
    return [self.internalDocuments copy];
}
//Add a property (with the appropriate property attributes) that will hold an array of documents.
//In the initializer of this class, initialize the array with an empty array.
//Add and implement three methods that will create, update, and delete a document, respectively.
@end
