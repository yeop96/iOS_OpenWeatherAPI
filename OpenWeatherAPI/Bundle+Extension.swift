//
//  Bundle+Extension.swift
//  OpenWeatherAPI
//
//  Created by yeop on 2022/01/31.
//

import Foundation

//APIInfo.plist
extension Bundle {
    var APIKey: String {
        guard let file = self.path(forResource: "APIInfo", ofType: "plist") else { fatalError("APIInfo.plist 파일이 없습니다.") }
        guard let resource = NSDictionary(contentsOfFile: file) else { fatalError("파일 형식 에러") }
        guard let key = resource["APIKey"] as? String else { fatalError("APIInfo에 APIKey를 설정해주세요.")}
        return key
    }
}
