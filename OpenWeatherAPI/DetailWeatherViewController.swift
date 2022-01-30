//
//  DetailWeatherViewController.swift
//  OpenWeatherAPI
//
//  Created by yeop on 2022/01/31.
//

import UIKit

class DetailWeatherViewController: UIViewController{
    //도시이름, 날씨 아이콘, 현재기온, 체감기온, 헌재습도, 최저기온, 최고기온, 기압, 풍속, 날씨설명
    
    let futureWeatherButton = UIButton()
    var weatherData: CurrentWeather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "현재 날씨 상세 정보"
        
        view.addSubview(futureWeatherButton)
        futureWeatherButton.translatesAutoresizingMaskIntoConstraints = false
        futureWeatherButton.backgroundColor = .label
        futureWeatherButton.setTitleColor(.systemBackground, for: .normal)
        futureWeatherButton.setTitle("미래 날씨", for: .normal)
        futureWeatherButton.addTarget(self, action: #selector(futureWeatherButtonClicked), for: .touchUpInside)
        NSLayoutConstraint.activate([
            futureWeatherButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -12),
            futureWeatherButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            futureWeatherButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)//,
            //futureWeatherButton.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    @objc func futureWeatherButtonClicked(){
        let nextViewController = FutureWeatherViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
