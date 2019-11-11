//
//  ModelController.h
//  Documents
//
//  Created by Stephanie Bowles on 11/11/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IIIDocument;

@interface ModelController : NSObject

@property (nonatomic, readonly, copy) NSArray<IIIDocument *> *documents;

-(void)addDocument:(IIIDocument *)aDocument;
-(void)removeDocument:(IIIDocument *)aDocument;
-(void)updateDocument:(IIIDocument *)aDocument;

@end

 
