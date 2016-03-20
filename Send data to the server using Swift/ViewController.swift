//
//  ViewController.swift
//  Send data to the server using Swift
//
//  Created by Tiffany Diamanta on 3/18/16.
//  Copyright © 2016 Tiffany Diamanta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let nameField = UITextField()
    let ageField = UITextField()
    let mainButton = UIButton(type: UIButtonType.System) as UIButton

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        nameField.frame = CGRectMake(0, 0, 100, 50)
        nameField.center = CGPointMake(view.bounds.midX, view.bounds.midY - 100)
        nameField.textAlignment = NSTextAlignment.Center
        nameField.backgroundColor = UIColor.clearColor()
        nameField.layer.borderColor = UIColor.blackColor().CGColor
        nameField.layer.borderWidth = 5
        nameField.layer.cornerRadius = 10
        nameField.placeholder = "Name"
        self.view.addSubview(nameField)
        
        ageField.frame = CGRectMake(0, 0, 100, 50)
        ageField.center = CGPointMake(view.bounds.midX, view.bounds.midY)
        ageField.textAlignment = NSTextAlignment.Center
        ageField.backgroundColor = UIColor.clearColor()
        ageField.layer.borderColor = UIColor.blackColor().CGColor
        ageField.layer.borderWidth = 5
        ageField.layer.cornerRadius = 10
        ageField.placeholder = "Age"
        self.view.addSubview(ageField)
        
        mainButton.frame = CGRectMake(0, 0, 100, 50)
        mainButton.center = CGPointMake(view.bounds.midX, view.bounds.midY + 100)
        mainButton.backgroundColor = UIColor.blackColor()
        mainButton.addTarget(self, action: "sendDataToTheServer", forControlEvents: UIControlEvents.TouchDragInside)
        mainButton.setTitle("SEND", forState: UIControlState.Normal)
        mainButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        //mainButton.title
        self.view.addSubview(mainButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sendDataToTheServer() {
        let myUrl = NSURL(string: "http://tiffanydiamanta.com/somephpscriptontheserver.php");let request = NSMutableURLRequest(URL:myUrl!);
        request.HTTPMethod = "POST"
        // Compose a query string
        let bodyData: NSString = NSString(string: "visitor_name=\(nameField.text), visitor_email=\(ageField.text)")
        
        request.HTTPBody = bodyData.dataUsingEncoding(NSUTF8StringEncoding);
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            if error != nil
            {
                print("error=\(error)")
                return
            }
            
            print("response = \(response)")
            
            // Printing out response body
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("responseString = \(responseString)")
            
        }
        
        task.resume()
    }


}

