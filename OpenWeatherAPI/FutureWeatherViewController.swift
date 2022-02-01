//
//  FutureWeatherViewController.swift
//  OpenWeatherAPI
//
//  Created by yeop on 2022/01/31.
//

import UIKit

class FutureWeatherViewController: BaseViewController{

    var graphView: LineGraphView!
    var forcastData: Forecast?
    var minTemp = [CGFloat]()
    var maxTemp = [CGFloat]()
    var humidityTemp = [CGFloat]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        forcastData?.list.forEach({ listData in
            minTemp += [CGFloat(listData.main.tempMin)]
            maxTemp += [CGFloat(listData.main.tempMax)]
            humidityTemp += [CGFloat(listData.main.humidity)]
        })
        viewDidLoad()
    }
    
    override func configure() {
        title = "미래 날씨"
        let frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        let view = LineGraphView(frame: frame, minTemp: minTemp, maxTemp: maxTemp, humidity: humidityTemp)
        view.center = CGPoint(x: self.view.frame.size.width  / 2,
                              y: self.view.frame.size.height / 2)
        self.graphView = view
    }
    
    override func setupConstraints() {
        view.addSubview(graphView)
        graphView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            graphView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            graphView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            graphView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            graphView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
        ])
    }
}
