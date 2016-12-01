//
//  ViewController.swift
//  swift-mvvm
//
//  Created by Taylor Guidon on 11/29/16.
//  Copyright © 2016 ISL. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController, NetworkManagerDelegate, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var locationLabel: UILabel!
    
    let coordinateString: String = "38.914504,-77.021181"
    var weatherDataArray = [WeatherData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        locationLabel.text = "Weather for \(coordinateString)"
        
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
        weatherDataArray = Utilities.loadWeatherFromJSON(json: json)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let weatherData = weatherDataArray[indexPath.row]
        let weatherViewModel = WeatherViewModel(weatherData)
        return weatherViewModel.cellInstance(tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let weatherData = weatherDataArray[indexPath.row]
        let weatherViewModel = WeatherViewModel(weatherData)
        weatherViewModel.tapCell(tableView, indexPath: indexPath)
    }
}
