//
//  ViewController.m
//  Layout_with_Dynamic_Constraints
//
//  Created by Song, Tianyi | RASIA on 3/4/20.
//  Copyright © 2020 Song, Tianyi | RASIA. All rights reserved.
//

#import "ViewController.h"
#import "MapKit/MapKit.h"
#import "WebKit/WebKit.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (weak, nonatomic) IBOutlet WKWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // load web page
    NSString *webURL = @"https://www.google.com";
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:webURL]];
    [self.webView loadRequest:request];
    
    
    // center the map
    double latitude = 1.3521;
    double longitude = 103.8198;
    
    MKPointAnnotation *singAnno = [[MKPointAnnotation alloc] init];
    singAnno.coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    singAnno.title = @"Singapore";
    
    [self.mapView addAnnotation:singAnno];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(singAnno.coordinate, 10000, 10000);
    
    MKCoordinateRegion adjusted = [self.mapView regionThatFits:region];
   
    [self.mapView setRegion:adjusted animated:YES];


}


@end
