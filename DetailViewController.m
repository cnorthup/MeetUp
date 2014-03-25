//
//  DetailViewController.m
//  MeetUp
//
//  Created by Charles Northup on 3/24/14.
//  Copyright (c) 2014 MobileMakers. All rights reserved.
//

#import "DetailViewController.h"
#import "WebViewController.h"


@interface DetailViewController ()
{
    IBOutlet UILabel *rsvpLabel;
    IBOutlet UILabel *hostInfoLabel;
    IBOutlet UIWebView *descriptionView;
    NSURLRequest* request;
    NSURL* url;
    
}
@end

@implementation DetailViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    [descriptionView loadHTMLString:self.description baseURL:nil];
    rsvpLabel.text = self.rsvp;
    hostInfoLabel.text = self.hostInfo;
    url = [NSURL URLWithString:self.link];
    request = [NSURLRequest requestWithURL:url];
//    descriptionLabel.text = self.event.description;
//    rsvpLabel.text = self.event.rsvp;
//    hostInfoLabel.text = self.event.hostInfo;
    
}

//- (IBAction)onLinkButtonPressed:(id)sender {
//    WebViewController *vc;
//}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    WebViewController *vc = segue.destinationViewController;
    vc.request = request;
}



@end
