//
//  ViewController.m
//  iOSShool03
//
//  Created by Дмитрий Мельников on 08.08.12.
//  Copyright (c) 2012 Дмитрий Мельников. All rights reserved.
//

#import "ViewController.h"
#import "MyCustomCell.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIButton *btn;
@property (strong, nonatomic) IBOutlet UILabel *lbl;
@property (strong, nonatomic) NSArray *items;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet MyCustomCell *tmpCell;

- (IBAction)btnNav:(id)sender;

@end

@implementation ViewController
@synthesize tableView = _tableView;
@synthesize tmpCell = _tmpCell;
@synthesize btn = _btn;
@synthesize lbl;

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.items = @[ @"One", @"Two", @"Three", @"Four", @"Five", @"Six", @"Seven", @"Eight", @"Nine", @"Ten", @"Eleven", @"Twelve"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(barButtonItemTap)];
//    _btn.contentStretch =
    [_btn setBackgroundImage:[UIImage imageNamed:@"btn_white"] forState:UIControlStateNormal];
//    stretchableImageWithLeftCapWidth:(NSInteger) topCapHeight:(NSInteger)
}

- (void)barButtonItemTap {
    NSLog(@"barButtonItemTap");
}

- (void)viewDidUnload
{
    [self setBtn:nil];
    [self setLbl:nil];
    [self setTableView:nil];
    [self setTmpCell:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (IBAction)btnNav:(id)sender {
    UIViewController *newCtrl = [[UIViewController alloc] init];
//    [self.navigationController pushViewController:newCtrl animated:YES];
    newCtrl.title = @"Title test";
    
//    UIViewController * myController = [[ViewController alloc] initWithNibName:@"ViewTable" bundle:nil];
//    [self.navigationController pushViewController:myController. animated:YES];
    
    [UIView animateWithDuration:3 animations:^{
//        lbl.backgroundColor = [UIColor redColor];
        lbl.alpha = 0.0;
    } completion:^(BOOL finiished){
        NSLog(@"completions");
    }];
}

#pragma mark -
#pragma mark UITableView Stuff

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellId = @"MyCell";
    
    MyCustomCell* cell = (MyCustomCell*)[tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        [[NSBundle mainBundle] loadNibNamed:@"MyCustomCell" owner:self options:nil];
        cell = self.tmpCell;
        self.tmpCell = nil;
        NSLog(@"Created new cell %@ for row: %d", cell, indexPath.row);
    } else {
        NSLog(@"Reused cell %@ for row: %d", cell, indexPath.row);
    }
    
    cell.label.text = [self.items objectAtIndex:indexPath.row];
    return cell;
}

@end
// comment 1
