//
//  ViewController.swift
//  XMPToolKitSDK-iOS-Sample
//
//  Created by ryu1 on 2017/09/16.
//  Copyright © 2017年 ryu1. All rights reserved.
//

import UIKit
import os.log

class ViewController: UIViewController {

    static let log = OSLog(subsystem: "org.ryu1.xmptoolkit.ios.sample.XMPToolKitSDK-iOS-Sample", category: "UI")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let path = Bundle.main.path(forResource: "TestImage", ofType: "jpg");

        // resouceが、Read Onlyっぽいので、Tempにコピー
        let tempPath = NSTemporaryDirectory() + "TestImage.jpg"

        if (FileManager.default.fileExists(atPath: tempPath)) {
            try! FileManager.default.removeItem(atPath: tempPath)
        }

        try! FileManager.default.copyItem(atPath: path!, toPath: tempPath)


        // parameter.
        var rating = "";

        // -----------------------------------------------
        do {
            rating = try XMPUtils.readRate(withFile: tempPath);
        } catch let error {
            os_log("read error: %@", log: ViewController.log, type: .error, error as CVarArg)
        }
        os_log("read rating: %@", log: ViewController.log, type: .info, rating)
        // -----------------------------------------------
        var error:NSError?

        XMPUtils.writeRate("3", withFile: tempPath, error: &error)

        guard (error == nil) else {
            os_log("write error: %@", log: ViewController.log, type: .error, error!)
            return;
        }

        // -----------------------------------------------
        rating = ""
        do {
            rating = try XMPUtils.readRate(withFile: tempPath);
        } catch let error {
            os_log("read error: %@", log: ViewController.log, type: .error, error as CVarArg)
        }

        os_log("read rating: %@", log: ViewController.log, type: .info, rating)

        // -----------------------------------------------


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

