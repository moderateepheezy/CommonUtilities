//
//  String+Extension.swift
//  Common
//
//  Created by Afees Lawal on 6/26/19.
//  Copyright © 2019 Afees Lawal. All rights reserved.
//

import UIKit
import CommonCrypto

public extension String {
    
    var dateTime: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        print(self)
        guard let date = dateFormatter.date(from: self) else {return ""}
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        return timeFormatter.string(from: date)
    }
}

public extension NSMutableAttributedString {
    @discardableResult func first(_ text: String,
                                  withParagraph: Bool = false,
                                  paragraphlineSpacing: Int = 3,
                                  font: UIFont, textColor: UIColor) -> NSMutableAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 3
        let attrs: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: textColor]
        let textString = NSMutableAttributedString(string: text, attributes: attrs)
        if withParagraph {
            textString.addAttribute(
                NSAttributedString.Key.paragraphStyle,
                value: paragraphStyle,
                range: NSRange(location: 0, length: textString.length))
        }
        append(textString)
        
        return self
    }
    
    @discardableResult func next(_ text: String,
                                 font: UIFont, textColor: UIColor) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: textColor]
        let textString = NSMutableAttributedString(string: text, attributes: attrs)
        append(textString)
        
        return self
    }
}

extension String {
    
    func sha512Hex() -> String {
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA512_DIGEST_LENGTH))
        if let data = self.data(using: String.Encoding.utf8) {
            let value =  data as NSData
            CC_SHA512(value.bytes, CC_LONG(data.count), &digest)
            
        }
        var digestHex = ""
        for index in 0..<Int(CC_SHA512_DIGEST_LENGTH) {
            digestHex += String(format: "%02x", digest[index])
        }
        
        return digestHex
    }
}

extension String {
    
    var parseJSONString: Any? {
        
        let data = self.data(using: .utf8, allowLossyConversion: false)
        
        if let jsonData = data {
            // Will return an object or nil if JSON decoding fails
            do {
                return try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
            } catch let error {
                print(error.localizedDescription)
                return nil
            }
        } else {
            // Lossless conversion of the string was not possible
            return nil
        }
    }
}
