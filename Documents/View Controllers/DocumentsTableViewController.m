//
//  DocumentsTableViewController.m
//  Documents
//
//  Created by Stephanie Bowles on 11/11/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

#import "DocumentsTableViewController.h"
#import "DocumentAddViewController.h"
#import "ModelController.h"
#import "IIIDocument.h"

#import "NSString+WordCount.h"

@interface DocumentsTableViewController ()
//Add a property with property attributes for an instance of your model controller in the table view controller subclass.
@property (nonatomic, readonly) ModelController *modelController;
//In the two initializers of the table view controller, instantiate the model controller property.
@end

@implementation DocumentsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}
#pragma mark - Table view data source

 

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.modelController.documents.count;
  
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{ UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DocumentCell"  forIndexPath:indexPath];
    
    IIIDocument *document = [self.modelController.documents objectAtIndex:indexPath.row];
    cell.textLabel.text = document.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld words", (long)document.text.wordCount];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if(editingStyle == UITableViewCellEditingStyleDelete) {
        IIIDocument *document = [self.modelController.documents objectAtIndex:indexPath.row];
        [self.modelController removeDocument:document];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
}
- (IBAction)addDocumentButtonTapped:(id)sender {
}

 @synthesize modelController = _modelController;
 - (ModelController *)modelController
 {
     if(!_modelController){
         _modelController = [[ModelController alloc] init];
     }
     return _modelController;
 }  //this is a lazy property - How to use it?

 
#pragma mark - Navigation

 
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     if ([segue.identifier isEqualToString:@"editDocument"]) {
            NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
            DocumentAddViewController *detailVC = segue.destinationViewController;
            
         detailVC.modelController = self.modelController;
            detailVC.document = [self.modelController.documents objectAtIndex:indexPath.row];
        } else if ([segue.identifier isEqualToString:@"toAddDetail"]) {
            DocumentAddViewController *detailVC = segue.destinationViewController;
            detailVC.modelController = self.modelController;
        }
}
 

@end
