//
//  HmacCKsha256.swift
//  GymSoftHMAC
//
//  Created by mdy on 07.08.2021.
//  Расчет HMAC подписи на CryptoKit (ver iOS > 13)

import Foundation
import CryptoKit

class HmacCKsha256 {

  private var secretKey: SymmetricKey
  
  init(secretStr: String) {
    self.secretKey = SymmetricKey(data: secretStr.data(using: .utf8)!)
  }
  
  func hash(_ rawText: String) -> String {
    let rawTextData = rawText.data(using: .utf8)!
    let hashDigest = HMAC<SHA256>.authenticationCode(for: rawTextData, using: secretKey)
    return Data(hashDigest).base64EncodedString()
  }

}
