//
//  DetailViewController.m
//  MeetUp
//
//  Created by Charles Northup on 3/24/14.
//  Copyright (c) 2014 MobileMakers. All rights reserved.
//

#import "DetailViewController.h"



@interface DetailViewController ()
{
    IBOutlet UILabel *descriptionLabel;
    IBOutlet UILabel *rsvpLabel;
    IBOutlet UILabel *hostInfoLabel;
}
@end

@implementation DetailViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    descriptionLabel.text = self.event.description;
    rsvpLabel.text = self.event.rsvp;
    hostInfoLabel.text = self.event.hostInfo;
    
}



@end
