//
//  DocumentAddViewController.h
//  Documents
//
//  Created by Stephanie Bowles on 11/11/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ModelController;
@class IIIDocument;

@interface DocumentAddViewController : UIViewController <UITextViewDelegate>

 
@property (nonatomic) ModelController *modelController;
@property (nonatomic) IIIDocument *document;

@end

 
//In the detail view controller, adopt the UITextViewDelegate protocol. Set the view controller as the delegate of the text view.
