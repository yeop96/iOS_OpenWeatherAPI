//
//  WeatherTableViewCell.swift
//  OpenWeatherAPI
//
//  Created by yeop on 2022/01/31.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    static let identifier = "WeatherTableViewCell"
    
    //도시이름, 날씨 아이콘, 현재기온, 현재습도
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        return stackView
    }()
    let cityNameLabel = UILabel()
    let weatherIconImageView = UIImageView()
    let nowTemperatureLabel = UILabel()
    let nowHumidityLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(stackView)
        [stackView, cityNameLabel, weatherIconImageView, nowTemperatureLabel, nowHumidityLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        [cityNameLabel, weatherIconImageView, nowTemperatureLabel, nowHumidityLabel].forEach {
            stackView.addArrangedSubview($0)
        }
        weatherIconImageView.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            
            weatherIconImageView.widthAnchor.constraint(equalToConstant: 30),
            weatherIconImageView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }

}
