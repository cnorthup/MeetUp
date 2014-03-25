//
//  ViewController.m
//  MeetUp
//
//  Created by Charles Northup on 3/24/14.
//  Copyright (c) 2014 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
//#import "Event.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, NSXMLParserDelegate>
{
    NSArray* list;
    NSMutableDictionary*events;
    IBOutlet UITableView *myTableView;
//    NSMutableArray*eventList;
}
@end

@implementation ViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
//    eventList = [NSMutableArray new];
    NSURL* url = [NSURL URLWithString:@"https://api.meetup.com/2/open_events.json?zip=60604&text=mobile&time=,1w&key=6018101b67ea7763968764c725f21"];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSError* error;
        events = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        list = events[@"results"];
        [myTableView reloadData];
    }];
//    for (int i = 0; i < list.count ; i++) {
//        NSDictionary* selectedEvent = list[i];
//        Event* newEvent = [Event new];
//        newEvent.description = selectedEvent[@"venue"]3[@"description"];
//        newEvent.rsvp = selectedEvent[@"yes_rsvp_count"];
//        newEvent.hostInfo = selectedEvent[@"group"][@"name"];
//        [eventList addObject:newEvent];
//        NSLog(@"fdsafsdf");
//    }
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return list.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary* specificEvent = list[indexPath.row];
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MyReuseCellID"];
    cell.textLabel.text = specificEvent[@"name"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@, %@", specificEvent[@"venue"][@"address_1"], specificEvent[@"venue"][@"city"]];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell*)sender{
    
    NSIndexPath *indexPath = [myTableView indexPathForCell:sender];
    NSLog(@"%ld", (long)indexPath.row);
    NSDictionary* specificEvent = list[indexPath.row];
    DetailViewController *vc = segue.destinationViewController;
    vc.navigationItem.title = sender.textLabel.text;
    vc.description = specificEvent[@"description"];
    vc.rsvp = [NSString stringWithFormat:@"%@", specificEvent[@"yes_rsvp_count"]];
    vc.hostInfo = specificEvent[@"group"][@"name"];
    vc.link = specificEvent[@"event_url"];
    
//    Event *event = [eventList objectAtIndex:indexPath.row];
//    vc.event = event;
    
}

















@end
