//
//  PFIMapDetailViewController.m
//  SampleInterface
//
//  Created by Doan The Hien on 12/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PFIMapDetailViewController.h"

///implementing AddressAnnotation class
@implementation AddressAnnotation

@synthesize coordinate;

- (NSString *)subtitle
{
	return @"Sub Title";
}
- (NSString *)title
{
	return @"Title";
}

-(id)initWithCoordinate:(CLLocationCoordinate2D) c
{
	coordinate=c;
	NSLog(@"%f,%f",c.latitude,c.longitude);
	return self;
}


-(void)dealloc
{
    NSLog(@"DEALLOC %@",NSStringFromClass([self class]));
    
    [super dealloc];
}

@end

///implementing PFIMapDetailViewController class
@implementation PFIMapDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil latitude:(CLLocationDegrees) lat longitude:(CLLocationDegrees) lon
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        latitudeValue = lat;
        longitudeValue = lon;
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

-(void)dealloc
{
    NSLog(@"DEALLOC %@",NSStringFromClass([self class]));
    [mapView release];
    mapView = nil;
    [addAnnotation release];
    addAnnotation = nil;
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self showAddress];
}
-(void) showAddress 
{
	
	MKCoordinateRegion region;
	MKCoordinateSpan span;
	span.latitudeDelta=0.2;
	span.longitudeDelta=0.2;
	
	CLLocationCoordinate2D location = mapView.userLocation.coordinate;
    
	location.latitude  =  latitudeValue; //10.775891489212619;//38.898748 ;
	location.longitude =  longitudeValue;//106.70376777648926;//-77.037684;
	region.span=span;
	region.center=location;
	
	if(addAnnotation != nil) {
		[mapView removeAnnotation:addAnnotation];
		[addAnnotation release];
		addAnnotation = nil;
	}
	
	addAnnotation = [[AddressAnnotation alloc] initWithCoordinate:location];
	[mapView addAnnotation:addAnnotation];
	
	[mapView setRegion:region animated:TRUE];
	[mapView regionThatFits:region];
	//[mapView selectAnnotation:mLodgeAnnotation animated:YES];
}

- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>) annotation
{
	MKPinAnnotationView *annView=[[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"currentloc"] autorelease];
	annView.pinColor = MKPinAnnotationColorGreen;
	annView.animatesDrop=TRUE;
	annView.canShowCallout = YES;
	annView.calloutOffset = CGPointMake(-5, 5);
	return annView;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
