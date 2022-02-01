//
//  LineGraphView.swift
//  OpenWeatherAPI
//
//  Created by yeop on 2022/02/02.
//

import UIKit

class LineGraphView: UIView {
    
    var minTemp: [CGFloat] = []
    var maxTemp: [CGFloat] = []
    var humidity: [CGFloat] = []
    
    var minTempPath: UIBezierPath!
    var maxTempPath: UIBezierPath!
    var humidityPath: UIBezierPath!
    
    let minTempLayer = CAShapeLayer()
    let maxTempLayer = CAShapeLayer()
    let humidityLayer = CAShapeLayer()

    init(frame: CGRect,  minTemp: [CGFloat], maxTemp: [CGFloat], humidity: [CGFloat]) {
        super.init(frame: frame)
        
        self.minTemp = minTemp
        self.maxTemp = maxTemp
        self.humidity = humidity
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.minTempPath = UIBezierPath()
        self.maxTempPath = UIBezierPath()
        self.humidityPath = UIBezierPath()
        
        self.layer.addSublayer(minTempLayer)
        self.layer.addSublayer(maxTempLayer)
        self.layer.addSublayer(humidityLayer)

        let xOffset: CGFloat = self.frame.width / CGFloat(minTemp.count)
        //let yOffset: CGFloat = self.frame.height + CGFloat(minTemp.max()!)
        
        var minTempCurrentX: CGFloat = 0
        var maxTempCurrentX: CGFloat = 0
        var humidityCurrentX: CGFloat = 0
        self.minTempPath.move(to: CGPoint(x: minTempCurrentX, y: self.frame.height))
        self.maxTempPath.move(to: CGPoint(x: maxTempCurrentX, y: self.frame.height))
        self.humidityPath.move(to: CGPoint(x: humidityCurrentX, y: self.frame.height))
        
        for i in 0..<minTemp.count {
            minTempCurrentX += xOffset
            let newPosition = CGPoint(x: minTempCurrentX,
                                      y: self.frame.height - self.minTemp[i])
            self.minTempPath.addLine(to: newPosition)
        }
        for i in 0..<maxTemp.count {
            maxTempCurrentX += xOffset
            let newPosition = CGPoint(x: maxTempCurrentX,
                                      y: self.frame.height - self.maxTemp[i])
            self.maxTempPath.addLine(to: newPosition)
        }
        for i in 0..<humidity.count {
            humidityCurrentX += xOffset
            let newPosition = CGPoint(x: humidityCurrentX,
                                      y: self.frame.height - self.humidity[i])
            self.humidityPath.addLine(to: newPosition)
        }
        
        
        minTempLayer.fillColor = nil
        minTempLayer.strokeColor = UIColor.blue.cgColor
        minTempLayer.lineWidth = 2
        
        maxTempLayer.fillColor = nil
        maxTempLayer.strokeColor = UIColor.red.cgColor
        maxTempLayer.lineWidth = 2
        
        humidityLayer.fillColor = nil
        humidityLayer.strokeColor = UIColor.black.cgColor
        humidityLayer.lineWidth = 2
        
        self.minTempLayer.path = minTempPath.cgPath
        self.maxTempLayer.path = maxTempPath.cgPath
        self.humidityLayer.path = humidityPath.cgPath
    }
}
