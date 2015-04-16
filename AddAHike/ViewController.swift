//
//  ViewController.swift
//  AddAHike
//
//  Created by Nagesh, Vidya Sindhu on 4/1/15.
//  Copyright (c) 2015 Nagesh, Vidya Sindhu. All rights reserved.
//

import UIKit

var url = "http://localhost:8080/hikes?user=sindhu"

class ViewController: UIViewController {

    @IBOutlet var hikeUrl: UITextField!
    @IBOutlet weak var status: UILabel!
    
    @IBAction func GoButton(sender: AnyObject) {
        addHike()
    }
    
    func addHike() {
        let URL = NSURL(string: url)
        var request = NSMutableURLRequest(URL: URL!)
        var session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"
        println(hikeUrl.text)
        let data = ("url="+hikeUrl.text).dataUsingEncoding(NSUTF8StringEncoding)
        request.HTTPBody = data
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            println("Response: \(response)")
            var strData = NSString(data: data, encoding: NSUTF8StringEncoding)
            self.status.text = strData as! String
        })
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
//        self.view.endEditing(true)
//    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        println("key")
        hikeUrl.resignFirstResponder()
        return true
        
    }

}

