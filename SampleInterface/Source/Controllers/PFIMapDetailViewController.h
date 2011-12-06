//
//  PFIMapDetailViewController.h
//  SampleInterface
//
//  Created by Doan The Hien on 12/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface AddressAnnotation : NSObject <MKAnnotation> 
{
	CLLocationCoordinate2D coordinate;
	
	NSString *title;
	NSString *subTitle;
}

@end

@interface PFIMapDetailViewController : UIViewController
{
    IBOutlet MKMapView	*mapView;
	
	AddressAnnotation *addAnnotation;
    
    CLLocationDegrees latitudeValue;
    CLLocationDegrees longitudeValue;

}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil latitude:(CLLocationDegrees) lat longitude:(CLLocationDegrees) lon;
-(void) showAddress ;
@end
