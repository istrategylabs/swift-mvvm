//
//  ViewController.swift
//  swift-mvvm
//
//  Created by Taylor Guidon on 11/29/16.
//  Copyright © 2016 ISL. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController, NetworkManagerDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    let coordinateString: String = "38.914504,-77.021181"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        guard let path = Bundle.main.path(forResource: "keys", ofType: "plist"),
            let keys = NSDictionary(contentsOfFile: path),
            let apiKey = keys["apiKey"] as? String else {
                print("Issue with keys.plist")
                return
        }
        
        let networkManager = NetworkManager(apiKey: apiKey)
        networkManager.delegate = self
        networkManager.getWeatherForCoordinate(coordinate: coordinateString)
    }
    
    func dataReceived(data: Any?, error: NSError?) {
        if error != nil {
            print("Error: \(error)")
        }
        
        guard let data = data else {
            print("Error: No data")
            return
        }
        let json = JSON(data)
        
        
    }


}
