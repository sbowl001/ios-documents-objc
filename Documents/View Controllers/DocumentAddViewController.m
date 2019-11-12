//
//  DocumentAddViewController.m
//  Documents
//
//  Created by Stephanie Bowles on 11/11/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

#import "DocumentAddViewController.h"
#import "IIIDocument.h"
#import "ModelController.h"
#import <UIKit/UIKit.h>

#import "NSString+WordCount.h" 
@interface DocumentAddViewController ()
@property (weak, nonatomic) IBOutlet UILabel *wordsLabel;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *entryTextView;

@end

@implementation DocumentAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.entryTextView setDelegate:self];
    [self updateViews];
}
- (IBAction)saveDocumentButton:(id)sender {
    BOOL isNewDocument = (self.document == nil);
    
    if (isNewDocument){
        IIIDocument *document = [[IIIDocument alloc] initWithTitle:self.titleTextField.text text:self.entryTextView.text];
        [self.modelController addDocument:document];
    } else {
        self.document.title = self.titleTextField.text;
        self.document.text = self.entryTextView.text;
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)textViewDidChange:(UITextView *)textView
{
    self.wordsLabel.text = [NSString stringWithFormat:@"%lu words", self.entryTextView.text.wordCount];
}

-(void)updateViews
{
    self.title = self.document.title ?: @"New Document";
    if(!self.isViewLoaded || !self.document) {return;}
    
    self.titleTextField.text = self.document.title;
    self.entryTextView.text = self.document.text;
    self.wordsLabel.text = [NSString stringWithFormat:@"%lu words", self.entryTextView.text.wordCount];
}

-(void)setDocument:(IIIDocument *)document
{
    if (_document != document){
        _document = document;
        [self updateViews];
    }
}
 
//Implement the textViewDidChange method. This will get called every time the user enters a character on the keyboard while the text view is the first responder. In the method, update the label's text to show how many words are in the textView's text. Use the wordCount method from the NSString+WordCount category to do this.
//Create an updateViews method that should place the document's properties in the appropriate UI elements for the user to see.
//When the user wants to save the document, either create a new document or update an existing one.

@end
