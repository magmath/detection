//
//  ViewController.swift
//  Detection
//
//  Created by Alan Yu on 4/6/16.
//  Copyright © 2016 Alan Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Properties
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions
    @IBAction func register(sender: UIButton) {
        let deviceToken = self.appDelegate.getDeviceToken()
        
        if (deviceToken != nil) {
            print(deviceToken)
        } else {
            let alertController = UIAlertController(title: "",
                                                    message: "Detection does not have access to your Notifications. To enable access, tap Settings and turn on Notifications.",
                                                    preferredStyle: .Alert)
            
            let settingsAction = UIAlertAction(title: "Settings", style: .Default) { (alertAction) in
                
                if let appSettings = NSURL(string: UIApplicationOpenSettingsURLString) {
                    UIApplication.sharedApplication().openURL(appSettings)
                }
            }
            alertController.addAction(settingsAction)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            alertController.addAction(cancelAction)
            
            presentViewController(alertController, animated: true, completion: nil)
        }
        
        print("clicked the button")
    }
}

