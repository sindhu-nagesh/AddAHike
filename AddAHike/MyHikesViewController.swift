//
//  ViewController.swift
//  AddAHike
//
//  Created by Nagesh, Vidya Sindhu on 4/1/15.
//  Copyright (c) 2015 Nagesh, Vidya Sindhu. All rights reserved.
//

import UIKit

class MyHikesViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var myHikesTable: UITableView!
    var hikes = [HikeDetails]()
    var data = NSMutableData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        populateHikes()
        println("COUNT")
        println(hikes.count)
        return hikes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        println(hikes[indexPath.row])
        var cell:MyCell = tableView.dequeueReusableCellWithIdentifier("cell") as! MyCell
        cell.hikeName.text = hikes[indexPath.row].name
        cell.random.text = hikes[indexPath.row].url
        return cell
    }
    
    func populateHikes() {
        let URL = NSURL(string: url)
        var error: NSErrorPointer = nil
        var request = NSMutableURLRequest(URL: URL!)
        request.HTTPMethod = "GET"
        var response: NSURLResponse?
        var responseData = NSURLConnection.sendSynchronousRequest(request, returningResponse: &response, error: error)
        let parsedObject: AnyObject? = NSJSONSerialization.JSONObjectWithData(responseData!,
            options: NSJSONReadingOptions.AllowFragments,
            error: error)
        if let hikeSummaryList = parsedObject as? NSArray {
            for hikeSummary in hikeSummaryList {
                if let hikeDetails = hikeSummary["hikeDetails"] as? NSDictionary {
                    var name = hikeDetails["name"] as! String
                    var url = hikeDetails["url"] as! String
                    var roundTripLength = hikeDetails["roundTripLength"] as! Double
                    var hikeDetail = HikeDetails(name: name, url: url, roundTripLength: roundTripLength)
                    self.hikes.append(hikeDetail)
                }
            }
        }
    }
    
}
