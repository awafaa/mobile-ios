//
//  HomeViewController.m
//  OpenPhoto
//
//  Created by Patrick Santana on 26/07/11.
//  Copyright 2011 OpenPhoto. All rights reserved.
//

#import "HomeViewController.h"

@implementation HomeViewController

@synthesize service;
@synthesize images;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor whiteColor];
        self.tabBarItem.image=[UIImage imageNamed:@"tab-home.png"];
        self.tabBarItem.title=@"Home";
        self.title=@"Open Photo";
        
        // create service and the delegate
        service = [[WebService alloc]init];
        [service setDelegate:self];
        
        images = [[NSMutableArray alloc] init];  
        
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

// delegate
-(void) receivedResponse:(NSDictionary *)response{
    NSArray *photos = [response objectForKey:@"result"] ;
    
    // Loop through each entry in the dictionary and create an array of MockPhoto
    if (photos == nil){
        for (NSDictionary *photo in photos){
            UIImage *img = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [photo objectForKey:@"path640x960"]]]]];
            
            UIImageView *animation = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];        
            [images addObject:[animation autorelease]];
            [img release];
        } 
        
        UIImageView *myAnimatedView = [UIImageView alloc];
        CGRect myImageRect = CGRectMake(10, 10, 200, 200);
        [myAnimatedView initWithFrame:myImageRect];
        myAnimatedView.animationImages = images;
        myAnimatedView.animationDuration = 10; // seconds
        myAnimatedView.animationRepeatCount = 0; // 0 = loops forever
        myAnimatedView.contentMode = UIViewContentModeScaleAspectFit;
        [myAnimatedView startAnimating];
        [self.view addSubview:myAnimatedView];
        [myAnimatedView release]; 
    }
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}


#pragma mark - View lifecycle
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];  
    
    // load some pictures
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [service getHomePictures];  
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) dealloc {
    [service release];
    [images release];
    [super dealloc];
}

@end
