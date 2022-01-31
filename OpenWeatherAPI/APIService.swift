//
//  APIServie.swift
//  OpenWeatherAPI
//
//  Created by yeop on 2022/01/31.
//

import Foundation

class APIService {
    static let shared = APIService()
    let apiKey = Bundle.main.APIKey
    
    func requestGetWeather(cityName: String, _ completion: @escaping (CurrentWeather?) -> Void) {
        if let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(apiKey)"){
            var request = URLRequest.init(url: url)
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request){ (data, response, error) in
                
                if let e = error{
                    print("e : \(e.localizedDescription)")
                    return
                }
                
                if let data = data, let weatherData = try?
                    JSONDecoder().decode(CurrentWeather.self, from: data){
                    completion(weatherData)
                    return
                }
                completion(nil)
                
            }.resume()
            
        }
    }
    
    typealias CompletionHandler = (Data) -> ()
    func requestGetImage(iconID: String, _ completion: @escaping CompletionHandler) {
        if let url = URL(string: "https://openweathermap.org/img/w/" + iconID + ".png"){
            var request = URLRequest.init(url: url)
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request){ (data, response, error) in
                
                if let e = error{
                    print("e : \(e.localizedDescription)")
                    return
                }
                
                if let data = data{
                    completion(data)
                    return
                }
                
            }.resume()
            
        }
    }
    
    func requestGetForecast(cityName: String, _ completion: @escaping (Forecast?) -> Void) {
        if let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=\(cityName)&appid=\(apiKey)"){
            var request = URLRequest.init(url: url)
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request){ (data, response, error) in
                
                if let e = error{
                    print("e : \(e.localizedDescription)")
                    return
                }
                
                if let data = data, let forcastData = try?
                    JSONDecoder().decode(Forecast.self, from: data){
                    completion(forcastData)
                    return
                }
                completion(nil)
                
            }.resume()
            
        }
    }
    
}
