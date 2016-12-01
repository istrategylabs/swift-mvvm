//
//  WeatherViewModel.swift
//  swift-mvvm
//
//  Created by Taylor Guidon on 11/30/16.
//  Copyright © 2016 ISL. All rights reserved.
//

import Foundation
import SwiftyJSON

class WeatherViewModel {
    var weatherData: WeatherData
    
    var rawUnixTime: Double?
    var minTemp: Int?
    var maxTemp: Int?
    var summary: String?
    var dateString: String = ""
    
    let reuseIdentifier = "WeatherCell"
    
    init(_ weatherData: WeatherData) {
        self.weatherData = weatherData
        
        rawUnixTime = weatherData.rawUnixTime
        minTemp = Int(weatherData.minTemp.rounded())
        maxTemp = Int(weatherData.maxTemp.rounded())
        summary = weatherData.summary
        
        guard let unixTime = rawUnixTime else {
            print("Invalid unix time")
            return
        }
        
        let date = Date(timeIntervalSince1970: unixTime)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateString = dateFormatter.string(from: date)
    }
    
    func cellInstance(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! WeatherTableViewCell
        cell.setup(self)
        
        return cell
    }
    
    func tapCell(_ tableView: UITableView, indexPath: IndexPath) {
        print("Tapped a cell")
    }
}
