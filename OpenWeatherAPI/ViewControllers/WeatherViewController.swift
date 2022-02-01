//
//  WeatherViewController.swift
//  OpenWeatherAPI
//
//  Created by yeop on 2022/01/30.
//

import UIKit

class WeatherViewController: BaseViewController {

    let tableView = UITableView()
    //공주, 광주(전라남도), 구미, 군산, 대구, 대전, 목포, 부산, 서산, 서울, 속초, 수원, 순천, 울산, 익산, 전주, 제주시, 천안, 청주, 춘천
    
    
    var currentWeathers = [CurrentWeather]()
    var iconImageData: [Data] = []{
        didSet{
            tableView.reloadData()
        }
        
    }
    var weatherForcasts = [Forecast]()
    
    override func loadView() {
        super.loadView()
        Constants.cities.forEach { cityName in
            APIService.shared.requestGetWeather(cityName: cityName) { weatherData in
                guard let weatherData = weatherData else { return }
                DispatchQueue.main.async {
                    self.currentWeathers += [weatherData]
                    APIService.shared.requestGetImage(iconID: weatherData.weather.first?.icon ?? "") { data in
                        DispatchQueue.main.async {
                            self.iconImageData += [data]
                        }
                    }
                    
                    APIService.shared.requestGetForecast(cityName: cityName) { forecastData in
                        guard let forecastData = forecastData else { return }
                        DispatchQueue.main.async {
                            self.weatherForcasts += [forecastData]
                        }
                    }
                    
                }
            }
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func configure() {
        title = "도시별 현재 날씨"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: WeatherTableViewCell.identifier)
        tableView.separatorStyle = .none
        
    }
    
    override func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
         ])
    }


}

extension WeatherViewController: UITableViewDelegate, UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iconImageData.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "도시명 / 날씨 / 현재온도 / 습도"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier) as? WeatherTableViewCell else{
            return UITableViewCell()
        }
        let weatherData = currentWeathers[indexPath.row]
        cell.cityNameLabel.text = Constants.citiesDitcionary[weatherData.name]
        cell.weatherIconImageView.image = UIImage(data: iconImageData[indexPath.row])
        cell.nowTemperatureLabel.text = String(Int(weatherData.main.temp) - 273) + "°C"
        cell.nowHumidityLabel.text = String(weatherData.main.humidity)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextViewController = DetailWeatherViewController()
        nextViewController.weatherData = currentWeathers[indexPath.row]
        nextViewController.imageData = iconImageData[indexPath.row]
        nextViewController.forcastData = weatherForcasts[indexPath.row]
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
}
