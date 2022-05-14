//
//  Forecast.swift
//  WeatherAppScrolling
//
//  Created by DONG SHENG on 2021/7/25.
//

import SwiftUI

struct DayForecast: Identifiable{
    
    var id = UUID().uuidString
    var day: String
    var farenheit: CGFloat
    var imagr: String
}

var forecast = [

    DayForecast(day: "Today", farenheit: 32, imagr: "sun.min"),
    DayForecast(day: "Today", farenheit: 25, imagr: "cloud.sun"),
    DayForecast(day: "Today", farenheit: 35, imagr: "cloud.sun.bolt"),



]
