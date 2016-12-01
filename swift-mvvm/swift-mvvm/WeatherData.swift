//
//  WeatherData.swift
//  swift-mvvm
//
//  Created by Taylor Guidon on 11/30/16.
//  Copyright © 2016 ISL. All rights reserved.
//

import Foundation

class WeatherData: NSObject {
    var rawUnixTime: Double
    var minTemp: Double
    var maxTemp: Double
    var summary: String
    
    init(rawUnixTime: Double, minTemp: Double, maxTemp: Double, summary: String) {
        self.rawUnixTime = rawUnixTime
        self.minTemp = minTemp
        self.maxTemp = maxTemp
        self.summary = summary
    }
}
