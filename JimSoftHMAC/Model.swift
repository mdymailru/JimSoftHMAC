//
//  Model.swift
//  GymSoftHMAC
//
//  Created by mdy on 07.08.2021.
//

import Foundation

struct EndPointsModel: Decodable {
  var endPoints: [EndPoint] = []
  
  init() {
    let data = Network().getData(methodHttp: "GET", urlStr: "https://api.pfms.cloudworkshop.ru/configuration/get")
        
    guard let data = data else { return }
    let endPoints = try? JSONDecoder().decode([EndPoint].self, from: data)
    
    if let endPoints = endPoints {
       self.endPoints = endPoints
    }
  }
}

struct EndPoint: Decodable {
  var name: String

}


