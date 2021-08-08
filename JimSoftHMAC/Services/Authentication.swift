//
//  Authentication.swift
//  GymSoftHMAC
//
//  Created by mdy on 08.08.2021.
//

import Foundation

class Authentication {
  
  private let clientId = "TestCandidate"
  private let clientSecret = "1CB5DEAF26B34E23B59DC64726CB44A27"
    
  func getAuthHeaderStr(methodHttp: String, urlStr: String) -> String {
    let nonce = getNonce()
    let timeStamp = getTimeStamp()
    let rawSignature = clientId + methodHttp + decodeUri(urlStr) + nonce + timeStamp
    
  //let hmac = HmacCCsha256(secretStr: clientSecret)  //используя CommonCrypto
    let hmac = HmacCKsha256(secretStr: clientSecret)  //используя CryptoKit
     
    return "amx " + clientId + ":" + hmac.hash(rawSignature) + ":" + nonce + ":" + timeStamp
  }
  
  private func getTimeStamp() -> String {
    return "\(Int64(Date().timeIntervalSince1970))"
  }
  
  private func getNonce() -> String {
    return UUID().uuidString.filter { $0 != "-" }
  }
  
  private func decodeUri(_ urlStr: String) -> String {
    return urlStr.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)?.lowercased() ?? urlStr
  }
  
}


