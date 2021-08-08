//
//  Network.swift
//  GymSoftHMAC
//
//  Created by mdy on 07.08.2021.
//


import Foundation

class Network {
  private var semaphore = DispatchSemaphore(value: 0)
  
  func getData(methodHttp: String, urlStr: String, needHmacAuth: Bool = true) -> Data? {
    var returnData: Data?
    var request = URLRequest(url: URL(string: urlStr)!) //,timeoutInterval: Double.infinity)
    request.httpMethod = methodHttp
    
    if needHmacAuth {
      let authHmacStr = Authentication().getAuthHeaderStr(methodHttp: methodHttp, urlStr: urlStr)
      request.addValue(authHmacStr, forHTTPHeaderField: "Authorization")
    }

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      guard let data = data else {
        print(String(describing: error))
        self.semaphore.signal()
        return
      }
      print((response as? HTTPURLResponse)?.statusCode ?? "")
      returnData = data
      self.semaphore.signal()
    }

    task.resume()
    semaphore.wait()
    return returnData
  }
}
