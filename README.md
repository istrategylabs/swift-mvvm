# Swift MVVM
A Swift Example of ISL's MVVM Technique


### 💰 Installation

1. Create an account or grab a new API key from [Dark Sky API](https://darksky.net/dev/)
2. Make sure CocoaPods is installed and up to date. Run `pod install` in the project directory.
3. At the root of the repo find the `keys_template.plst` file. Copy or rename to `keys.plist`.
4. Open `swift-mvvm.workspace` and drag the `keys.plist` into the project and add to target. Open the file an put your API Key in the plist under `apiKey`.
5. Build and run!


### ⛽️ Dependecies

To minimize code and highlight the MVVM structure, two dependencies were used to make network calls easier.

* Alamofire
* SwiftyJSON

### 📱 Project Overview

* `NetworkManager.swift` - Handles the GET Request to Dark Sky's API.
* `WeatherData.swift` - Data model with the information we want to show in the app.
* `WeatherViewModel.swift` - Takes in `WeatherData` and formats the data to be displayed in the views.
* `WeatherTableViewCell.swift` - Updates the view from the view model.
* `Utilities.swift` - Converts the payload into an array of `WeatherData`.



