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
    let cityNameLabel = UILabel()
    let weatherIconImageView = UIImageView()
    let nowTemperatureLabel = UILabel()
    let nowHumidityLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        [cityNameLabel, weatherIconImageView, nowTemperatureLabel, nowHumidityLabel].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            cityNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            cityNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            cityNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            cityNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
            
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }

}
