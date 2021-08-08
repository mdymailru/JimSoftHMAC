//
//  HmacCCsha256.swift
//  GymSoftHMAC
//
//  Created by mdy on 07.08.2021.
//  Альтернативный расчет HMAC подписи на CommonCrypto (ver iOS < 13)

import Foundation
import CommonCrypto

class HmacCCsha256 {
  
 private var secretKey: String
  
  init(secretStr: String) {
    self.secretKey = secretStr
  }
  
  func hash(_ rawText: String) -> String {
    var digest = Data(count: Int(CC_SHA256_DIGEST_LENGTH))
    digest.withUnsafeMutableBytes {
        CCHmac(CCHmacAlgorithm(kCCHmacAlgSHA256), secretKey, secretKey.utf8.count, rawText, rawText.utf8.count, $0.baseAddress)
    }
  return digest.base64EncodedString()
  }
}
