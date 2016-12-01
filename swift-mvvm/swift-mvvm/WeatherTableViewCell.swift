//
//  WeatherTableViewCell.swift
//  swift-mvvm
//
//  Created by Taylor Guidon on 11/30/16.
//  Copyright © 2016 ISL. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setup(_ viewModel: WeatherViewModel) {
        self.selectionStyle = .none
        
        guard let minTemp = viewModel.minTemp,
            let maxTemp = viewModel.maxTemp,
            let summary = viewModel.summary else {
                print("ViewModel is invalid")
                return
        }
        
        dateLabel.text = viewModel.dateString
        minTempLabel.text = String(minTemp)
        maxTempLabel.text = String(maxTemp)
        summaryLabel.text = summary
    }
}
