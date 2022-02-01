//
//  DetailWeatherViewController.swift
//  OpenWeatherAPI
//
//  Created by yeop on 2022/01/31.
//

import UIKit

class DetailWeatherViewController: BaseViewController{
    //도시이름, 날씨 아이콘, 현재기온, 체감기온, 헌재습도, 최저기온, 최고기온, 기압, 풍속, 날씨설명
    let cityNameLabel = UILabel()
    let weatherImageView = UIImageView()
    let nowTemperatureLabel = UILabel()
    let nowFeelTemperatureLabel = UILabel()
    let nowHumidityLabel = UILabel()
    let minTemperatureLabel = UILabel()
    let maxTemperatureLabel = UILabel()
    let pressLabel = UILabel()
    let windLabel = UILabel()
    let descriptionLabel = UILabel()
    let futureWeatherButton = UIButton()
    var weatherData: CurrentWeather?
    var imageData: Data?
    var forcastData: Forecast?
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func configure() {
        title = "현재 날씨 상세 정보"
        
        guard let weatherData = weatherData else { return }
        
        cityNameLabel.textAlignment = .center
        cityNameLabel.text = "\(Constants.citiesDitcionary[weatherData.name] ?? "") (\(weatherData.name))"
        
        guard let imageData = imageData else { return }
        weatherImageView.image = UIImage(data: imageData)
        
        nowTemperatureLabel.text = "현재기온 : " + String(Int(weatherData.main.temp) - 273) + "°C"
        
        nowFeelTemperatureLabel.text = "체감기온 : " + String(Int(weatherData.main.feelsLike) - 273) + "°C"
        
        nowHumidityLabel.text = "현재습도 : " + String(weatherData.main.humidity)
        
        minTemperatureLabel.text = "최저기온 : " + String(Int(weatherData.main.tempMin) - 273) + "°C"
        
        maxTemperatureLabel.text = "최고기온 : " + String(Int(weatherData.main.tempMax) - 273) + "°C"
        
        pressLabel.text = "기압 : " + String(weatherData.main.pressure)
        
        windLabel.text = "풍속 : " + String(weatherData.wind.speed)
        
        descriptionLabel.text = "설명 : " + weatherData.weather.first!.weatherDescription
        
        
        futureWeatherButton.backgroundColor = .label
        futureWeatherButton.setTitleColor(.systemBackground, for: .normal)
        futureWeatherButton.setTitle("미래 날씨", for: .normal)
        futureWeatherButton.layer.cornerRadius = 8
        futureWeatherButton.addTarget(self, action: #selector(futureWeatherButtonClicked), for: .touchUpInside)
    }
    
    override func setupConstraints() {
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        [cityNameLabel, weatherImageView, nowTemperatureLabel, nowFeelTemperatureLabel, nowHumidityLabel, minTemperatureLabel, maxTemperatureLabel, pressLabel, windLabel, descriptionLabel, futureWeatherButton].forEach {
            stackView.addArrangedSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        weatherImageView.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            
            weatherImageView.widthAnchor.constraint(equalToConstant: 40),
            weatherImageView.heightAnchor.constraint(equalToConstant: 40),
            
            futureWeatherButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            futureWeatherButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            futureWeatherButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    @objc func futureWeatherButtonClicked(){
        let nextViewController = FutureWeatherViewController()
        nextViewController.forcastData = self.forcastData
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
