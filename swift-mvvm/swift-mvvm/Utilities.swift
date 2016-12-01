//
//  Utilities.swift
//  swift-mvvm
//
//  Created by Taylor Guidon on 11/30/16.
//  Copyright © 2016 ISL. All rights reserved.
//

import Foundation
import SwiftyJSON

class Utilities {
    class func loadWeatherFromJSON(json: JSON) -> [WeatherData] {
        var weatherDataArray: [WeatherData] = []
        
        guard let dailyWeatherArray = json["daily"]["data"].array else {
            print("No array")
            return []
        }
        
        for day in dailyWeatherArray {
            guard let rawUnixTime = day["time"].double,
                let minTemp = day["temperatureMin"].double,
                let maxTemp = day["temperatureMax"].double,
                let summary = day["summary"].string else {
                    print("Error with data")
                    return []
            }
            let weatherData = WeatherData(rawUnixTime: rawUnixTime, minTemp: minTemp, maxTemp: maxTemp, summary: summary)
            weatherDataArray.append(weatherData)
        }
        
        return weatherDataArray
    }
}
