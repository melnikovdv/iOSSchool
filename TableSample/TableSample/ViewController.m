//
//  ViewController.m
//  TableSample
//
//  Created by Дмитрий Мельников on 22.08.12.
//  Copyright (c) 2012 Дмитрий Мельников. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, readonly) UITableView *tableView;
@property(nonatomic, readonly) NSArray *items;
@end

@implementation ViewController {

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (UITableView *)tableView {
    return (UITableView *)self.view;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.tableView flashScrollIndicators];
    
    NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
    [self.tableView deselectRowAtIndexPath:selectedIndexPath animated:YES];
}

- (void)loadView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    
    self.view = tableView;
    
}

- (void)viewDidLoad {
    NSMutableArray *items = [NSMutableArray array];
    for (int i = 0; i < 25; i++) {
        NSString *item = [NSString stringWithFormat:@"Item %d", i];
        [items addObject:item];
        
    }
    
    _items = items;
}

- (NSInteger)numberOfSelectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellId = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId];
    }
    cell.textLabel.text = [self.items objectAtIndex:indexPath.row];
    return cell;
}

@end
