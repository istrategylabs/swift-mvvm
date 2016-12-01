//
//  NetworkManager.swift
//  swift-mvvm
//
//  Created by Taylor Guidon on 11/30/16.
//  Copyright © 2016 ISL. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkManagerDelegate {
    func dataReceived(data: Any?, error: NSError?)
}

class NetworkManager: NSObject {
    let baseURLString: String = "https://api.darksky.net/forecast/"
    var baseURLWithAPIKeyString: String
    var delegate: NetworkManagerDelegate?
    
    init(apiKey: String) {
        self.baseURLWithAPIKeyString = "\(self.baseURLString)\(apiKey)/"
        
        super.init()
    }
    
    func getWeatherForCoordinate(coordinate: String) {
        let requestURL: String = "\(baseURLWithAPIKeyString)\(coordinate)"
        Alamofire.request(requestURL).responseJSON { (response) in
            switch response.result {
            case .success:
                guard let json = response.result.value else {
                    return
                }
                self.delegate?.dataReceived(data: json, error: nil)
            case .failure(let error):
                self.delegate?.dataReceived(data: nil, error: error as NSError)
            }
        }
    }
}
