//
//  MRGRequestTester.m
//  LaCapitale
//
//  Created by Frank Marceau on 11/18/2013.
//  Copyright (c) 2013 Mirego. All rights reserved.
//

#import "MRGRequestTester.h"
//#import "AFHTTPRequestOperationManager.h"

static NSString const *kMGORequests = @"Requests";
static NSString const *kMGORequestURL = @"url";
static NSString const *kMGORequestMethod = @"method";
static NSString const *KMGORequestParameters = @"parameters";
static NSString const *kMGOUsername = @"Username";
static NSString const *kMGOPassword = @"Password";

@interface MRGRequestTester ()

@end


@implementation MRGRequestTester
{
    NSArray *_requests;
    NSMutableArray *_requestResponses;
    
    UIActivityIndicatorView *_loadingView;
    
//    AFHTTPRequestOperationManager *_requestManager;
    
    NSUInteger _currentRequestedIndex;
}

- (id) init
{
    
    self = [super init];
    if (self) {
        self.title = @"MGORequestTester";
        
        [self loadRequestPlist];
        
        _requestResponses = [NSMutableArray array];
        _loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [_loadingView setAlpha:0];
        _currentRequestedIndex = 0;
    }
    return self;
}

- (void)deallocViews
{
}

- (void)dealloc
{
    [self deallocViews];
    _requests = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *closeButton = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStylePlain target:self action:@selector(closeTouched)];
    self.navigationItem.leftBarButtonItem = closeButton;
    
    UIBarButtonItem *testButton = [[UIBarButtonItem alloc] initWithTitle:@"Start Tests" style:UIBarButtonItemStylePlain target:self action:@selector(startTestTouched:)];
    self.navigationItem.rightBarButtonItem = testButton;
    
    [_loadingView setFrame:CGRectMake((self.view.frame.size.width - _loadingView.frame.size.width) / 2, (self.view.frame.size.height - _loadingView.frame.size.height) / 2, _loadingView.frame.size.width, _loadingView.frame.size.height)];
    [self.tableView addSubview:_loadingView];
}

- (void)viewDidUnload
{
    
    [self deallocViews];
}

//------------------------------------------------------------------------------
#pragma mark - Memory management
//------------------------------------------------------------------------------
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//}

//------------------------------------------------------------------------------
#pragma mark - Private methods
//------------------------------------------------------------------------------
- (void)testRequestsAtIndex:(NSUInteger)index
{
    if (_currentRequestedIndex < [_requests count]) {
        //NSDictionary *request = [_requests objectAtIndex:index];
        //NSString *method = [[request objectForKey:kMGORequestMethod] uppercaseString];
        //NSString *url = [request objectForKey:kMGORequestURL];
        //NSDictionary *parameters = [request objectForKey:KMGORequestParameters];
        
//        if ([method isEqualToString:@"GET"]) {
//            [_requestManager GET:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//                [self handleResponse:responseObject];
//            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//                [self handleResponse:error];
//            }];
//        }
//        else if ([method isEqualToString:@"POST"]) {
//            [_requestManager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//                [self handleResponse:responseObject];
//            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//                [self handleResponse:error];
//            }];
//        }
//        else if ([method isEqualToString:@"DELETE"]) {
//            [_requestManager DELETE:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//                [self handleResponse:responseObject];
//            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//                [self handleResponse:error];
//            }];
//        }
//        else if ([method isEqualToString:@"HEAD"]) {
//            [_requestManager HEAD:url parameters:parameters success:^(AFHTTPRequestOperation *operation) {
//                [self handleResponse:nil];
//            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//                [self handleResponse:error];
//            }];
//        }
    }
    else {
        [self showLoading];
        [self.navigationItem.rightBarButtonItem setEnabled:YES];
    }
}

- (void)handleResponse:(id)response
{
    [_requestResponses addObject:response];
    [self.tableView reloadData];
    _currentRequestedIndex++;
    [self testRequestsAtIndex:_currentRequestedIndex];
}

- (void)showLoading
{
    if (_loadingView.isAnimating) {
        [_loadingView setAlpha:0];
        [_loadingView stopAnimating];
    } else {
        [_loadingView setAlpha:1];
        [_loadingView startAnimating];
    }
}

- (void)createRequestManagerWithUsername:(NSString *)username password:(NSString *)password
{
//    _requestManager = [AFHTTPRequestOperationManager manager];
//    _requestManager.responseSerializer = [AFJSONResponseSerializer serializer];
//    [_requestManager.requestSerializer setAuthorizationHeaderFieldWithUsername:username password:password];
}

- (void)loadRequestPlist
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Requests" ofType:@"plist"];
    NSDictionary *plist = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    _requests = [plist objectForKey:kMGORequests];
    
    NSString *username = [plist objectForKey:kMGOUsername];
    NSString *password = [plist objectForKey:kMGOPassword];
    [self createRequestManagerWithUsername:username password:password];
}

//------------------------------------------------------------------------------
#pragma mark - Control events
//------------------------------------------------------------------------------
- (void)closeTouched
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)startTestTouched:(UIBarButtonItem *)sender
{
    _currentRequestedIndex = 0;
    [_requestResponses removeAllObjects];
    [self.tableView reloadData];
    [sender setEnabled:NO];
    [self showLoading];
    
    if (_requests.count) {
        [self testRequestsAtIndex:_currentRequestedIndex];
    }
}

//------------------------------------------------------------------------------
#pragma mark UITableView dataSource
//------------------------------------------------------------------------------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_requests count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *request = [_requests objectAtIndex:indexPath.row];
    [cell.textLabel setText:[request objectForKey:kMGORequestURL]];
    [cell.textLabel setFont:[UIFont systemFontOfSize:14]];
    [cell.textLabel setBackgroundColor:[UIColor clearColor]];
    [cell.textLabel setAdjustsFontSizeToFitWidth:YES];
    [cell setBackgroundColor:[UIColor clearColor]];
    
    if ([_requestResponses count] > indexPath.row) {
        id response = [_requestResponses objectAtIndex:indexPath.row];
        if ([response isKindOfClass:[NSError class]]) {
            [cell.contentView setBackgroundColor:[UIColor redColor]];
        } else {
            [cell.contentView setBackgroundColor:[UIColor greenColor]];
        }
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    } else {
        [cell.contentView setBackgroundColor:[UIColor clearColor]];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    return cell;
}

//------------------------------------------------------------------------------
#pragma mark UITableView delegate
//------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    id response = [_requestResponses objectAtIndex:indexPath.row];
    
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:nil message:[response description] delegate:nil cancelButtonTitle:@"Close" otherButtonTitles:nil];
    [av show];
}


@end